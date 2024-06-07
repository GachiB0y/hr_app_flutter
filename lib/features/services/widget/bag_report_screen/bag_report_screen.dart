import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/core/components/database/custom_provider/inherit_widget.dart';
import 'package:hr_app_flutter/core/widget/components/custom_text_form_field/custom_text_form_field.dart';
import 'package:hr_app_flutter/core/widget/components/file_picker_custom/file_picker_custom_floating_action_button.dart';
import 'package:hr_app_flutter/core/widget/components/file_picker_custom/file_picker_custom_model.dart';
import 'package:hr_app_flutter/core/widget/components/file_picker_custom/file_picker_custom_widget.dart';
import 'package:hr_app_flutter/features/initialiazation/widget/dependencies_scope.dart';

import '../../bloc/bag_report_bloc/bag_report_bloc.dart';
import '../../model/bag_report_entity/bag_report_entity.dart';

class BagReportScreen extends StatefulWidget {
  const BagReportScreen({
    super.key,
  });

  @override
  State<BagReportScreen> createState() => _BagReportScreenState();
}

class _BagReportScreenState extends State<BagReportScreen> {
  final _model = FilePickerCustomModel();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvaider<FilePickerCustomModel>(
      model: _model,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).canvasColor,
          title: const Text('Сообщить об ошибке'),
        ),
        body: const SafeArea(child: BagReportFormWidget()),
        floatingActionButton: const CustomFABFromImagePicker(),
      ),
    );
  }
}

class BagReportFormWidget extends StatefulWidget {
  const BagReportFormWidget({super.key});

  @override
  State<BagReportFormWidget> createState() => _BagReportFormWidgetState();
}

class _BagReportFormWidgetState extends State<BagReportFormWidget> {
  final _formKeyBagReport = GlobalKey<FormState>();
  bool isShowErrorText = false;
  final TextEditingController inputControllerDescription =
      TextEditingController();
  final TextEditingController inputControllerTitle = TextEditingController();
  late final BagReportBLoC blocBagReport;

  List<FocusNode> focusNodes = List.generate(3, (index) => FocusNode());
  @override
  void initState() {
    super.initState();

    blocBagReport = BagReportBLoC(
      repositoryService: DependenciesScope.of(context).serviceRepository,
    );
    for (var focusNode in focusNodes) {
      focusNode.addListener(() {
        if (!focusNode.hasFocus) {
          FocusScope.of(context).unfocus();
        }
      });
    }
  }

  @override
  void dispose() {
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    blocBagReport.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = ChangeNotifierProvaider.watch<
        ChangeNotifierProvaider<FilePickerCustomModel>,
        FilePickerCustomModel>(context);
    return BlocListener<BagReportBLoC, BagReportState>(
      bloc: blocBagReport,
      listener: (context, state) {
        if (state is BagReportState$Error) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content:
                    Center(child: Text('Ошибка отправки.\nПопробуйте снова.')),
                duration: Duration(seconds: 6),
              ),
            );
        } else if (state is BagReportState$Successful) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Center(
                    child: Text(
                  'Данные успешно отправленны!',
                  style: TextStyle(fontSize: 20),
                )),
                duration: Duration(seconds: 2),
              ),
            ).closed.then((value) => Navigator.pop(context));
        }
      },
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          margin: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKeyBagReport,
            child: Column(
              children: [
                CustomTextFormField(
                  focusNode: focusNodes[0],
                  nameController: inputControllerTitle,
                  iconData: const Icon(Icons.priority_high),
                  inputText: 'Заголовок',
                ),
                const SizedBox(
                  height: 16.0,
                ),
                CustomTextFormField(
                  focusNode: focusNodes[1],
                  nameController: inputControllerDescription,
                  iconData: const Icon(Icons.mode_edit),
                  inputText: 'Описание ошибки',
                ),
                model?.fileNames.isEmpty == false
                    ? const Padding(
                        padding: EdgeInsets.only(
                          top: 16.0,
                        ),
                        child: FilePickerWidget(),
                      )
                    : const SizedBox.shrink(),
                isShowErrorText
                    ? const Text(
                        'Нужно прикрепить хотя бы 1 файл ',
                        style: TextStyle(color: Colors.red),
                      )
                    : const SizedBox.shrink(),
                const SizedBox(
                  height: 8.0,
                ),
                ElevatedButton(
                  child: Text(
                    'Отправить',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                  onPressed: () {
                    if (_formKeyBagReport.currentState != null) {
                      if (_formKeyBagReport.currentState!.validate() &&
                          model?.paths != null &&
                          model!.paths.isNotEmpty) {
                        setState(() {
                          isShowErrorText = false;
                        });
                        final BagReportEntity formInfo = BagReportEntity(
                          description: inputControllerDescription.text,
                          title: inputControllerTitle.text,
                          pathsToFiles:
                              model.paths.whereType<String>().toList(),
                        );

                        blocBagReport
                            .add(BagReportEvent.create(formInfo: formInfo));
                      } else {
                        setState(() {
                          isShowErrorText = true;
                        });
                      }
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
