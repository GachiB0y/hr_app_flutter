import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/lean_production_form_bloc/lean_production_form_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/other_users_bloc/other_users_bloc.dart';
import 'package:hr_app_flutter/domain/entity/lean_production_form_entity/lean_production_form_entity.dart';
import 'package:hr_app_flutter/domain/entity/user/user.dart';
import 'package:hr_app_flutter/domain/repository/auth_repository.dart';
import 'package:hr_app_flutter/domain/repository/lean_production_repository.dart';
import 'package:hr_app_flutter/domain/repository/user_repository.dart';
import 'package:hr_app_flutter/ui/components/custom_date_picker/custom_date_picker.dart';
import 'package:hr_app_flutter/ui/components/custom_date_picker/custom_date_pikcer_model.dart';
import 'package:hr_app_flutter/ui/screens/lean_production_screens/lean_productions_screen_form_model.dart';

import '../../../library/custom_provider/inherit_widget.dart';

@RoutePage()
class LeanProductionFormScreen extends StatelessWidget
    implements AutoRouteWrapper {
  LeanProductionFormScreen(
      {super.key,
      required this.authRepository,
      required this.userRepo,
      required this.leanRepository});
  final AuthRepository authRepository;
  final UserRepository userRepo;
  final LeanProductionRepository leanRepository;
  final _model = LeanProductionFormScreenModel();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OtherUsersBloc>(
          create: (BuildContext context) => OtherUsersBloc(
              authRepository: authRepository, userRepo: userRepo),
        ),
        BlocProvider<LeanProductionFormBloc>(
          create: (BuildContext context) => LeanProductionFormBloc(
              authRepository: authRepository,
              userRepo: userRepo,
              leanRepository: leanRepository),
        )
      ],
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvaider<LeanProductionFormScreenModel>(
      model: _model,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.grey[200],
          title: const Text('Подача заявления'),
        ),
        body: MyFormWidget(
          authRepository: authRepository,
          userRepo: userRepo,
        ),
        floatingActionButton: const CustomFloatingActionButton(),
      ),
    );
  }
}

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.attach_file),
      onPressed: () => ChangeNotifierProvaider.read<
              ChangeNotifierProvaider<LeanProductionFormScreenModel>,
              LeanProductionFormScreenModel>(context)
          ?.pickFile(),
    );
  }
}

class MyFormWidget extends StatefulWidget {
  const MyFormWidget(
      {super.key, required this.authRepository, required this.userRepo});
  final AuthRepository authRepository;
  final UserRepository userRepo;

  @override
  _MyFormWidgetState createState() => _MyFormWidgetState();
}

