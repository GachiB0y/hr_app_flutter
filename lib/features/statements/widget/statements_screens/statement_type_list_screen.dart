import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/features/statements/bloc/participants_bloc/participants_bloc.dart';

import '../../../auth/data/repo/auth_repository.dart';
import '../../bloc/statements_bloc/statements_form_bloc/statements_bloc.dart';
import '../../bloc/statements_bloc/statements_type_list_bloc/statement_type_list_bloc.dart';
import '../../data/repo/statements_repository.dart';
import '../../model/statements/statements.dart';

@RoutePage()
class StatementFormScreen extends StatelessWidget implements AutoRouteWrapper {
  const StatementFormScreen(
      {super.key,
      required this.repositoryStatements,
      required this.authRepository});
  final IStatementsRepository repositoryStatements;
  final IAuthRepository authRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        // elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text('Подача заявления'),
      ),
      body: const SafeArea(child: DropdownWidget()),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<StatementTypeListBLoC>(
        create: (BuildContext context) => StatementTypeListBLoC(
          authRepository: authRepository,
          repositoryStatements: repositoryStatements,
        ),
      ),
      BlocProvider<StatementsBLoC>(
        create: (BuildContext context) => StatementsBLoC(
          authRepository: authRepository,
          repositoryStatements: repositoryStatements,
        ),
      ),
      BlocProvider<ParticipantsBLoC>(
        create: (BuildContext context) => ParticipantsBLoC(
          authRepository: authRepository,
          repositoryStatements: repositoryStatements,
        ),
      ),
    ], child: this);
  }
}

class DropdownWidget extends StatefulWidget {
  const DropdownWidget({super.key});

  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  List<StatementFieldTypeEntity> filteredStatementFields = [];

