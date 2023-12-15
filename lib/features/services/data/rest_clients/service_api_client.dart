import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:hr_app_flutter/core/components/database/rest_clients/api_client.dart';
import 'package:hr_app_flutter/core/components/database/rest_clients/api_client_exception.dart';
import 'package:hr_app_flutter/core/constant/constants.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../model/bag_report_entity/bag_report_entity.dart';
import '../../model/lean_productions_entity/lean_production_form_entity/lean_production_form_entity.dart';
import '../../model/lean_productions_entity/my_lean_productions_entity/my_lean_productions_entity.dart';
import '../../model/schedule_bus_entity/schedule_bus_entity.dart';
import '../../model/service/service.dart';

abstract interface class IServiceProvider {
  Future<List<Service>> getServices({
    required String accessToken,
  });
  Future<ScheduleBus> getScheduleBus({required String accessToken});
  Future<List<MyLeanProductionsEntity>> getMyLeanProductions(
      {required String accessToken});
  Future<bool> sendFormLeanProduction(
      {required LeanProductionFormEntity formEntity,
      required String accessToken});

  Future<void> downloadFileWithLeanProduction(
      {required String url, required String accessToken});
  Future<bool> submitBagReportForm(
      {required String accessToken, required BagReportEntity bagReportEntity});
}

class ServiceProviderImpl implements IServiceProvider {
  final IHTTPService _httpService;
  ServiceProviderImpl(this._httpService);

