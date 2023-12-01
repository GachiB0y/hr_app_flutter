import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/features/auth/data/repo/auth_repository.dart';
import 'package:hr_app_flutter/features/services/data/repo/lean_production_repository.dart';
import 'package:hr_app_flutter/features/user/data/repo/user_repository.dart';
import 'package:hr_app_flutter/router/router.dart';
import 'package:hr_app_flutter/core/utils/get_icon_by_text_func.dart';
import 'package:intl/intl.dart';

import '../../bloc/lean_production_form_bloc/lean_production_form_bloc.dart';

@RoutePage()
class MyLeanProductionsScreen extends StatefulWidget
    implements AutoRouteWrapper {
  const MyLeanProductionsScreen(
      {super.key,
      required this.authRepository,
      required this.userRepo,
      required this.leanRepository});

  final IAuthRepository authRepository;
  final IUserRepository userRepo;
  final ILeanProductionRepository leanRepository;

  @override
  State<MyLeanProductionsScreen> createState() =>
      _MyLeanProductionsScreenState();
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
}

class _MyLeanProductionsScreenState extends State<MyLeanProductionsScreen> {
  @override
  void initState() {
    super.initState();

    final blocLeanProduction = context.read<LeanProductionFormBloc>();
    blocLeanProduction
        .add(const LeanProductionFormEvent.getMyLeanProductions());
  }

  @override
  Widget build(BuildContext context) {
    final LeanProductionFormBloc blocLeanProduction =
        context.watch<LeanProductionFormBloc>();
    const double radius = 30.0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
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
        child: blocLeanProduction.state.when(
          loading: () {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          },
          loaded: (myProposals, isSubmitted, isLoadingFile) {
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
                        style: const TextStyle(fontSize: 18),
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
                        AutoRouter.of(context).push(
                            LeanProductionInfoProposalsRoute(
                                modelLeanProduction: myProposals[index],
                                blocLeanProduction: blocLeanProduction,
                                authRepository:
                                    blocLeanProduction.authRepository,
                                userRepo: blocLeanProduction.userRepo,
                                leanRepository:
                                    blocLeanProduction.leanRepository));
                      },
                    ),
                  );
                }));
          },
          error: (e, exception) => const SafeArea(
            child: Center(
              child: Text('Ошибка.Заявления не найденны.'),
            ),
          ),
        ),
      ),
    );
  }
}
