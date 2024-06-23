import 'package:flutter/material.dart';
import 'package:hr_app_flutter/core/router/routes.dart';
import 'package:octopus/octopus.dart';

class ElementServiceToRouteWidget extends StatelessWidget {
  const ElementServiceToRouteWidget({
    super.key,
    required this.route,
    required this.titleService,
    required this.nameParent,
  });

  final Routes route;
  final String nameParent;
  final String titleService;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        switch (route) {
          case Routes.writeProblemLeanProductionScreen:
            {
              // context.octopus.setState((state) {
              //   final node = state.findByName('create-lean-production');
              //   if (node == null) {
              //     return state
              //       ..add(OctopusNode.mutable('create-lean-production',
              //           children: [
              //             Routes.writeProblemLeanProductionScreen.node(),
              //           ]));
              //   }

              //   return state;
              // });

              context.octopus.setState(
                (state) => state
                  ..findByName(nameParent)?.add(
                      OctopusNode.mutable('create-lean-production', children: [
                    route.node(),
                  ])),
              );
            }
          case Routes.createNewsType:
            {
              context.octopus.setState(
                (state) => state
                  ..findByName(nameParent)
                      ?.add(OctopusNode.mutable('create-news', children: [
                    route.node(),
                  ])),
              );
            }
          default:
            {
              context.octopus.setState(
                (state) => state
                  ..findByName(nameParent)?.add(
                    route.node(),
                  ),
              );
            }
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        elevation: MaterialStateProperty.all(0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titleService,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Icon(
            Icons.chevron_right,
            size: 32,
            color: Theme.of(context).colorScheme.outline,
          ),
        ],
      ),
    );
  }
}
