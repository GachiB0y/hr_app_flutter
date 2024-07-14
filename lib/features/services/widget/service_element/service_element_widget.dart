import 'package:flutter/material.dart';
import 'package:hr_app_flutter/core/router/routes.dart';
import 'package:hr_app_flutter/features/services/model/service/service.dart';
import 'package:octopus/octopus.dart';

class ServiceElementWidget extends StatefulWidget {
  const ServiceElementWidget({
    required this.title,
    required this.isRow,
    required this.service,
    required this.tabName,
    super.key,
    this.idHandler,
    this.imagePath,
  });

  final String? imagePath;
  final String? title;
  final int? idHandler;
  final Service service;
  final bool isRow;
  final String tabName;

  @override
  State<ServiceElementWidget> createState() => _ServiceElementWidgetState();
}

class _ServiceElementWidgetState extends State<ServiceElementWidget> {
  String? get imagePath => widget.imagePath;

  @override
  Widget build(BuildContext context) {
    const radius = 18.0;

    final sizeScreen = MediaQuery.of(context).size;

    final sizeWidhtIsRow = sizeScreen.width / 3.9;

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8,
              ),
            ],
            borderRadius: BorderRadius.circular(radius),
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          width: widget.isRow ? sizeWidhtIsRow : null,
          height: MediaQuery.of(context).size.height / 8.0,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              bottom: 16.0,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                textAlign: TextAlign.left,
                widget.title ?? widget.service.name,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 16.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Image.asset(
              imagePath ?? 'assets/images/grass_coin_3d.png',
              width: 34,
              height: 34,
            ),
          ),
        ),
        SizedBox(
          width: widget.isRow ? sizeWidhtIsRow : null,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(radius),
              onTap: () async {
                late final Routes route;
                if (widget.service.id == 22 &&
                    widget.service.permissions.createService == true &&
                    widget.idHandler == 1) {
                  await context.octopus.setState(
                    (state) => state
                      ..findByName(widget.tabName)?.add(
                        OctopusNode.mutable(
                          'create-news',
                          children: [
                            Routes.createNewsType.node(),
                          ],
                        ),
                      ),
                  );
                  return;
                } else if (widget.service.id == 22 &&
                    widget.service.permissions.approveService == true &&
                    widget.idHandler == 2) {
                  route = Routes.approveNews;
                  // Octopus.of(context).push(Routes.approveNews);
                } else if (widget.service.id == 25) {
                  // Octopus.of(context).push(Routes.scheduleBus);
                  route = Routes.scheduleBus;
                } else if (widget.service.id == 24) {
                  // Octopus.of(context).push(Routes.statementsForm);
                  route = Routes.statementsForm;
                }

                await context.octopus.setState(
                  (state) => state
                    ..findByName(widget.tabName)?.add(
                      route.node(),
                    ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
