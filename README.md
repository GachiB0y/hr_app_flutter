# HRApp (hr_app_flutter)

## Обзор проекта

- **State management:** [BLoC](https://bloclibrary.dev/) with [concurrency](https://pub.dev/documentation/bloc_concurrency/latest/index.html)
- **Dependency Injection:** DI Container
- **Navigation:** [Octopus](https://pub.dev/packages/octopus/)
- **Networking:** [Dio](https://pub.dev/documentation/dio/latest/)
- **Storage:** [SharedPreferences](https://docs.flutter.dev/cookbook/persistence/key-value)
- **Logging:** [Logging](https://pub.dev/documentation/logging/latest/)
- **Code-generation:** [Build-Runner](https://dart.dev/tools/build_runner) + [Freezed](https://pub.dev/packages/freezed)

## Структура проекта

### Структура приложения

- `src` - общая директория
  - `core` - директория в которой храняться общие зависимости
  - `features` - директория в которой храняться фичи
- `main.dart` входные точки в приложение

### Общая стуктура

- `components` - обертки над БД, RestClient, Interceptor
- `constant` - константы, в оснвном иконки через шрифт
- `controller` - обертки над стейт-менеджмент, самописные хендлеры и т.д
- `localization` - локализация проекта
- `model` - общие модели
- `router` - слой навигации & роутинга
- `utils` - слой хранения инструментария & утилит
- `widget` - общие виджеты

### Структура фичи

- `data` - слой данных
  - `repo` - контракты/ипмплиментация репозиториев
  - `rest_clients` - сущности для работы с API
- `bloc` - стейт-менеджмент
- `models` - стейт-менеджмент
- `widget` - используемые в фичи виджеты/ экраны