class _MyFormWidgetState extends State<MyFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _employeeNameController = TextEditingController();
  final TextEditingController _managerNameController = TextEditingController();
  final TextEditingController _problemController = TextEditingController();
  final TextEditingController _solutionController = TextEditingController();
  final TextEditingController _costController = TextEditingController();
  final TextEditingController _benefitController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final List<TextEditingController> _executorsControllers = [
    TextEditingController()
  ];
  final List<TextEditingController> _executorsIdControllers = [
    TextEditingController()
  ];
  bool isChecked = false;

  @override
  void dispose() {
    _dateController.dispose();
    _employeeNameController.dispose();
    _managerNameController.dispose();
    _problemController.dispose();
    _solutionController.dispose();
    _costController.dispose();
    _benefitController.dispose();
    _authorController.dispose();
    _executorsControllers.forEach((controller) => controller.dispose());
    _executorsIdControllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = ChangeNotifierProvaider.watch<
        ChangeNotifierProvaider<LeanProductionFormScreenModel>,
        LeanProductionFormScreenModel>(context);

    final blocLeanProductionForm = context.read<LeanProductionFormBloc>();
    return BlocListener<LeanProductionFormBloc, LeanProductionFormState>(
      listener: (context, state) {
        if (state is LeanProductionFormStateLoaded) {
          if (state.isSubmitting == true) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  content: Center(
                      child: Text(
                    'Данные успешно отправленны!',
                    style: TextStyle(fontSize: 20),
                  )),
                  duration: Duration(seconds: 3),
                ),
              ).closed.then((value) => Navigator.pop(context));
          }
        } else if (state is LeanProductionFormStateError) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Center(
                    child: Text(
                        'Ошибка:${(state as LeanProductionFormStateError).errorText}.\n Попробуйте снова')),
                duration: const Duration(seconds: 6),
              ),
            );
        }
      },
      child: SingleChildScrollView(
        child: ChangeNotifierProvaider<CustomDatePickerModel>(
          model: CustomDatePickerModel(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.white),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Дата'),
                          SizedBox(
                            height: 5,
                          ),
                          CustomDatePicker(),
                        ],
                      )),
                  CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text('Подано реализованным'),
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                      iconData: Icons.receipt,
                      inputText: 'Суть проблемы',
                      nameController: _problemController),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                      iconData: Icons.question_mark_outlined,
                      inputText: 'Как решить',
                      nameController: _solutionController),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                      iconData: Icons.paid,
                      inputText: 'Ориентировочные затраты',
                      nameController: _costController),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                      iconData: Icons.star,
                      inputText:
                          'Польза предложения (экономия времени, средств и т.д.)',
                      nameController: _benefitController),
                  const SizedBox(
                    height: 10,
                  ),
                  model?.fileNames.isEmpty == false
                      ? const FilePickerWidget()
                      : const SizedBox.shrink(),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _executorsControllers.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: ImplementersInputWidget(
                          authRepository: widget.authRepository,
                          userRepo: widget.userRepo,
                          iconData: Icons.person_4,
                          inputText: 'Исполнитель ${index + 1}',
                          nameController: _executorsControllers[index],
                          idController: _executorsIdControllers[index],
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _executorsControllers.length < 3
                          ? Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Center(
                                child: IconButton(
                                  style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Color(0xffb3f2b2))),
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    if (_executorsControllers.length < 3) {
                                      setState(() {
                                        _executorsControllers
                                            .add(TextEditingController());
                                        _executorsIdControllers
                                            .add(TextEditingController());
                                      });
                                    }
                                  },
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                      _executorsControllers.length > 1
                          ? Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Center(
                                child: IconButton(
                                  style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Color(0xfff3b2b2))),
                                  onPressed: () {
                                    if (_executorsControllers.length > 1) {
                                      setState(() {
                                        _executorsControllers.removeLast();
                                        _executorsIdControllers.removeLast();
                                      });
                                    }
                                  },
                                  icon: const Icon(Icons.remove),
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: ElevatedButton(
                      child: const Text('Отправить'),
                      onPressed: () {
                        if (_formKey.currentState != null) {
                          if (_formKey.currentState!.validate()) {
                            final modelView = ChangeNotifierProvaider.watch<
                                ChangeNotifierProvaider<
                                    LeanProductionFormScreenModel>,
                                LeanProductionFormScreenModel>(context);

                            int firstImplementer = 0;
                            int secondImplementer = 0;
                            int thirdImplementer = 0;

                            _executorsIdControllers
                                .asMap()
                                .forEach((index, controller) {
                              switch (index) {
                                case 0:
                                  if (controller.text != '') {
                                    firstImplementer =
                                        int.parse(controller.text);
                                  }
                                case 1:
                                  secondImplementer =
                                      int.parse(controller.text);
                                case 2:
                                  thirdImplementer = int.parse(controller.text);
                              }
                            });
                            final formEntity = LeanProductionFormEntity(
                              firstImplementer: firstImplementer,
                              secondImplementer: secondImplementer,
                              thirdImplementer: thirdImplementer,
                              realized: isChecked,
                              issue: _problemController.text,
                              solution: _solutionController.text,
                              expenses: _costController.text,
                              benefit: _benefitController.text,
                              paths:
                                  modelView!.paths.whereType<String>().toList(),
                            );

                            blocLeanProductionForm.add(
                                LeanProductionFormEvent.submitForm(
                                    formEntity: formEntity));
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required TextEditingController nameController,
    required IconData? iconData,
    required String inputText,
  })  : _nameController = nameController,
        _iconData = iconData,
        _inputText = inputText;

  final TextEditingController _nameController;
  final IconData? _iconData;
  final String _inputText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_inputText),
          TextFormField(
            maxLines: 10,
            minLines: 1,
            controller: _nameController,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              icon: Icon(_iconData),
              border: InputBorder.none,
            ),
            validator: (value) {
              if (value != null && value.isEmpty) {
                return 'Поле обязательно для заполнения';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}

class FilePickerWidget extends StatefulWidget {
  const FilePickerWidget({super.key});

  @override
  _FilePickerWidgetState createState() => _FilePickerWidgetState();
}

class _FilePickerWidgetState extends State<FilePickerWidget> {
  @override
  Widget build(BuildContext context) {
    final model = ChangeNotifierProvaider.watch<
        ChangeNotifierProvaider<LeanProductionFormScreenModel>,
        LeanProductionFormScreenModel>(context);
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Выбранные фаилы:',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 160,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemExtent: 120,
                itemCount: model?.fileNames.length,
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
                              },
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional.topEnd,
                            child: IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                model?.deleteFile(indexFile: index);
                              },
                            ),
                          ),
                        ]),
                        Text(
                          '${model?.fileNames[index]}',
                          style: const TextStyle(
                              fontSize: 16, overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                  );
                }),
            // Text(
            //   'Выбранный фаил: ${model!.fileName}',
            //   style: const TextStyle(fontSize: 16),
            // ),
          ),
        ],
      ),
    );
  }
}

