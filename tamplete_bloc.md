# Tample for BLoC + UI

## BLoC State, используем sealed class.

### Минимум 3 стейта:

- **Загрузка/Processing**
- **Загружно/Success**
- **Ошибка/Error**
  **В примере есть еще стейт Idle - спокойствие**

```dart
/// {@template rookies_state_placeholder}
/// Entity placeholder for RookiesState
/// {@endtemplate}
typedef RookiesEntity = Rookies;

/// {@template rookies_state}
/// RookiesState.
/// {@endtemplate}
sealed class RookiesState extends _$RookiesStateBase {
  /// Idling state
  /// {@macro rookies_state}
  const factory RookiesState.idle({
    required RookiesEntity? data,
    String message,
  }) = RookiesState$Idle;

  /// Processing
  /// {@macro rookies_state}
  const factory RookiesState.processing({
    required RookiesEntity? data,
    String message,
  }) = RookiesState$Processing;

  /// Successful
  /// {@macro rookies_state}
  const factory RookiesState.successful({
    required RookiesEntity? data,
    String message,
  }) = RookiesState$Successful;

  /// An error has occurred
  /// {@macro rookies_state}
  const factory RookiesState.error({
    required RookiesEntity? data,
    String message,
  }) = RookiesState$Error;

  /// {@macro rookies_state}
  const RookiesState({required super.data, required super.message});
}

/// Idling state
/// {@nodoc}
final class RookiesState$Idle extends RookiesState with _$RookiesState {
  /// {@nodoc}
  const RookiesState$Idle({required super.data, super.message = 'Idling'});
}

/// Processing
/// {@nodoc}
final class RookiesState$Processing extends RookiesState with _$RookiesState {
  /// {@nodoc}
  const RookiesState$Processing(
      {required super.data, super.message = 'Processing'});
}

/// Successful
/// {@nodoc}
final class RookiesState$Successful extends RookiesState with _$RookiesState {
  /// {@nodoc}
  const RookiesState$Successful(
      {required super.data, super.message = 'Successful'});
}

/// Error
/// {@nodoc}
final class RookiesState$Error extends RookiesState with _$RookiesState {
  /// {@nodoc}
  const RookiesState$Error(
      {required super.data, super.message = 'An error has occurred.'});
}

/// {@nodoc}
base mixin _$RookiesState on RookiesState {}

/// Pattern matching for [RookiesState].
typedef RookiesStateMatch<R, S extends RookiesState> = R Function(S state);

/// {@nodoc}
@immutable
abstract base class _$RookiesStateBase {
  /// {@nodoc}
  const _$RookiesStateBase({required this.data, required this.message});

  /// Data entity payload.
  @nonVirtual
  final RookiesEntity? data;

  /// Message or state description.
  @nonVirtual
  final String message;

  /// Has data?
  bool get hasData => data != null;

  /// If an error has occurred?
  bool get hasError => maybeMap<bool>(orElse: () => false, error: (_) => true);

  /// Is in progress state?
  bool get isProcessing =>
      maybeMap<bool>(orElse: () => false, processing: (_) => true);

  /// Is in idle state?
  bool get isIdling => !isProcessing;

  /// Pattern matching for [RookiesState].
  R map<R>({
    required RookiesStateMatch<R, RookiesState$Idle> idle,
    required RookiesStateMatch<R, RookiesState$Processing> processing,
    required RookiesStateMatch<R, RookiesState$Successful> successful,
    required RookiesStateMatch<R, RookiesState$Error> error,
  }) =>
      switch (this) {
        RookiesState$Idle s => idle(s),
        RookiesState$Processing s => processing(s),
        RookiesState$Successful s => successful(s),
        RookiesState$Error s => error(s),
        _ => throw AssertionError(),
      };

  /// Pattern matching for [RookiesState].
  R maybeMap<R>({
    RookiesStateMatch<R, RookiesState$Idle>? idle,
    RookiesStateMatch<R, RookiesState$Processing>? processing,
    RookiesStateMatch<R, RookiesState$Successful>? successful,
    RookiesStateMatch<R, RookiesState$Error>? error,
    required R Function() orElse,
  }) =>
      map<R>(
        idle: idle ?? (_) => orElse(),
        processing: processing ?? (_) => orElse(),
        successful: successful ?? (_) => orElse(),
        error: error ?? (_) => orElse(),
      );

  /// Pattern matching for [RookiesState].
  R? mapOrNull<R>({
    RookiesStateMatch<R, RookiesState$Idle>? idle,
    RookiesStateMatch<R, RookiesState$Processing>? processing,
    RookiesStateMatch<R, RookiesState$Successful>? successful,
    RookiesStateMatch<R, RookiesState$Error>? error,
  }) =>
      map<R?>(
        idle: idle ?? (_) => null,
        processing: processing ?? (_) => null,
        successful: successful ?? (_) => null,
        error: error ?? (_) => null,
      );

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other);
}

```

