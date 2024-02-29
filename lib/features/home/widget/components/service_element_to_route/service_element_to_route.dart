import 'package:flutter/material.dart';
import 'package:hr_app_flutter/core/router/routes.dart';
import 'package:octopus/octopus.dart';

class ElementServiceToRouteWidget extends StatelessWidget {
  const ElementServiceToRouteWidget({
    super.key,
    required this.route,
    required this.titleService,
  });

  final Routes route;
  final String titleService;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Octopus.of(context).push(route);
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