  TextEditingController filterController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final blocStatements = context.read<StatementTypeListBLoC>();
    blocStatements.add(const StatementTypeListEvent.fetch());
    filteredStatementFields =
        blocStatements.state.hasData ? blocStatements.state.data! : [];
  }

  void filterStatementFields(
      String filter, List<StatementFieldTypeEntity>? oldList) {
    setState(() {
      filteredStatementFields = oldList!
          .where((statementField) =>
              statementField.name.toLowerCase().contains(filter.toLowerCase()))
          .toList();
    });
  }

  final TextEditingController colorController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // final blocStatementsTypeList = context.watch<StatementTypeListBLoC>();
    // final blocStatements = context.watch<StatementsBLoC>();

    return BlocBuilder<StatementTypeListBLoC, StatementTypeListState>(
        builder: (context, state) {
      return SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                DropdownMenu<StatementFieldTypeEntity>(
                  inputDecorationTheme: const InputDecorationTheme(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),
                  ),
                  label: const Text('Тип заявления'),
                  menuStyle: const MenuStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.white),
                      surfaceTintColor:
                          MaterialStatePropertyAll<Color>(Colors.transparent),
                      elevation: MaterialStatePropertyAll<double>(10.0),
                      maximumSize: MaterialStatePropertyAll(Size(300, 300))),
                  width: 300,
                  menuHeight: 300,
                  controller: colorController,
                  onSelected: (StatementFieldTypeEntity? value) {
                    if (value != null) {
                      context
                          .read<StatementsBLoC>()
                          .add(StatementsEvent.fetch(id: value.documentType));
                    }
                  },
                  dropdownMenuEntries: state.data!.map((statementField) {
                    return DropdownMenuEntry<StatementFieldTypeEntity>(
                        value: statementField,
                        label: statementField.name,
                        style: const ButtonStyle(
                            maximumSize:
                                MaterialStatePropertyAll(Size(300, 300)),
                            textStyle: MaterialStatePropertyAll(
                                TextStyle(overflow: TextOverflow.ellipsis))));
                  }).toList(),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                StatementsTampleteFormWidget(
                  formKey: _formKey,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class StatementsTampleteFormWidget extends StatefulWidget {
  const StatementsTampleteFormWidget({
    super.key,
    required final GlobalKey<FormState> formKey,
  }) : _formKey = formKey;
  final GlobalKey<FormState> _formKey;
  @override
  _StatementsTampleteFormWidgetState createState() =>
      _StatementsTampleteFormWidgetState();
}

class _StatementsTampleteFormWidgetState
    extends State<StatementsTampleteFormWidget> {
  List<TemplateField> initListField = [];
  List<Padding> listWidget = [];
  bool isSumbitting = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  List<TemplateField> textFieldsData = [];
  List<TextEditingController> listController = [];
  Map<String, String?> convertListToMap(List<TemplateField> textFieldsData) {
    Map<String, String?> resultMap = {};

    for (TemplateField field in textFieldsData) {
      resultMap[field.name] = field.value;
    }

    return resultMap;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StatementsBLoC, StatementsState>(
        listenWhen: (previousState, state) {
      return state != previousState;
    }, listener: (context, state) {
      if (state is StatementsState$Error) {
        if (isSumbitting) {
          setState(() {
            isSumbitting = false;
          });
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content:
                    Center(child: Text('Ошибка отправки.\nПопробуйте снова.')),
                duration: Duration(seconds: 6),
              ),
            );
        }
      } else if (state is StatementsState$Successful) {
        if (isSumbitting) {
          setState(() {
            isSumbitting = false;
          });
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
        } else {
          if (state.data?.template != null) {
            initListField.addAll(state.data!.template);
            listWidget = state.data!.template.map((TemplateField element) {
              TextEditingController controller = TextEditingController();
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: controller,
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Поле обязательно для заполнения';
                      } else {
                        setState(() {
                          final newInput =
                              TemplateField(name: element.name, value: value!);
                          textFieldsData.add(newInput);
                        });
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: const OutlineInputBorder(),
                      labelText: element.value,
                    ),
                  ),
                ),
              );
            }).toList();
          }
        }
      }
    }, builder: (context, state) {
      if (state is StatementsState$Idle) {
        return state.data != null
            ? Column(
                children: [
                  Column(children: listWidget),
                  // state.data!.isParticipants
                  //     ?
                  Container(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    width: 300,
                    child: ParticipantInputWidget(
                      iconData: null,
                      nameController: _nameController,
                      idController: _idController,
                      inputText: 'Согласующий',
                    ),
                  ),
                  // : const SizedBox.shrink(),
                  ElevatedButton(
                    onPressed: () {
                      if (widget._formKey.currentState != null) {
                        if (widget._formKey.currentState!.validate()) {
                          final Map<String, String?> resultMap =
                              convertListToMap(textFieldsData);
                          final TemplateFormStatementsEntity
                              templateFormStatementsEntity =
                              TemplateFormStatementsEntity.fromJson(resultMap);

                          final StatementFormInfoToSubmit formInfo =
                              StatementFormInfoToSubmit(
                                  documentType: state.data!.documentType,
                                  template: templateFormStatementsEntity,
                                  participantsTo: _idController.text);

                          context
                              .read<StatementsBLoC>()
                              .add(StatementsEvent.create(itemsForm: formInfo));
                          // Делать что-то с данными, например, отправить на сервер
                          setState(() {
                            isSumbitting = true;
                          });
                        }
                      }
                    },
                    child: const Text('Отправить'),
                  ),
                ],
              )
            : const SizedBox.shrink();
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}

class ParticipantInputWidget extends StatefulWidget {
  const ParticipantInputWidget({
    super.key,
    required TextEditingController nameController,
    required TextEditingController idController,
    required IconData? iconData,
    required String inputText,
  })  : _idController = idController,
        _nameController = nameController,
        _iconData = iconData,
        _inputText = inputText;

  final TextEditingController _nameController;
  final TextEditingController _idController;
  final IconData? _iconData;
  final String _inputText;

  @override
  _ParticipantInputWidgetState createState() => _ParticipantInputWidgetState();
}

class _ParticipantInputWidgetState extends State<ParticipantInputWidget> {
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
    // context.read<StatementsBLoC>().add(const OtherUsersEvent.clearList());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ParticipantsBLoC, ParticipantsState>(
        builder: (context, state) {
      return Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(inputText),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: const OutlineInputBorder(),
                  labelText: inputText,
                ),
                // decoration: InputDecoration(
                //   border: const OutlineInputBorder(),
                //   labelText: inputText,
                // ),
                onTap: () {
                  setState(() {
                    isFocus = true;
                  });
                },
                onSaved: (value) {
                  setState(() {
                    isFocus = false;
                  });
                },
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    searchDebounce?.cancel();
                    searchDebounce =
                        Timer(const Duration(milliseconds: 700), () {
                      context
                          .read<ParticipantsBLoC>()
                          .add(ParticipantsEvent.fetch(inputValue: value));
                    });
                  }
                },
              ),
            ],
          ),
          if (state.hasError)
            const Center(child: Text('Пользователь не найден.')),
          if (state.isProcessing) const SizedBox.shrink(),
          if (state.hasData || state.isIdling)
            state.data != null
                ? state.data!.isEmpty
                    ? const Center(child: Text('Пользователь не найден.'))
                    : isFocus
                        ? Container(
                            constraints: const BoxConstraints(
                                minHeight: 70, maxHeight: 240),
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
                                // borderRadius: BorderRadius.circular(30.0),
                                // border: Border.all(),
                                color: Colors.white),
                            child: Scrollbar(
                              child: ListView.builder(
                                controller: _scrollController,
                                // itemExtent: 70,
                                itemCount: state.data!.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(
                                        '${state.data![index].lastName} ${state.data![index].firstName} ${state.data![index].patronymic}'),
                                    subtitle: Text(state.data![index].position,
                                        overflow: TextOverflow.clip),
                                    onTap: () {
                                      nameController.text =
                                          '${state.data![index].lastName} ${state.data![index].firstName} ${state.data![index].patronymic}';
                                      idController.text = state.data![index].id;

                                      setState(() {
                                        isFocus = false;
                                      });
                                    },
                                  );
                                },
                              ),
                            ),
                          )
                        : const SizedBox.shrink()
                : const SizedBox.shrink(),
        ],
      );
    });
  }
}
