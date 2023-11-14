import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/domain/api_client/api_client_exception.dart';
import 'package:hr_app_flutter/domain/repository/auth_repository.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../domain/blocs/lean_production_form_bloc/lean_production_form_bloc.dart';
import '../../../domain/entity/lean_productions_entity/my_lean_productions_entity/my_lean_productions_entity.dart';
import '../../../domain/repository/lean_production_repository.dart';
import '../../../domain/repository/user_repository.dart';
import '../../../utils/get_icon_by_text_func.dart';
import '../../components/custom_text_form_field/custom_text_form_field.dart';

@RoutePage()
class LeanProductionInfoProposalsScreen extends StatelessWidget
    implements AutoRouteWrapper {
  const LeanProductionInfoProposalsScreen(
      {super.key,
      required this.modelLeanProduction,
      required this.blocLeanProduction,
      required this.authRepository,
      required this.userRepo,
      required this.leanRepository});

  final MyLeanProductionsEntity modelLeanProduction;
  final LeanProductionFormBloc blocLeanProduction;
  final AuthRepository authRepository;
  final UserRepository userRepo;
  final LeanProductionRepository leanRepository;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<LeanProductionFormBloc>(
      create: (BuildContext context) => LeanProductionFormBloc(
          authRepository: authRepository,
          userRepo: userRepo,
          leanRepository: leanRepository),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text('Заявление №${modelLeanProduction.number}'),
      ),
      body: InfoProposalsForm(
        modelLeanProduction: modelLeanProduction,
        blocLeanProduction: blocLeanProduction,
      ),
    );
  }
}

class InfoProposalsForm extends StatefulWidget {
  const InfoProposalsForm(
      {super.key,
      required this.modelLeanProduction,
      required this.blocLeanProduction});

  final MyLeanProductionsEntity modelLeanProduction;
  final LeanProductionFormBloc blocLeanProduction;

  @override
  _InfoProposalsFormState createState() => _InfoProposalsFormState();
}

class _InfoProposalsFormState extends State<InfoProposalsForm> {
  MyLeanProductionsEntity get modelLeanProduction => widget.modelLeanProduction;
  final GlobalKey<State> _progressDialogKey = GlobalKey<State>();

