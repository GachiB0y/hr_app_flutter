import 'package:flutter/material.dart';

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SimpleCalcWidget(),
      ),
    );
  }
}

class SimpleCalcWidget extends StatefulWidget {
  const SimpleCalcWidget({super.key});

  @override
  State<SimpleCalcWidget> createState() => _SimpleCalcWidgetState();
}

class _SimpleCalcWidgetState extends State<SimpleCalcWidget> {
  final _model = SimpleCalcWidgetModel();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ChangeNotifierProvaider<SimpleCalcWidgetModel>(
          model: _model,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              const FirstNumberWidget(),
              SizedBox(
                height: 10,
              ),
              const SecondNumberWidget(),
              SizedBox(
                height: 10,
              ),
              const SummButtonWidget(),
              SizedBox(
                height: 10,
              ),
              const ResultWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class FirstNumberWidget extends StatelessWidget {
  const FirstNumberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(border: OutlineInputBorder()),
      onChanged: (value) => ChangeNotifierProvaider.read<
              ChangeNotifierProvaider<SimpleCalcWidgetModel>,
              SimpleCalcWidgetModel>(context)
          ?.firstNumber = value,
    );
  }
}

class SecondNumberWidget extends StatelessWidget {
  const SecondNumberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(border: OutlineInputBorder()),
      onChanged: (value) => ChangeNotifierProvaider.read<
              ChangeNotifierProvaider<SimpleCalcWidgetModel>,
              SimpleCalcWidgetModel>(context)
          ?.secondNumber = value,
    );
  }
}

class SummButtonWidget extends StatelessWidget {
  const SummButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => ChangeNotifierProvaider.read<
                ChangeNotifierProvaider<SimpleCalcWidgetModel>,
                SimpleCalcWidgetModel>(context)
            ?.sum(),
        child: const Text('Count summ'));
  }
}

class ResultWidget extends StatelessWidget {
  const ResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final value = ChangeNotifierProvaider.watch<
                ChangeNotifierProvaider<SimpleCalcWidgetModel>,
                SimpleCalcWidgetModel>(context)
            ?.summResult ??
        '-1';
    return Text('Result: $value');
  }
}

class SimpleCalcWidgetModel extends Listenable {
  // Создание списка слушателей
  final List<VoidCallback> _listeners = [];
  int? _firstNumber;
  int? _secondNumber;
  int? summResult;

  set firstNumber(String value) => _firstNumber = int.tryParse(value);
  set secondNumber(String value) => _secondNumber = int.tryParse(value);

  // Метод для добавления слушателей
  @override
  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  // Метод для удаления слушателей
  @override
  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }

  // Метод для уведомления слушателей об изменениях
  void notifyListeners() {
    for (final listener in _listeners) {
      listener();
    }
  }

  void sum() {
    int? summResult;
    if (_firstNumber != null && _secondNumber != null) {
      summResult = _firstNumber! + _secondNumber!;
    } else {
      summResult = null;
    }
    if (this.summResult != summResult) {
      this.summResult = summResult;
      notifyListeners();
    }
  }
}

class SimpleCalcWidgetProvider
    extends InheritedNotifier<SimpleCalcWidgetModel> {
  final SimpleCalcWidgetModel model;
  SimpleCalcWidgetProvider(
      {Key? key, required this.model, required Widget child})
      : super(key: key, child: child, notifier: model);

  static SimpleCalcWidgetModel? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SimpleCalcWidgetProvider>()
        ?.notifier;
  }

  static SimpleCalcWidgetModel? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<SimpleCalcWidgetProvider>()
        ?.widget;
    return widget is SimpleCalcWidgetProvider ? widget.notifier : null;
  }
}

class ChangeNotifierProvaider<T extends Listenable>
    extends InheritedNotifier<T> {
  final T? model;
  const ChangeNotifierProvaider(
      {Key? key, required this.model, required Widget child})
      : super(key: key, child: child, notifier: model);

  static T? watch<M extends ChangeNotifierProvaider<T>, T extends Listenable>(
      BuildContext context) {
    final notifier = context.dependOnInheritedWidgetOfExactType<M>()?.notifier;
    if (notifier != null) {
      return notifier;
    }
    return null;
  }

  static T? read<M extends ChangeNotifierProvaider<T>, T extends Listenable>(
      BuildContext context) {
    final widget = context.getElementForInheritedWidgetOfExactType<M>()?.widget;
    return widget is ChangeNotifierProvaider ? widget.notifier as T : null;
  }
}
