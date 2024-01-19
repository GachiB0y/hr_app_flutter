import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/core/widget/components/shimmer/shimmer.dart';

import '../../../../user/bloc/user_bloc/user_bloc.dart';

class TitleAppBarWidget extends StatelessWidget {
  const TitleAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (BuildContext context, UserState state) {
        return (state.data == null ||
                state is UserState$Processing ||
                state is UserState$Error)
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
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          '${'${state.data?.authUser.name} ${state.data?.authUser.nameI}'} ',
                          softWrap: true,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          softWrap: true,
                          maxLines: 2,
                          state.data!.authUser.staffPosition,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.outline),
                        ),
                      ),
                    ],
                  ),
                ],
              );
      },
    );
  }
}