## BLoC Events, используем freezed для генерации евентов.

```dart
/// Business Logic Component Rookies Events
@freezed
class RookiesEvent with _$RookiesEvent {
  const RookiesEvent._();

  /// Fetch
  const factory RookiesEvent.fetch(
      {final DateTime? startDate, final DateTime? endDate}) = RookiesEventFetch;
}

```

## BLoC

```dart
/// Business Logic Component RookiesBLoC
class RookiesBLoC extends Bloc<RookiesEvent, RookiesState>
    implements EventSink<RookiesEvent> {
  RookiesBLoC({
    required final IUserRepository userRepo,
    final RookiesState? initialState,
  })  : _userRepo = userRepo,
        super(
          initialState ??
              const RookiesState.idle(
                data: null,
                message: 'Initial idle state',
              ),
        ) {
    on<RookiesEvent>(
      (event, emit) => event.map<Future<void>>(
        fetch: (event) => _fetch(event, emit),
      ),
      transformer: bloc_concurrency.sequential(),
      //transformer: bloc_concurrency.restartable(),
      //transformer: bloc_concurrency.droppable(),
      //transformer: bloc_concurrency.concurrent(),
    );
  }

  final IUserRepository _userRepo;

  /// Fetch event handler
  Future<void> _fetch(
      RookiesEventFetch event, Emitter<RookiesState> emit) async {
    try {
      emit(RookiesState.processing(data: state.data));
      Rookies rookiesLoaded = await _userRepo
          .getRookiesInfo(startDate: event.startDate, endDate: event.endDate)
          .timeout(const Duration(seconds: 10));

      emit(RookiesState.successful(data: rookiesLoaded));
      // ignore: unused_catch_stack
    } on Object catch (err, stackTrace) {
      //l.e('An error occurred in the RookiesBLoC: $err', stackTrace);
      emit(RookiesState.error(data: state.data));
      rethrow;
    } finally {
      emit(RookiesState.idle(data: state.data));
    }
  }
}
```

## Navigation

### В слое навигации создаем блок

```dart
Routes.rookieInfo => BlocProvider.value(
            value: RookiesBLoC(
              userRepo: DependenciesScope.of(context).userRepository,
            )..add(const RookiesEvent.fetch()),
            child: RookiesInfoScreen(),
          ),
```

## UI

Так как слоф виджетов во Флаттер - конфигурационный. То мы можем использовать стейт виджета как эфмиерное состояние.
Так же стейт BLoC у нас мапится и кажому состоянию мы присваиваем свой виджет.

```dart


class RookiesInfoScreen extends StatelessWidget {
  RookiesInfoScreen({
    super.key,
  });

  final CreateEventsViewModel _model = CreateEventsViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Row(
          children: [
            Text(
              'Новые соотрудники',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            SizedBox(
              width: 5,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: ChangeNotifierProvaider<CreateEventsViewModel>(
            model: _model,
            child: const ListInfoBirthDay(),
          ),
        ),
      ),
    );
  }
}
class ListInfoBirthDay extends StatefulWidget {
  const ListInfoBirthDay({super.key});

  @override
  State<ListInfoBirthDay> createState() => _ListInfoBirthDayState();
}

class _ListInfoBirthDayState extends State<ListInfoBirthDay> {
  final ScrollController _scrollController = ScrollController();
  TextEditingController dateRangeController = TextEditingController();
  @override
  void initState() {
    super.initState();

    final dateNow = DateTime.now();
    final delayedDate = dateNow.add(const Duration(days: -7));
    final formattedDateDelayed =
        DateFormat('dd MMMM', 'ru').format(delayedDate);
    final formattedDateNow = DateFormat('dd MMMM', 'ru').format(dateNow);
    dateRangeController.text = '$formattedDateDelayed - $formattedDateNow ';
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<RookiesBLoC, RookiesState>(
        builder: (context, state) => state.map(
          idle: (state) => BodyContentWidget(
            data: state.data,
            scrollController: _scrollController,
            dateRangeController: dateRangeController,
          ),
          processing: (state) => const Center(
            child: CircularProgressIndicator(),
          ),
          successful: (state) => BodyContentWidget(
            data: state.data,
            scrollController: _scrollController,
            dateRangeController: dateRangeController,
          ),
          error: (state) => BodyContentWidget(
            data: state.data,
            scrollController: _scrollController,
            dateRangeController: dateRangeController,
            isError: true,
          ),
        ),
      );
}
```