  @override
  Future<List<Service>> getServices({
    required String accessToken,
  }) async {
    String uri = '$urlAdress/admin/avalible_services_list';
    final response = await _httpService.get(uri: uri, userToken: accessToken);

    if (response.statusCode == 200) {
      final jsonResponse = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonResponse);
      final List<Service> result = (jsonData['result'] as List<dynamic>)
          .map((item) => Service.fromJson(item))
          .toList();
      return result;
    } else {
      throw Exception('Error fetching User Info');
    }
  }

  @override
  Future<ScheduleBus> getScheduleBus({required String accessToken}) async {
    String uri = '$urlAdress/bus/get_destination';
    final response = await _httpService.get(uri: uri, userToken: accessToken);
    if (response.statusCode == 200) {
      final jsonResponse = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonResponse);

      final ScheduleBus result = ScheduleBus.fromJson(jsonData);
      return result;
    } else {
      throw Exception('Error get Schedule Bus');
    }
  }

  @override
  Future<bool> sendFormLeanProduction(
      {required LeanProductionFormEntity formEntity,
      required String accessToken}) async {
    String uri = '$urlAdress/lean_fabrication/create_proposal?';

    final Map<String, String> newFields = {
      'issue':
          '{     "realized": ${formEntity.realized},     "first_implementer": ${formEntity.firstImplementer},     "second_implementer": ${formEntity.secondImplementer},     "third_implementer": ${formEntity.thirdImplementer},     "issue": "${formEntity.issue}",     "solution": "${formEntity.solution}",     "expenses": "${formEntity.expenses}",     "benefit": "${formEntity.benefit}" }'
    };

    final response = await _httpService.postWithFile(
      uri: uri,
      userToken: accessToken,
      paths: formEntity.paths,
      fieldsNew: newFields,
    );
    if (response.statusCode == 201) {
      return true;
    } else if (response.statusCode == 400) {
      throw ApiClientException(ApiClientExceptionType.addTags);
    } else {
      throw Exception('Error send Form Lean Production');
    }
  }

  @override
  Future<List<MyLeanProductionsEntity>> getMyLeanProductions(
      {required String accessToken}) async {
    String uri = '$urlAdress/lean_fabrication/my_proposals';
    final response = await _httpService.get(uri: uri, userToken: accessToken);

    if (response.statusCode == 200) {
      final jsonResponse = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonResponse);
      final List<MyLeanProductionsEntity> result =
          (jsonData['result']['offers'] as List<dynamic>)
              .map((item) => MyLeanProductionsEntity.fromJson(item))
              .toList();
      return result;
    } else {
      throw Exception('Error fetching My Proposals');
    }
  }

  Future<void> openFile(
      {required PermissionStatus statusStorage,
      bool isStatusPhotos = false,
      required File newFile}) async {
    if (isStatusPhotos) {
      PermissionStatus statusPhotos = await Permission.photos.status;

      if (statusStorage.isGranted && statusPhotos.isGranted) {
        // Разрешение уже предоставлено, открываем файл
        OpenFile.open(newFile.path);
      } else {
        if (statusStorage.isDenied || statusStorage.isPermanentlyDenied) {
          // Разрешение не предоставлено, запрашиваем его у пользователя
          if (await Permission.manageExternalStorage.request().isGranted) {
            // Разрешение предоставлено, открываем файл
            OpenFile.open(newFile.path);
            return;
          } else {
            // Пользователь отказал в предоставлении разрешения На Документы
            // Обработайте это соответствующим образом
            throw (ApiClientException(
                ApiClientExceptionType.openFileDocuments));
          }
        } else if (statusPhotos.isDenied || statusPhotos.isPermanentlyDenied) {
          // Разрешение не предоставлено, запрашиваем его у пользователя

          final perm = await Permission.photos.request();
          if (perm.isGranted) {
            // Разрешение предоставлено, открываем файл
            OpenFile.open(newFile.path);
            return;
          } else {
            // Пользователь отказал в предоставлении разрешения На Фото
            // Обработайте это соответствующим образом
            throw (ApiClientException(ApiClientExceptionType.openFileImage));
          }
        }
      }
    } else {
      if (statusStorage.isGranted) {
        // Разрешение уже предоставлено, открываем файл
        OpenFile.open(newFile.path);
      } else {
        if (statusStorage.isDenied || statusStorage.isPermanentlyDenied) {
          // Разрешение не предоставлено, запрашиваем его у пользователя
          PermissionStatus perm;

          perm = await Permission.manageExternalStorage.request();

          if (perm.isGranted) {
            // Разрешение предоставлено, открываем файл
            OpenFile.open(newFile.path);
            return;
          } else {
            // Пользователь отказал в предоставлении разрешения На Документы
            // Обработайте это соответствующим образом
            throw (ApiClientException(
                ApiClientExceptionType.openFileDocuments));
          }
        }
      }
    }
  }

  @override
  Future<void> downloadFileWithLeanProduction(
      {required String url, required String accessToken}) async {
    String uri = '$urlAdress/lean_fabrication/download_file?url=$url';
    final response =
        await _httpService.post(uri: uri, userToken: accessToken, body: null);

    final fileName = url.split('/').last;

    if (response.statusCode == 200) {
      try {
        ///  Выбираем директорию для сохранения в зависимочти от платформы
        Directory? directory;
        if (Platform.isAndroid) {
          directory = await getExternalStorageDirectory();
        } else if (Platform.isIOS) {
          directory = await getApplicationDocumentsDirectory();
        }

        final jsonResponse = await response.stream.toBytes();

        /// Создаем путь сохраненного файла
        String filePath = '${directory!.path}/$fileName';

        File file = File(filePath);
        final isExists = await file.exists();

        File newFile = file;
        if (isExists) {
          await file.delete();
        }
        newFile = await file.writeAsBytes(jsonResponse);

        PermissionStatus statusStorage =
            await Permission.manageExternalStorage.status;

        if (Platform.isAndroid) {
          var androidInfo = await DeviceInfoPlugin().androidInfo;
          final version = androidInfo.version.release;
          final verInt = int.parse(version);

          if (verInt <= 12) {
            await openFile(
                newFile: newFile,
                statusStorage: statusStorage,
                isStatusPhotos: false);
          } else {
            await openFile(
                newFile: newFile,
                statusStorage: statusStorage,
                isStatusPhotos: true);
          }
        } else {
          /// Если это IOS

          OpenFile.open(newFile.path);
        }
      } on ApiClientException {
        rethrow;
      } catch (e) {
        throw Exception(e);
      }
    } else {
      throw Exception('Error fetching My Proposals');
    }
  }

  @override
  Future<bool> submitBagReportForm(
      {required String accessToken,
      required BagReportEntity bagReportEntity}) async {
    String uri = '$urlAdress/report/create';

    final Map<String, String> newFields = {
      'forminfo':
          '{"title": "${bagReportEntity.title}", "description": "${bagReportEntity.description}"}'
    };

    final response = await _httpService.postWithFile(
      uri: uri,
      userToken: accessToken,
      paths: bagReportEntity.pathsToFiles,
      fieldsNew: newFields,
    );
    if (response.statusCode == 201) {
      return true;
    } else if (response.statusCode == 400) {
      throw ApiClientException(ApiClientExceptionType.addTags);
    } else {
      throw Exception('Error submit Bag Report Form');
    }
  }
}
