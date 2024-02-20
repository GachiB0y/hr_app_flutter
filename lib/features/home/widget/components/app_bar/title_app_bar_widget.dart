import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/core/widget/components/shimmer/shimmer.dart';
import 'package:hr_app_flutter/features/wallet/bloc/wallet_bloc/wallet_bloc.dart';

import '../../../../user/bloc/user_bloc/user_bloc.dart';

class TitleAppBarWidget extends StatelessWidget {
  const TitleAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (BuildContext context, UserState stateUserBloc) {
        return (stateUserBloc.data == null ||
                stateUserBloc is UserState$Processing ||
                stateUserBloc is UserState$Error)
            ? ShimmerLoading(
                isLoading: true,
                child: Container(
                  width: double.infinity,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              )
            : Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Text(
                          'Привет, ${stateUserBloc.data?.authUser.nameI}!',
                          softWrap: true,
                          maxLines: 2,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Color(0xFF00C8E0), Color(0xFF00D000)],
                              ),
                              borderRadius: BorderRadius.circular(63),
                            ),
                            child: BlocBuilder<WalletBLoC, WalletState>(
                              builder: (context, state) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0,
                                  ),
                                  child: Text(
                                    '${state.data == null ? '0' : state.data!.balance} coin',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            fontSize: 18, color: Colors.white),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          SizedBox(
                            width: 150,
                            child: Text(
                              softWrap: true,
                              maxLines: 1,
                              stateUserBloc.data!.authUser.email ?? '',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.outline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );
      },
    );
  }
}
