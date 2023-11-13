import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/domain/repository/service_repository.dart';

import '../../../domain/blocs/bag_report_bloc/bag_report_bloc.dart';
import '../../../domain/entity/bag_report_entity/bag_report_entity.dart';
import '../../../domain/repository/auth_repository.dart';
import '../../../library/custom_provider/inherit_widget.dart';
import '../../components/custom_text_form_field/custom_text_form_field.dart';
import '../../components/file_picker_custom/file_picker_custom_floating_action_button.dart';
import '../../components/file_picker_custom/file_picker_custom_model.dart';
import '../../components/file_picker_custom/file_picker_custom_widget.dart';

@RoutePage()
class BagReportScreen extends StatefulWidget implements AutoRouteWrapper {
  const BagReportScreen(
      {super.key,
      required this.authRepository,
      required this.serviceRepository});
  final AuthRepository authRepository;
  final ServiceRepository serviceRepository;
  @override
  State<BagReportScreen> createState() => _BagReportScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<BagReportBLoC>(
        create: (BuildContext context) => BagReportBLoC(
              authRepository: authRepository,
              repositoryService: serviceRepository,
            ),
        child: this);
  }
}

class _BagReportScreenState extends State<BagReportScreen> {
  final _model = FilePickerCustomModel();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvaider<FilePickerCustomModel>(
      model: _model,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.grey[200],
          title: const Text('Сообщить об ошибке'),
        ),
        body: const SafeArea(child: BagReportFormWidget()),
        floatingActionButton: const CustomFABFromFilePicker(),
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

  @override
  Widget build(BuildContext context) {
    final blocBagReport = context.read<BagReportBLoC>();
    final model = ChangeNotifierProvaider.watch<
        ChangeNotifierProvaider<FilePickerCustomModel>,
        FilePickerCustomModel>(context);
    return BlocListener<BagReportBLoC, BagReportState>(
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
      child: Container(
        margin: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKeyBagReport,
          child: Column(
            children: [
              CustomTextFormField(
                nameController: inputControllerTitle,
                iconData: const Icon(Icons.priority_high),
                inputText: 'Заголовок',
              ),
              const SizedBox(
                height: 16.0,
              ),
              CustomTextFormField(
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
                child: const Text('Отправить'),
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
                        pathsToFiles: model.paths.whereType<String>().toList(),
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
    );
  }
}