class ImplementersInputWidget extends StatefulWidget {
  const ImplementersInputWidget({
    super.key,
    required this.authRepository,
    required this.userRepo,
    required TextEditingController nameController,
    required TextEditingController idController,
    required IconData? iconData,
    required String inputText,
  })  : _idController = idController,
        _nameController = nameController,
        _iconData = iconData,
        _inputText = inputText;
  final AuthRepository authRepository;
  final UserRepository userRepo;

  final TextEditingController _nameController;
  final TextEditingController _idController;
  final IconData? _iconData;
  final String _inputText;

  @override
  _ImplementersInputWidgetState createState() =>
      _ImplementersInputWidgetState();
}

class _ImplementersInputWidgetState extends State<ImplementersInputWidget> {
  List<User> filteredUserList = [];
  Timer? searchDebounce;
  final FocusNode focusNodeSearch = FocusNode();
  bool isFocus = false;
  final ScrollController _scrollController = ScrollController();

  String get inputText => widget._inputText;
  IconData? get iconData => widget._iconData;
  TextEditingController get nameController => widget._nameController;
  TextEditingController get idController => widget._idController;

  @override
  void initState() {
    super.initState();
    context.read<OtherUsersBloc>().add(const OtherUsersEvent.clearList());
  }

  @override
  Widget build(BuildContext context) {
    final blocOtherUsers = context.watch<OtherUsersBloc>();

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0), color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(inputText),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  icon: Icon(iconData),
                  border: InputBorder.none,
                ),
                onTap: () {
                  setState(() {
                    isFocus = true;
                  });
                },
                onSubmitted: (value) {
                  setState(() {
                    isFocus = false;
                  });
                },
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    searchDebounce?.cancel();
                    searchDebounce =
                        Timer(const Duration(milliseconds: 700), () {
                      blocOtherUsers
                          .add(OtherUsersEvent.findUsers(findText: value));
                    });
                  }
                },
              ),
            ],
          ),
        ),
        blocOtherUsers.state.when(
          loading: (listUsersLoaded, currentUserProfile) {
            return const SizedBox.shrink();
          },
          loaded: (listUsersLoaded, currentUserProfile) {
            return listUsersLoaded.isEmpty
                ? const SizedBox.shrink()
                : isFocus
                    ? Container(
                        constraints:
                            const BoxConstraints(minHeight: 70, maxHeight: 240),
                        padding: const EdgeInsets.all(16.0),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: const Offset(0, 0),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.white),
                        child: Scrollbar(
                          child: ListView.builder(
                            controller: _scrollController,
                            itemExtent: 70,
                            itemCount: listUsersLoaded.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                    '${listUsersLoaded[index].name} ${listUsersLoaded[index].nameI} ${listUsersLoaded[index].nameO}'),
                                subtitle:
                                    Text(listUsersLoaded[index].staffPosition),
                                onTap: () {
                                  nameController.text =
                                      '${listUsersLoaded[index].name} ${listUsersLoaded[index].nameI} ${listUsersLoaded[index].nameO}';
                                  idController.text = listUsersLoaded[index]
                                      .autoCard
                                      .toString();
                                  setState(() {
                                    isFocus = false;
                                  });
                                },
                              );
                            },
                          ),
                        ),
                      )
                    : const SizedBox.shrink();
          },
          error: (e) => const Center(child: Text('Пользователь не найден.')),
        ),
      ],
    );
  }
}