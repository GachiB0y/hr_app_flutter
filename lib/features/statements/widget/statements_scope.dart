import 'package:flutter/widgets.dart';
import 'package:hr_app_flutter/core/utils/extensions/context_extension.dart';
import 'package:hr_app_flutter/features/initialiazation/widget/dependencies_scope.dart';
import 'package:hr_app_flutter/features/statements/bloc/statements_bloc/statements_form_bloc/statements_bloc.dart';
import 'package:hr_app_flutter/features/statements/model/statements/statements.dart';

/// Statements controller that handles statements.
abstract interface class StatementsController {
  /// Create Statement with [itemsForm].
  void create({required StatementFormInfoToSubmit itemsForm}) {}

  /// Fetch Statement by [id].
  void fetch({required String id}) {}

  /// Sign Document Statement by [code].
  void signDocument({required String code}) {}

  StatementsBLoC get statementsBLoC;
}

/// {@template statements_scope}
/// StatementsScope widget.
/// {@endtemplate}
class StatementsScope extends StatefulWidget {
  /// {@macro statements_scope}
  const StatementsScope({
    required this.child,
    super.key,
  });

  /// The widget below this widget in the tree.
  final Widget child;

  /// Obtain the nearest [StatementsController] up its widget tree.
  static StatementsController of(BuildContext context, {bool listen = true}) =>
      context
          .inhOf<_InheritedStatementsScope>(listen: listen)
          .statementsController;

  @override
  State<StatementsScope> createState() => _StatementsScopeState();
}

/// State for widget StatementsScope.
class _StatementsScopeState extends State<StatementsScope>
    implements StatementsController {
  late final StatementsBLoC _statementsBloc;
  /* #region Lifecycle */
  @override
  void initState() {
    _statementsBloc = StatementsBLoC(
      repositoryStatements: DependenciesScope.of(context).statementsRepository,
    );
    super.initState();
    // Initial state initialization
  }

  @override
  void didUpdateWidget(StatementsScope oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Widget configuration changed
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // The configuration of InheritedWidgets has changed
    // Also called after initState but before build
  }

  @override
  void dispose() {
    _statementsBloc.close();
    super.dispose();
  }

  @override
  void create({required StatementFormInfoToSubmit itemsForm}) {
    _statementsBloc.add(StatementsEvent.create(itemsForm: itemsForm));
  }

  @override
  void fetch({required String id}) {
    _statementsBloc.add(StatementsEvent.fetch(id: id));
  }

  @override
  void signDocument({required String code}) {
    _statementsBloc.add(StatementsEvent.signDocument(code: code));
  }

  /* #endregion */

  @override
  Widget build(BuildContext context) => _InheritedStatementsScope(
        state: this,
        statementsController: this,
        child: widget.child,
      );

  @override
  StatementsBLoC get statementsBLoC => _statementsBloc;
}

/// Inherited widget for quick access in the element tree.
class _InheritedStatementsScope extends InheritedWidget {
  const _InheritedStatementsScope({
    required this.statementsController,
    required this.state,
    required super.child,
  });

  /// Statements controller
  final StatementsController statementsController;
  final _StatementsScopeState state;

  /// The state from the closest instance of this class
  /// that encloses the given context, if any.
  /// For example: `StatementsScope.maybeOf(context)`.
  static _InheritedStatementsScope? maybeOf(BuildContext context,
          {bool listen = true}) =>
      listen
          ? context
              .dependOnInheritedWidgetOfExactType<_InheritedStatementsScope>()
          : context
              .getElementForInheritedWidgetOfExactType<
                  _InheritedStatementsScope>()
              ?.widget as _InheritedStatementsScope?;

  static Never _notFoundInheritedWidgetOfExactType() => throw ArgumentError(
        'Out of scope, not found inherited widget '
            'a _InheritedStatementsScope of the exact type',
        'out_of_scope',
      );

  /// The state from the closest instance of this class
  /// that encloses the given context.
  /// For example: `StatementsScope.of(context)`.
  static _InheritedStatementsScope of(BuildContext context,
          {bool listen = true}) =>
      maybeOf(context, listen: listen) ?? _notFoundInheritedWidgetOfExactType();

  @override
  bool updateShouldNotify(covariant _InheritedStatementsScope oldWidget) =>
      false;
}
