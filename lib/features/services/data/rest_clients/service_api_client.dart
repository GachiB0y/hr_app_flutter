import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:hr_app_flutter/core/components/rest_clients/api_client_exception.dart';
import 'package:hr_app_flutter/core/components/rest_clients/rest_client.dart';
import 'package:hr_app_flutter/core/constant/constants.dart';
import 'package:hr_app_flutter/features/schedule_bus/model/schedule_bus_entity.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:hr_app_flutter/features/services/model/bag_report_entity/bag_report_entity.dart';
import 'package:hr_app_flutter/features/services/model/lean_productions_entity/lean_production_form_entity/lean_production_form_entity.dart';
import 'package:hr_app_flutter/features/services/model/lean_productions_entity/my_lean_productions_entity/my_lean_productions_entity.dart';
import 'package:hr_app_flutter/features/services/model/service/service.dart';

abstract interface class IServiceProvider {
  Future<List<Service>> getServices();
  Future<ScheduleBus> getScheduleBus();
  Future<List<MyLeanProductionsEntity>> getMyLeanProductions();
  Future<bool> sendFormLeanProduction({
    required LeanProductionFormEntity formEntity,
  });

  Future<void> downloadFileWithLeanProduction({
    required String url,
  });
  Future<bool> submitBagReportForm({required BagReportEntity bagReportEntity});
}

class ServiceProviderImpl implements IServiceProvider {
  final RestClient _httpService;
  ServiceProviderImpl(this._httpService);

  @override
  Future<List<Service>> getServices() async {
    final response = await _httpService.get(
      '/admin/avalible_services_list',
    );

    if (response
        case {
          'result': final List<dynamic> data,
        }) {
      final result = data
          .map((item) => Service.fromJson(item as Map<String, dynamic>))
          .toList();
      return result;
    }
    throw Exception('Error fetching Services ');
  }

  @override
  Future<ScheduleBus> getScheduleBus() async {
    final response = await _httpService.get(
      '/bus/get_destination',
    );

    if (response
        case {
          'result': final List<dynamic> data,
        }) {
      final result = ScheduleBus.fromJson(response);
      return result;
    }
    throw Exception('Error get Schedule Bus');
  }

  @override
  Future<bool> sendFormLeanProduction({
    required LeanProductionFormEntity formEntity,
  }) async {
    final newFields = <String, String>{
      'issue':
          '{     "realized": ${formEntity.realized},     "first_implementer": ${formEntity.firstImplementer},     "second_implementer": ${formEntity.secondImplementer},     "third_implementer": ${formEntity.thirdImplementer},     "issue": "${formEntity.issue}",     "solution": "${formEntity.solution}",     "expenses": "${formEntity.expenses}",     "benefit": "${formEntity.benefit}" }',
    };

    final response = await _httpService.post(
      '/lean_fabrication/create_proposal',
      pathsToFiles: formEntity.paths,
      body: newFields,
    );

    if (response
        case {
          'result': final Map<String, Object?> data,
        }) {
      return true;
    }
    throw Exception('Error send Form Lean Production');

    // } else if (response.statusCode == 400) {
    //   throw ApiClientException(ApiClientExceptionType.addTags);
    // } else {
    //   throw Exception('Error send Form Lean Production');
    // }
  }

  @override
  Future<List<MyLeanProductionsEntity>> getMyLeanProductions() async {
    final response = await _httpService.get(
      '/lean_fabrication/my_proposals',
    );

    if (response
        case {
          'result': final Map<String, Object?> data,
        }) {
      final result = (data['offers']! as List<Map<String, dynamic>>)
          .map(MyLeanProductionsEntity.fromJson)
          .toList();
      return result;
    }
    throw Exception('Error fetching My Proposals');

    // if (response.statusCode == 200) {
    //   final jsonResponse = await response.stream.bytesToString();
    //   final jsonData = jsonDecode(jsonResponse);
    //   final List<MyLeanProductionsEntity> result =
    //       (jsonData['result']['offers'] as List<dynamic>)
    //           .map((item) => MyLeanProductionsEntity.fromJson(item))
    //           .toList();
    //   return result;
    // } else {
    //   throw Exception('Error fetching My Proposals');
    // }
  }

  Future<void> openFile({
    required PermissionStatus statusStorage,
    required File newFile,
    bool isStatusPhotos = false,
  }) async {
    if (isStatusPhotos) {
      final statusPhotos = await Permission.photos.status;

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
            throw ApiClientException(
              ApiClientExceptionType.openFileDocuments,
            );
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
            throw ApiClientException(ApiClientExceptionType.openFileImage);
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
            throw ApiClientException(
              ApiClientExceptionType.openFileDocuments,
            );
          }
        }
      }
    }
  }

  @override
  Future<void> downloadFileWithLeanProduction({
    required String url,
  }) async {
    final uri = '$urlAdress/lean_fabrication/download_file?url=$url';
    final response = await _httpService.post(uri, body: {});

    final fileName = url.split('/').last;

    if (response
        case {
          'result': final Map<String, Object?> data,
        }) {
      try {
        ///  Выбираем директорию для сохранения в зависимочти от платформы
        Directory? directory;
        if (Platform.isAndroid) {
          directory = await getExternalStorageDirectory();
        } else if (Platform.isIOS) {
          directory = await getApplicationDocumentsDirectory();
        }

        /// TODO на время сделал так иначе не скачивается файл нужно с response паолучать не map, а stream
        final dataList = data.values.cast<int>().toList();
        // final jsonResponse = await response.stream.toBytes();

        /// Создаем путь сохраненного файла
        final filePath = '${directory!.path}/$fileName';

        final file = File(filePath);
        final isExists = await file.exists();

        var newFile = file;
        if (isExists) {
          await file.delete();
        }
        newFile = await file.writeAsBytes(dataList);

        final statusStorage = await Permission.manageExternalStorage.status;

        if (Platform.isAndroid) {
          final androidInfo = await DeviceInfoPlugin().androidInfo;
          final version = androidInfo.version.release;
          final verInt = int.parse(version);

          if (verInt <= 12) {
            await openFile(
              newFile: newFile,
              statusStorage: statusStorage,
            );
          } else {
            await openFile(
              newFile: newFile,
              statusStorage: statusStorage,
              isStatusPhotos: true,
            );
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
  Future<bool> submitBagReportForm({
    required BagReportEntity bagReportEntity,
  }) async {
    final newFields = <String, String>{
      'forminfo':
          '{"title": "${bagReportEntity.title}", "description": "${bagReportEntity.description}"}',
    };

    final response = await _httpService.post(
      '/report/create',
      pathsToFiles: bagReportEntity.pathsToFiles,
      body: newFields,
    );

    if (response
        case {
          'result': final Map<String, Object?> data,
        }) {
      return true;
    }
    throw Exception('Error submit Bag Report Form');
    // } else if (response.statusCode == 400) {
    //   throw ApiClientException(ApiClientExceptionType.addTags);
    // } else {
    //   throw Exception('Error submit Bag Report Form');
    // }
  }
}
