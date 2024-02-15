import 'package:flutter/material.dart';
import 'package:hr_app_flutter/core/router/routes.dart';
import 'package:hr_app_flutter/features/home/widget/components/service_element_to_route/service_element_to_route.dart';

class CominSoonScreen extends StatelessWidget {
  const CominSoonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25,
              ),
              Center(
                child: Image.asset(
                  'assets/images/coming_soon.png',
                ),
              ),
              const Center(
                child: Text(
                  'Сорян,\n этот раздел ещё\n в разработке',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 29),
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              const Text(
                'Можешь вернуться на главную или перейти на сервисы ниже',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
              const SizedBox(
                height: 14,
              ),
              const ElementServiceToRouteWidget(
                route: Routes.leanProductionForm,
                titleService: 'Предложить идею',
              ),
              const ElementServiceToRouteWidget(
                route: Routes.searchUser,
                titleService: 'Найти сотрудника',
              ),
              const ElementServiceToRouteWidget(
                route: Routes.scheduleBus,
                titleService: 'Узнать маршруты автобуса',
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
