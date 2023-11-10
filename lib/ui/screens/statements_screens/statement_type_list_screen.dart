import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/statements_bloc/statements_form_bloc/statements_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/statements_bloc/statements_type_list_bloc/statement_type_list_bloc.dart';
import 'package:hr_app_flutter/domain/entity/statements/statements.dart';

import '../../../domain/repository/auth_repository.dart';
import '../../../domain/repository/statements_repository.dart';

@RoutePage()
class StatementFormScreen extends StatelessWidget implements AutoRouteWrapper {
  const StatementFormScreen(
      {super.key,
      required this.repositoryStatements,
      required this.authRepository});
  final IStatementsRepository repositoryStatements;
  final AuthRepository authRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
    ], child: this);
  }
}

class DropdownWidget extends StatefulWidget {
  const DropdownWidget({super.key});

  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  List<StatementFieldEntity> filteredStatementFields = [];

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
      String filter, List<StatementFieldEntity>? oldList) {
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
    final blocStatementsTypeList = context.watch<StatementTypeListBLoC>();
    final blocStatements = context.watch<StatementsBLoC>();

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Center(
          child: Column(
            children: [
              DropdownMenu<StatementFieldEntity>(
                menuStyle: const MenuStyle(
                    maximumSize: MaterialStatePropertyAll(Size(300, 300))),
                width: 300,
                menuHeight: 300,
                controller: colorController,
                onSelected: (StatementFieldEntity? value) {
                  if (value != null) {
                    blocStatements.add(StatementsEvent.fetch(id: value.id));
                  }
                },
                dropdownMenuEntries:
                    blocStatementsTypeList.state.data!.map((statementField) {
                  return DropdownMenuEntry<StatementFieldEntity>(
                      value: statementField,
                      label: statementField.name,
                      style: const ButtonStyle(
                          maximumSize: MaterialStatePropertyAll(Size(300, 300)),
                          textStyle: MaterialStatePropertyAll(
                              TextStyle(overflow: TextOverflow.ellipsis))));
                }).toList(),
              ),
              const SizedBox(
                height: 16.0,
              ),
              StatementsHRLinkFormWidget(
                formKey: _formKey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StatementsHRLinkFormWidget extends StatefulWidget {
  const StatementsHRLinkFormWidget({
    super.key,
    required final GlobalKey<FormState> formKey,
  }) : _formKey = formKey;
  final GlobalKey<FormState> _formKey;
  @override
  _StatementsHRLinkFormWidgetState createState() =>
      _StatementsHRLinkFormWidgetState();
}

class _StatementsHRLinkFormWidgetState
    extends State<StatementsHRLinkFormWidget> {
  List<TemplateField> textFieldsData = [];
  List<TextEditingController> listController = [];

  @override
  Widget build(BuildContext context) {
    // final blocStatements = context.watch<StatementsBLoC>();

    return BlocBuilder<StatementsBLoC, StatementsState>(
        builder: (context, state) {
      if (state is StatementsState$Idle) {
        return state.data != null
            ? Column(
                children: [
                  for (int i = 0; i < state.data!.templateFields.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: SizedBox(
                        width: 300,
                        child: TextFormField(
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return 'Поле обязательно для заполнения';
                            } else {
                              setState(() {
                                final newInput = TemplateField(
                                    id: state.data!.templateFields[i].id,
                                    value: value!);
                                textFieldsData.add(newInput);
                              });
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: state.data?.templateFields[i].name,
                          ),
                        ),
                      ),
                    ),
                  ElevatedButton(
                    onPressed: () {
                      if (widget._formKey.currentState != null) {
                        if (widget._formKey.currentState!.validate()) {
                          // Собрать все данные из TextField
                          List<TemplateField> allData = [];
                          for (int i = 0;
                              i < state.data!.templateFields.length;
                              i++) {
                            allData.add(textFieldsData[i]);
                          }

                          // Делать что-то с данными, например, отправить на сервер
                          // listController.map((e) => print(e.text));
                          // print(allData);
                          allData.map((e) => print('${e.id} - ${e.value}'));
                        }
                      }
                    },
                    child: const Text('Submit'),
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