  showProgressDialog(BuildContext context, GlobalKey<State> key) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          key: key,
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Загрузка...'),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LeanProductionFormBloc, LeanProductionFormState>(
      listener: (context, state) {
        if (state is LeanProductionFormStateError) {
          if (_progressDialogKey.currentContext != null) {
            Navigator.of(_progressDialogKey.currentContext!).pop();
          }
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return MyBottomSheet(
                exceptionType: state.exception,
              );
            },
          );
          context
              .read<LeanProductionFormBloc>()
              .add(const LeanProductionFormEvent.createInitState());
        } else if (state is LeanProductionFormStateLoaded) {
          if (state.isLoadingFile == true) {
            showProgressDialog(context, _progressDialogKey);
          } else if (state.isLoadingFile == false) {
            if (_progressDialogKey.currentContext != null) {
              Navigator.of(_progressDialogKey.currentContext!).pop();
            }
          }
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextFormField(
                    initialValue: modelLeanProduction.status,
                    readOnly: true,
                    iconData: getIconByText(modelLeanProduction.status),
                    inputText: 'Статус',
                    nameController: null),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                    initialValue: modelLeanProduction.issue,
                    readOnly: true,
                    iconData: const Icon(Icons.receipt),
                    inputText: 'Суть проблемы',
                    nameController: null),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                    initialValue: modelLeanProduction.solution,
                    readOnly: true,
                    iconData: const Icon(Icons.question_mark_outlined),
                    inputText: 'Как решить',
                    nameController: null),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                    initialValue: modelLeanProduction.expenses,
                    readOnly: true,
                    iconData: const Icon(Icons.paid),
                    inputText: 'Ориентировочные затраты',
                    nameController: null),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                    initialValue: modelLeanProduction.benefit,
                    readOnly: true,
                    iconData: const Icon(Icons.star),
                    inputText: 'Польза предложения',
                    nameController: null),
                const SizedBox(
                  height: 10,
                ),
                FileInfoWidget(
                  modelLeanProduction: modelLeanProduction,
                  blocLeanProduction: widget.blocLeanProduction,
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: modelLeanProduction.implementers.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: CustomTextFormField(
                          readOnly: true,
                          iconData: const Icon(Icons.person_4),
                          inputText: 'Исполнитель ${index + 1}',
                          nameController: null),
                    );
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Подано реализованным'),
                  value: false,
                  onChanged: (value) {},
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FileInfoWidget extends StatelessWidget {
  const FileInfoWidget(
      {super.key,
      required this.modelLeanProduction,
      required this.blocLeanProduction});
  final MyLeanProductionsEntity modelLeanProduction;
  final LeanProductionFormBloc blocLeanProduction;

  @override
  Widget build(BuildContext context) {
    final LeanProductionFormBloc newblocLeanProduction =
        context.read<LeanProductionFormBloc>();
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Файлы:',
            style: TextStyle(fontSize: 16),
          ),
          modelLeanProduction.files.isNotEmpty
              ? SizedBox(
                  height: 160,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemExtent: 120,
                      itemCount: modelLeanProduction.files.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Stack(children: [
                                Container(
                                  margin: const EdgeInsets.all(8.0),
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.file_present,
                                      size: 60,
                                    ),
                                    onPressed: () {
                                      // Действия при нажатии на иконку документа
                                      newblocLeanProduction.add(
                                          LeanProductionFormEvent
                                              .downloadFileWithLeanProduction(
                                        url: modelLeanProduction
                                            .files[index].url!,
                                      ));
                                    },
                                  ),
                                ),
                              ]),
                              Text(
                                modelLeanProduction.files[index].fileName,
                                style: const TextStyle(
                                    fontSize: 16,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ],
                          ),
                        );
                      }),
                )
              : const Text(
                  'Отсутствуют.',
                  style: TextStyle(overflow: TextOverflow.ellipsis),
                ),
        ],
      ),
    );
  }
}

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({super.key, required this.exceptionType});
  final ApiClientExceptionType? exceptionType;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          switch (exceptionType) {
            ApiClientExceptionType.openFileDocuments => const Text(
                'Разрешите доступ к управлению\n всеми файлами на телефоне',
                style: TextStyle(fontSize: 18),
              ),
            ApiClientExceptionType.openFileImage => const Text(
                'Разрешите доступ к Фото и видео на телефоне',
                style: TextStyle(fontSize: 18),
              ),
            _ => const Text('Ошибка сохранения файла'),
          },
          const SizedBox(height: 16),
          switch (exceptionType) {
            ApiClientExceptionType.openFileDocuments => ElevatedButton(
                onPressed: () {
                  requestPermission(context);
                },
                child: const Text(
                  'Разрешить',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ApiClientExceptionType.openFileImage => ElevatedButton(
                onPressed: () {
                  requestPermission(context);
                },
                child: const Text(
                  'Разрешить',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            _ => const SizedBox.shrink(),
          },
          const SizedBox(height: 8),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: switch (exceptionType) {
              ApiClientExceptionType.openFileDocuments => ElevatedButton(
                  onPressed: () {
                    requestPermission(context);
                  },
                  child: const Text(
                    'Не сейчас',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ApiClientExceptionType.openFileImage => ElevatedButton(
                  onPressed: () {
                    requestPermission(context);
                  },
                  child: const Text(
                    'Не сейчас',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              _ => const Text(
                  'Ок',
                  style: TextStyle(fontSize: 18),
                ),
            },
          ),
        ],
      ),
    );
  }

  void requestPermission(BuildContext context) async {
    if (await Permission.photos.isPermanentlyDenied) {
      // The user opted to never again see the permission request dialog for this
      // app. The only way to change the permission's status now is to let the
      // user manually enable it in the system settings.
      openAppSettings();
    } else if (await Permission.manageExternalStorage.isDenied) {
      await Permission.manageExternalStorage.request();
    }

    Navigator.of(context).pop();
  }
}
