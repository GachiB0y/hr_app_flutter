import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:hr_app_flutter/constants.dart';
import 'package:hr_app_flutter/domain/api_client/api_client.dart';
import 'package:hr_app_flutter/domain/api_client/api_client_exception.dart';
import 'package:hr_app_flutter/domain/entity/lean_productions_entity/lean_production_form_entity/lean_production_form_entity.dart';
import 'package:hr_app_flutter/domain/entity/lean_productions_entity/my_lean_productions_entity/my_lean_productions_entity.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hr_app_flutter/domain/entity/schedule_bus_entity/schedule_bus_entity.dart';
import 'package:hr_app_flutter/domain/entity/service/service.dart';

abstract interface class ServiceProvider {
  Future<List<Service>> getServices({required String userToken});
  Future<ScheduleBus> getScheduleBus({required String userToken});
  Future<List<MyLeanProductionsEntity>> getMyLeanProductions(
      {required String userToken});
  Future<bool> sendFormLeanProduction(
      {required LeanProductionFormEntity formEntity,
      required String userToken});

  Future<void> downloadFileWithLeanProduction(
      {required String url, required String userToken});
}

class ServiceProviderImpl implements ServiceProvider {
  final IHTTPService _httpService;
  ServiceProviderImpl(this._httpService);

  @override
  Future<List<Service>> getServices({required String userToken}) async {
    String uri = '$urlAdress/admin/avalible_services_list';
    final response = await _httpService.get(uri: uri, userToken: userToken);

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
  Future<ScheduleBus> getScheduleBus({required String userToken}) async {
    String uri = '$urlAdress/bus/get_destination';
    final response = await _httpService.get(uri: uri, userToken: userToken);
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
      required String userToken}) async {
    String uri = '$urlAdress/lean_fabrication/create_proposal?';

    final Map<String, String> newFields = {
      'issue':
          '{     "realized": ${formEntity.realized},     "first_implementer": ${formEntity.firstImplementer},     "second_implementer": ${formEntity.secondImplementer},     "third_implementer": ${formEntity.thirdImplementer},     "issue": "${formEntity.issue}",     "solution": "${formEntity.solution}",     "expenses": "${formEntity.expenses}",     "benefit": "${formEntity.benefit}" }'
    };

    final response = await _httpService.postWithFile(
      uri: uri,
      userToken: userToken,
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
      {required String userToken}) async {
    String uri = '$urlAdress/lean_fabrication/my_proposals';
    final response = await _httpService.get(uri: uri, userToken: userToken);

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

  @override
  Future<void> downloadFileWithLeanProduction(
      {required String url, required String userToken}) async {
    String uri = '$urlAdress/lean_fabrication/download_file?url=$url';
    final response =
        await _httpService.post(uri: uri, userToken: userToken, body: null);

    final fileName = url.split('/').last;

    if (response.statusCode == 200) {
      final jsonResponse = await response.stream.toBytes();

      Directory directory = await getApplicationDocumentsDirectory();
      String filePath = '${directory.path}/$fileName';

      File file = File(filePath);

      await file.writeAsBytes(jsonResponse);

      String? result = await FilePicker.platform.saveFile(fileName: fileName);

      // final jsonData = jsonDecode(jsonResponse);
      // final List<MyLeanProductionsEntity> result =
      //     (jsonData['result']['offers'] as List<dynamic>)
      //         .map((item) => MyLeanProductionsEntity.fromJson(item))
      //         .toList();
    } else {
      throw Exception('Error fetching My Proposals');
    }
  }
}
