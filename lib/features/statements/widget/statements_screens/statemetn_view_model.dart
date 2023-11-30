import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../model/statements/statements.dart';

class StatementViewModelWidget extends Listenable {
  // Создание списка слушателей
  final List<VoidCallback> _listeners = [];
  StatementFormInfoToSubmit? formInfo;
  String? idParticipant;
  String? documentType;
  bool isSumbitting = false;

  // Метод для добавления слушателей
  @override
  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  // Метод для удаления слушателей
  @override
  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }

  // Метод для уведомления слушателей об изменениях
  void notifyListeners() {
    for (final listener in _listeners) {
      listener();
    }
  }

  Map<String, String?> convertListToMap(List<TemplateField> textFieldsData) {
    Map<String, String?> resultMap = {};

    for (TemplateField field in textFieldsData) {
      resultMap[field.name] = field.value;
    }

    return resultMap;
  }

  bool validateForm({required GlobalKey<FormState> formKey}) {
    if (formKey.currentState != null) {
      return formKey.currentState!.validate();
    }
    return false;
  }

  void createFormInfo({
    required List<TemplateField> textFieldsData,
  }) {
    final Map<String, String?> resultMap = convertListToMap(textFieldsData);
    final TemplateFormStatementsEntity templateFormStatementsEntity =
        TemplateFormStatementsEntity.fromJson(resultMap);

    formInfo = StatementFormInfoToSubmit(
        documentType: documentType ?? '',
        template: templateFormStatementsEntity,
        participantsTo: idParticipant ?? '');
  }

  void createDocumentType({required String documentType}) {
    if (this.documentType != documentType) {
      this.documentType = documentType;
    }
  }

  void createIdParticipant({required String idParticipant}) {
    if (this.idParticipant != idParticipant) {
      this.idParticipant = idParticipant;
    }
  }

  void changeIsSubmiting(bool submiting) {
    isSumbitting = submiting;
    notifyListeners();
  }
}
