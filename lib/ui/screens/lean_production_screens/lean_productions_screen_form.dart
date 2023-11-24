import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/lean_production_form_bloc/lean_production_form_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/other_users_bloc/other_users_bloc.dart';
import 'package:hr_app_flutter/domain/entity/lean_productions_entity/lean_production_form_entity/lean_production_form_entity.dart';
import 'package:hr_app_flutter/domain/entity/user/user.dart';
import 'package:hr_app_flutter/domain/repository/auth_repository.dart';
import 'package:hr_app_flutter/domain/repository/lean_production_repository.dart';
import 'package:hr_app_flutter/domain/repository/user_repository.dart';
import 'package:hr_app_flutter/ui/components/file_picker_custom/file_picker_custom_model.dart';

import '../../../library/custom_provider/inherit_widget.dart';
import '../../components/custom_text_form_field/custom_text_form_field.dart';
import '../../components/file_picker_custom/file_picker_custom_floating_action_button.dart';
import '../../components/file_picker_custom/file_picker_custom_widget.dart';

@RoutePage()
class LeanProductionFormScreen extends StatelessWidget
    implements AutoRouteWrapper {
  LeanProductionFormScreen(
      {super.key,
      required this.authRepository,
      required this.userRepo,
      required this.leanRepository});
  final IAuthRepository authRepository;
  final IUserRepository userRepo;
  final ILeanProductionRepository leanRepository;
  final _model = FilePickerCustomModel();

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
    return ChangeNotifierProvaider<FilePickerCustomModel>(
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
        floatingActionButton: const CustomFABFromFilePicker(),
      ),
    );
  }
}

class MyFormWidget extends StatefulWidget {
  const MyFormWidget(
      {super.key, required this.authRepository, required this.userRepo});
  final IAuthRepository authRepository;
  final IUserRepository userRepo;

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
    for (var controller in _executorsControllers) {
      controller.dispose();
    }
    for (var controller in _executorsIdControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = ChangeNotifierProvaider.watch<
        ChangeNotifierProvaider<FilePickerCustomModel>,
        FilePickerCustomModel>(context);

    final LeanProductionFormBloc blocLeanProductionForm =
        context.read<LeanProductionFormBloc>();
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
                    child:
                        Text('Ошибка:${state.errorText}.\n Попробуйте снова')),
                duration: const Duration(seconds: 6),
              ),
            );
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextFormField(
                    iconData: const Icon(Icons.receipt),
                    inputText: 'Суть проблемы',
                    nameController: _problemController),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                    iconData: const Icon(Icons.question_mark_outlined),
                    inputText: 'Как решить',
                    nameController: _solutionController),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                    iconData: const Icon(Icons.paid),
                    inputText: 'Ориентировочные затраты',
                    nameController: _costController),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                    iconData: const Icon(Icons.star),
                    inputText: 'Польза предложения',
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
                Center(
                  child: ElevatedButton(
                    child: const Text('Отправить'),
                    onPressed: () {
                      if (_formKey.currentState != null) {
                        if (_formKey.currentState!.validate()) {
                          final modelView = ChangeNotifierProvaider.watch<
                              ChangeNotifierProvaider<FilePickerCustomModel>,
                              FilePickerCustomModel>(context);

                          int firstImplementer = 0;
                          int secondImplementer = 0;
                          int thirdImplementer = 0;

                          _executorsIdControllers
                              .asMap()
                              .forEach((index, controller) {
                            switch (index) {
                              case 0:
                                if (controller.text != '') {
                                  firstImplementer = int.parse(controller.text);
                                }
                              case 1:
                                secondImplementer = int.parse(controller.text);
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
  final IAuthRepository authRepository;
  final IUserRepository userRepo;

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
