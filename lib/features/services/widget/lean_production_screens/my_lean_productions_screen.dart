import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/core/router/routes.dart';
import 'package:hr_app_flutter/features/initialiazation/widget/dependencies_scope.dart';
import 'package:hr_app_flutter/core/utils/get_icon_by_text_func.dart';
import 'package:intl/intl.dart';
import 'package:octopus/octopus.dart';

import '../../bloc/lean_production_form_bloc/lean_production_form_bloc.dart';

class MyLeanProductionsScreen extends StatefulWidget {
  const MyLeanProductionsScreen({
    super.key,
  });

  @override
  State<MyLeanProductionsScreen> createState() =>
      _MyLeanProductionsScreenState();
}

class _MyLeanProductionsScreenState extends State<MyLeanProductionsScreen> {
  late final LeanProductionFormBloc blocLeanProduction;
  @override
  void initState() {
    super.initState();

    blocLeanProduction = LeanProductionFormBloc(
        authRepository: DependenciesScope.of(context).authRepository,
        repository: DependenciesScope.of(context).leanProductionRepository);
    blocLeanProduction
        .add(const LeanProductionFormEvent.getMyLeanProductions());
  }

  @override
  void dispose() {
    blocLeanProduction.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double radius = 30.0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Row(
          children: [
            Icon(
              Icons.description,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text('Мои заявления')
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: BlocBuilder<LeanProductionFormBloc, LeanProductionFormState>(
            bloc: blocLeanProduction,
            builder: (context, state) {
              if (state is LeanProductionFormState$Processing) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else if (state is LeanProductionFormState$Idle ||
                  state is LeanProductionFormState$Successful) {
                if (state.data!.myProposals != null) {
                  final myProposals = state.data!.myProposals;
                  return ListView.builder(
                      itemCount: myProposals!.length,
                      itemBuilder: ((BuildContext context, int index) {
                        return Card(
                          color: Colors.white,
                          // Color(0xffb3f2b2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(radius),
                          ),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(radius),
                            ),
                            contentPadding: const EdgeInsets.all(16.0),
                            title: Text(
                              'Заявление №${myProposals[index].number}',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onInverseSurface),
                            ),
                            subtitle: Text(DateFormat('dd.MM.yyyy')
                                .format(myProposals[index].date)),
                            trailing: Column(
                              children: [
                                getIconByText(myProposals[index].status),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  myProposals[index].status,
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                              ],
                            ),
                            onTap: () {
                              context.octopus
                                  .setState((stateRoute) => stateRoute
                                    ..add(Routes.infoProposals.node(
                                      arguments: <String, String>{
                                        'id': index.toString(),
                                        'number': myProposals[index].number
                                      },
                                    )));
                            },
                          ),
                        );
                      }));
                } else {
                  return const Center(
                    child: Text('Нет заявлении'),
                  );
                }
              } else {
                return const SafeArea(
                  child: Center(
                    child: Text('Ошибка.Заявления не найденны.'),
                  ),
                );
              }
            }),
      ),
    );
  }
}
