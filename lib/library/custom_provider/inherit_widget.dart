import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Example(),
  ));
}

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
          child: SimpleCalcWidgetProvider(
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
          )),
    );
  }
}

class FirstNumberWidget extends StatelessWidget {
  const FirstNumberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(border: OutlineInputBorder()),
      onChanged: (value) =>
          SimpleCalcWidgetProvider.read(context)?.firstNumber = value,
    );
  }
}

class SecondNumberWidget extends StatelessWidget {
  const SecondNumberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(border: OutlineInputBorder()),
      onChanged: (value) =>
          SimpleCalcWidgetProvider.read(context)?.secondNumber = value,
    );
  }
}

class SummButtonWidget extends StatelessWidget {
  const SummButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => SimpleCalcWidgetProvider.read(context)?.sum(),
        child: const Text('Count summ'));
  }
}

// class ResultWidget extends StatefulWidget {
//   const ResultWidget({Key? key}) : super(key: key);
//   @override
//   State<ResultWidget> createState() => _ResultWidgetState();
// }

// class _ResultWidgetState extends State<ResultWidget> {
//   String _value = '-1';

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     final model = SimpleCalcWidgetProvider.of(context)?.model;
//     model?.addListener(() {
//       _value = '${model.summResult}';
//       setState(() {});
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Text('Result:$_value');
//   }
// }

class ResultWidget extends StatelessWidget {
  const ResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final value = SimpleCalcWidgetProvider.watch(context)?.summResult ?? '-1';
    return Text('Result: $value');
  }
}

class SimpleCalcWidgetModel extends ChangeNotifier {
  int? _firstNumber;
  int? _secondNumber;
  int? summResult;

  set firstNumber(String value) => _firstNumber = int.tryParse(value);
  set secondNumber(String value) => _secondNumber = int.tryParse(value);

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
  // @override
  // bool updateShouldNotify(covariant SimpleCalcWidgetProvider oldWidget) {
  //   return model != oldWidget.model;
  // }
}
