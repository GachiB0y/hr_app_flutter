// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SettingsState {
  /// The current locale.
  Locale get locale => throw _privateConstructorUsedError;

  /// The current theme mode.
  AppTheme get appTheme => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Locale locale, AppTheme appTheme) idle,
    required TResult Function(Locale locale, AppTheme appTheme) processing,
    required TResult Function(Locale locale, AppTheme appTheme, String message)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Locale locale, AppTheme appTheme)? idle,
    TResult? Function(Locale locale, AppTheme appTheme)? processing,
    TResult? Function(Locale locale, AppTheme appTheme, String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Locale locale, AppTheme appTheme)? idle,
    TResult Function(Locale locale, AppTheme appTheme)? processing,
    TResult Function(Locale locale, AppTheme appTheme, String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IdleSettingsState value) idle,
    required TResult Function(_ProcessingSettingsState value) processing,
    required TResult Function(_ErrorSettingsState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IdleSettingsState value)? idle,
    TResult? Function(_ProcessingSettingsState value)? processing,
    TResult? Function(_ErrorSettingsState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IdleSettingsState value)? idle,
    TResult Function(_ProcessingSettingsState value)? processing,
    TResult Function(_ErrorSettingsState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingsStateCopyWith<SettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
          SettingsState value, $Res Function(SettingsState) then) =
      _$SettingsStateCopyWithImpl<$Res, SettingsState>;
  @useResult
  $Res call({Locale locale, AppTheme appTheme});
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res, $Val extends SettingsState>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
    Object? appTheme = null,
  }) {
    return _then(_value.copyWith(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
      appTheme: null == appTheme
          ? _value.appTheme
          : appTheme // ignore: cast_nullable_to_non_nullable
              as AppTheme,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_IdleSettingsStateCopyWith<$Res>
    implements $SettingsStateCopyWith<$Res> {
  factory _$$_IdleSettingsStateCopyWith(_$_IdleSettingsState value,
          $Res Function(_$_IdleSettingsState) then) =
      __$$_IdleSettingsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Locale locale, AppTheme appTheme});
}

/// @nodoc
class __$$_IdleSettingsStateCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$_IdleSettingsState>
    implements _$$_IdleSettingsStateCopyWith<$Res> {
  __$$_IdleSettingsStateCopyWithImpl(
      _$_IdleSettingsState _value, $Res Function(_$_IdleSettingsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
    Object? appTheme = null,
  }) {
    return _then(_$_IdleSettingsState(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
      appTheme: null == appTheme
          ? _value.appTheme
          : appTheme // ignore: cast_nullable_to_non_nullable
              as AppTheme,
    ));
  }
}

/// @nodoc

class _$_IdleSettingsState extends _IdleSettingsState {
  const _$_IdleSettingsState({required this.locale, required this.appTheme})
      : super._();

  /// The current locale.
  @override
  final Locale locale;

  /// The current theme mode.
  @override
  final AppTheme appTheme;

  @override
  String toString() {
    return 'SettingsState.idle(locale: $locale, appTheme: $appTheme)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IdleSettingsState &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.appTheme, appTheme) ||
                other.appTheme == appTheme));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale, appTheme);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IdleSettingsStateCopyWith<_$_IdleSettingsState> get copyWith =>
      __$$_IdleSettingsStateCopyWithImpl<_$_IdleSettingsState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Locale locale, AppTheme appTheme) idle,
    required TResult Function(Locale locale, AppTheme appTheme) processing,
    required TResult Function(Locale locale, AppTheme appTheme, String message)
        error,
  }) {
    return idle(locale, appTheme);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Locale locale, AppTheme appTheme)? idle,
    TResult? Function(Locale locale, AppTheme appTheme)? processing,
    TResult? Function(Locale locale, AppTheme appTheme, String message)? error,
  }) {
    return idle?.call(locale, appTheme);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Locale locale, AppTheme appTheme)? idle,
    TResult Function(Locale locale, AppTheme appTheme)? processing,
    TResult Function(Locale locale, AppTheme appTheme, String message)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(locale, appTheme);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IdleSettingsState value) idle,
    required TResult Function(_ProcessingSettingsState value) processing,
    required TResult Function(_ErrorSettingsState value) error,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IdleSettingsState value)? idle,
    TResult? Function(_ProcessingSettingsState value)? processing,
    TResult? Function(_ErrorSettingsState value)? error,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IdleSettingsState value)? idle,
    TResult Function(_ProcessingSettingsState value)? processing,
    TResult Function(_ErrorSettingsState value)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _IdleSettingsState extends SettingsState {
  const factory _IdleSettingsState(
      {required final Locale locale,
      required final AppTheme appTheme}) = _$_IdleSettingsState;
  const _IdleSettingsState._() : super._();

  @override

  /// The current locale.
  Locale get locale;
  @override

  /// The current theme mode.
  AppTheme get appTheme;
  @override
  @JsonKey(ignore: true)
  _$$_IdleSettingsStateCopyWith<_$_IdleSettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ProcessingSettingsStateCopyWith<$Res>
    implements $SettingsStateCopyWith<$Res> {
  factory _$$_ProcessingSettingsStateCopyWith(_$_ProcessingSettingsState value,
          $Res Function(_$_ProcessingSettingsState) then) =
      __$$_ProcessingSettingsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Locale locale, AppTheme appTheme});
}

/// @nodoc
class __$$_ProcessingSettingsStateCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$_ProcessingSettingsState>
    implements _$$_ProcessingSettingsStateCopyWith<$Res> {
  __$$_ProcessingSettingsStateCopyWithImpl(_$_ProcessingSettingsState _value,
      $Res Function(_$_ProcessingSettingsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
    Object? appTheme = null,
  }) {
    return _then(_$_ProcessingSettingsState(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
      appTheme: null == appTheme
          ? _value.appTheme
          : appTheme // ignore: cast_nullable_to_non_nullable
              as AppTheme,
    ));
  }
}

/// @nodoc

class _$_ProcessingSettingsState extends _ProcessingSettingsState {
  const _$_ProcessingSettingsState(
      {required this.locale, required this.appTheme})
      : super._();

  /// The current locale.
  @override
  final Locale locale;

  /// The current theme mode.
  @override
  final AppTheme appTheme;

  @override
  String toString() {
    return 'SettingsState.processing(locale: $locale, appTheme: $appTheme)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProcessingSettingsState &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.appTheme, appTheme) ||
                other.appTheme == appTheme));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale, appTheme);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProcessingSettingsStateCopyWith<_$_ProcessingSettingsState>
      get copyWith =>
          __$$_ProcessingSettingsStateCopyWithImpl<_$_ProcessingSettingsState>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Locale locale, AppTheme appTheme) idle,
    required TResult Function(Locale locale, AppTheme appTheme) processing,
    required TResult Function(Locale locale, AppTheme appTheme, String message)
        error,
  }) {
    return processing(locale, appTheme);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Locale locale, AppTheme appTheme)? idle,
    TResult? Function(Locale locale, AppTheme appTheme)? processing,
    TResult? Function(Locale locale, AppTheme appTheme, String message)? error,
  }) {
    return processing?.call(locale, appTheme);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Locale locale, AppTheme appTheme)? idle,
    TResult Function(Locale locale, AppTheme appTheme)? processing,
    TResult Function(Locale locale, AppTheme appTheme, String message)? error,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(locale, appTheme);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IdleSettingsState value) idle,
    required TResult Function(_ProcessingSettingsState value) processing,
    required TResult Function(_ErrorSettingsState value) error,
  }) {
    return processing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IdleSettingsState value)? idle,
    TResult? Function(_ProcessingSettingsState value)? processing,
    TResult? Function(_ErrorSettingsState value)? error,
  }) {
    return processing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IdleSettingsState value)? idle,
    TResult Function(_ProcessingSettingsState value)? processing,
    TResult Function(_ErrorSettingsState value)? error,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(this);
    }
    return orElse();
  }
}

abstract class _ProcessingSettingsState extends SettingsState {
  const factory _ProcessingSettingsState(
      {required final Locale locale,
      required final AppTheme appTheme}) = _$_ProcessingSettingsState;
  const _ProcessingSettingsState._() : super._();

  @override

  /// The current locale.
  Locale get locale;
  @override

  /// The current theme mode.
  AppTheme get appTheme;
  @override
  @JsonKey(ignore: true)
  _$$_ProcessingSettingsStateCopyWith<_$_ProcessingSettingsState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorSettingsStateCopyWith<$Res>
    implements $SettingsStateCopyWith<$Res> {
  factory _$$_ErrorSettingsStateCopyWith(_$_ErrorSettingsState value,
          $Res Function(_$_ErrorSettingsState) then) =
      __$$_ErrorSettingsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Locale locale, AppTheme appTheme, String message});
}

/// @nodoc
class __$$_ErrorSettingsStateCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$_ErrorSettingsState>
    implements _$$_ErrorSettingsStateCopyWith<$Res> {
  __$$_ErrorSettingsStateCopyWithImpl(
      _$_ErrorSettingsState _value, $Res Function(_$_ErrorSettingsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
    Object? appTheme = null,
    Object? message = null,
  }) {
    return _then(_$_ErrorSettingsState(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
      appTheme: null == appTheme
          ? _value.appTheme
          : appTheme // ignore: cast_nullable_to_non_nullable
              as AppTheme,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ErrorSettingsState extends _ErrorSettingsState {
  const _$_ErrorSettingsState(
      {required this.locale, required this.appTheme, required this.message})
      : super._();

  /// The current locale.
  @override
  final Locale locale;

  /// The current theme mode.
  @override
  final AppTheme appTheme;

  /// The error message.
  @override
  final String message;

  @override
  String toString() {
    return 'SettingsState.error(locale: $locale, appTheme: $appTheme, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ErrorSettingsState &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.appTheme, appTheme) ||
                other.appTheme == appTheme) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale, appTheme, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorSettingsStateCopyWith<_$_ErrorSettingsState> get copyWith =>
      __$$_ErrorSettingsStateCopyWithImpl<_$_ErrorSettingsState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Locale locale, AppTheme appTheme) idle,
    required TResult Function(Locale locale, AppTheme appTheme) processing,
    required TResult Function(Locale locale, AppTheme appTheme, String message)
        error,
  }) {
    return error(locale, appTheme, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Locale locale, AppTheme appTheme)? idle,
    TResult? Function(Locale locale, AppTheme appTheme)? processing,
    TResult? Function(Locale locale, AppTheme appTheme, String message)? error,
  }) {
    return error?.call(locale, appTheme, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Locale locale, AppTheme appTheme)? idle,
    TResult Function(Locale locale, AppTheme appTheme)? processing,
    TResult Function(Locale locale, AppTheme appTheme, String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(locale, appTheme, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IdleSettingsState value) idle,
    required TResult Function(_ProcessingSettingsState value) processing,
    required TResult Function(_ErrorSettingsState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IdleSettingsState value)? idle,
    TResult? Function(_ProcessingSettingsState value)? processing,
    TResult? Function(_ErrorSettingsState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IdleSettingsState value)? idle,
    TResult Function(_ProcessingSettingsState value)? processing,
    TResult Function(_ErrorSettingsState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorSettingsState extends SettingsState {
  const factory _ErrorSettingsState(
      {required final Locale locale,
      required final AppTheme appTheme,
      required final String message}) = _$_ErrorSettingsState;
  const _ErrorSettingsState._() : super._();

  @override

  /// The current locale.
  Locale get locale;
  @override

  /// The current theme mode.
  AppTheme get appTheme;

  /// The error message.
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_ErrorSettingsStateCopyWith<_$_ErrorSettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SettingsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppTheme appTheme) updateTheme,
    required TResult Function(Locale locale) updateLocale,
    required TResult Function() toggleTeheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppTheme appTheme)? updateTheme,
    TResult? Function(Locale locale)? updateLocale,
    TResult? Function()? toggleTeheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppTheme appTheme)? updateTheme,
    TResult Function(Locale locale)? updateLocale,
    TResult Function()? toggleTeheme,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateThemeSettingsEvent value) updateTheme,
    required TResult Function(_UpdateLocaleSettingsEvent value) updateLocale,
    required TResult Function(_ToggleThemeSettingsEvent value) toggleTeheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateThemeSettingsEvent value)? updateTheme,
    TResult? Function(_UpdateLocaleSettingsEvent value)? updateLocale,
    TResult? Function(_ToggleThemeSettingsEvent value)? toggleTeheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateThemeSettingsEvent value)? updateTheme,
    TResult Function(_UpdateLocaleSettingsEvent value)? updateLocale,
    TResult Function(_ToggleThemeSettingsEvent value)? toggleTeheme,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsEventCopyWith<$Res> {
  factory $SettingsEventCopyWith(
          SettingsEvent value, $Res Function(SettingsEvent) then) =
      _$SettingsEventCopyWithImpl<$Res, SettingsEvent>;
}

/// @nodoc
class _$SettingsEventCopyWithImpl<$Res, $Val extends SettingsEvent>
    implements $SettingsEventCopyWith<$Res> {
  _$SettingsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_UpdateThemeSettingsEventCopyWith<$Res> {
  factory _$$_UpdateThemeSettingsEventCopyWith(
          _$_UpdateThemeSettingsEvent value,
          $Res Function(_$_UpdateThemeSettingsEvent) then) =
      __$$_UpdateThemeSettingsEventCopyWithImpl<$Res>;
  @useResult
  $Res call({AppTheme appTheme});
}

/// @nodoc
class __$$_UpdateThemeSettingsEventCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res, _$_UpdateThemeSettingsEvent>
    implements _$$_UpdateThemeSettingsEventCopyWith<$Res> {
  __$$_UpdateThemeSettingsEventCopyWithImpl(_$_UpdateThemeSettingsEvent _value,
      $Res Function(_$_UpdateThemeSettingsEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appTheme = null,
  }) {
    return _then(_$_UpdateThemeSettingsEvent(
      appTheme: null == appTheme
          ? _value.appTheme
          : appTheme // ignore: cast_nullable_to_non_nullable
              as AppTheme,
    ));
  }
}

/// @nodoc

class _$_UpdateThemeSettingsEvent extends _UpdateThemeSettingsEvent {
  const _$_UpdateThemeSettingsEvent({required this.appTheme}) : super._();

  /// The new theme mode.
  @override
  final AppTheme appTheme;

  @override
  String toString() {
    return 'SettingsEvent.updateTheme(appTheme: $appTheme)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateThemeSettingsEvent &&
            (identical(other.appTheme, appTheme) ||
                other.appTheme == appTheme));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appTheme);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateThemeSettingsEventCopyWith<_$_UpdateThemeSettingsEvent>
      get copyWith => __$$_UpdateThemeSettingsEventCopyWithImpl<
          _$_UpdateThemeSettingsEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppTheme appTheme) updateTheme,
    required TResult Function(Locale locale) updateLocale,
    required TResult Function() toggleTeheme,
  }) {
    return updateTheme(appTheme);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppTheme appTheme)? updateTheme,
    TResult? Function(Locale locale)? updateLocale,
    TResult? Function()? toggleTeheme,
  }) {
    return updateTheme?.call(appTheme);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppTheme appTheme)? updateTheme,
    TResult Function(Locale locale)? updateLocale,
    TResult Function()? toggleTeheme,
    required TResult orElse(),
  }) {
    if (updateTheme != null) {
      return updateTheme(appTheme);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateThemeSettingsEvent value) updateTheme,
    required TResult Function(_UpdateLocaleSettingsEvent value) updateLocale,
    required TResult Function(_ToggleThemeSettingsEvent value) toggleTeheme,
  }) {
    return updateTheme(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateThemeSettingsEvent value)? updateTheme,
    TResult? Function(_UpdateLocaleSettingsEvent value)? updateLocale,
    TResult? Function(_ToggleThemeSettingsEvent value)? toggleTeheme,
  }) {
    return updateTheme?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateThemeSettingsEvent value)? updateTheme,
    TResult Function(_UpdateLocaleSettingsEvent value)? updateLocale,
    TResult Function(_ToggleThemeSettingsEvent value)? toggleTeheme,
    required TResult orElse(),
  }) {
    if (updateTheme != null) {
      return updateTheme(this);
    }
    return orElse();
  }
}

abstract class _UpdateThemeSettingsEvent extends SettingsEvent {
  const factory _UpdateThemeSettingsEvent({required final AppTheme appTheme}) =
      _$_UpdateThemeSettingsEvent;
  const _UpdateThemeSettingsEvent._() : super._();

  /// The new theme mode.
  AppTheme get appTheme;
  @JsonKey(ignore: true)
  _$$_UpdateThemeSettingsEventCopyWith<_$_UpdateThemeSettingsEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateLocaleSettingsEventCopyWith<$Res> {
  factory _$$_UpdateLocaleSettingsEventCopyWith(
          _$_UpdateLocaleSettingsEvent value,
          $Res Function(_$_UpdateLocaleSettingsEvent) then) =
      __$$_UpdateLocaleSettingsEventCopyWithImpl<$Res>;
  @useResult
  $Res call({Locale locale});
}

/// @nodoc
class __$$_UpdateLocaleSettingsEventCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res, _$_UpdateLocaleSettingsEvent>
    implements _$$_UpdateLocaleSettingsEventCopyWith<$Res> {
  __$$_UpdateLocaleSettingsEventCopyWithImpl(
      _$_UpdateLocaleSettingsEvent _value,
      $Res Function(_$_UpdateLocaleSettingsEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
  }) {
    return _then(_$_UpdateLocaleSettingsEvent(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
    ));
  }
}

/// @nodoc

class _$_UpdateLocaleSettingsEvent extends _UpdateLocaleSettingsEvent {
  const _$_UpdateLocaleSettingsEvent({required this.locale}) : super._();

  /// The new locale.
  @override
  final Locale locale;

  @override
  String toString() {
    return 'SettingsEvent.updateLocale(locale: $locale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateLocaleSettingsEvent &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateLocaleSettingsEventCopyWith<_$_UpdateLocaleSettingsEvent>
      get copyWith => __$$_UpdateLocaleSettingsEventCopyWithImpl<
          _$_UpdateLocaleSettingsEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppTheme appTheme) updateTheme,
    required TResult Function(Locale locale) updateLocale,
    required TResult Function() toggleTeheme,
  }) {
    return updateLocale(locale);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppTheme appTheme)? updateTheme,
    TResult? Function(Locale locale)? updateLocale,
    TResult? Function()? toggleTeheme,
  }) {
    return updateLocale?.call(locale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppTheme appTheme)? updateTheme,
    TResult Function(Locale locale)? updateLocale,
    TResult Function()? toggleTeheme,
    required TResult orElse(),
  }) {
    if (updateLocale != null) {
      return updateLocale(locale);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateThemeSettingsEvent value) updateTheme,
    required TResult Function(_UpdateLocaleSettingsEvent value) updateLocale,
    required TResult Function(_ToggleThemeSettingsEvent value) toggleTeheme,
  }) {
    return updateLocale(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateThemeSettingsEvent value)? updateTheme,
    TResult? Function(_UpdateLocaleSettingsEvent value)? updateLocale,
    TResult? Function(_ToggleThemeSettingsEvent value)? toggleTeheme,
  }) {
    return updateLocale?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateThemeSettingsEvent value)? updateTheme,
    TResult Function(_UpdateLocaleSettingsEvent value)? updateLocale,
    TResult Function(_ToggleThemeSettingsEvent value)? toggleTeheme,
    required TResult orElse(),
  }) {
    if (updateLocale != null) {
      return updateLocale(this);
    }
    return orElse();
  }
}

abstract class _UpdateLocaleSettingsEvent extends SettingsEvent {
  const factory _UpdateLocaleSettingsEvent({required final Locale locale}) =
      _$_UpdateLocaleSettingsEvent;
  const _UpdateLocaleSettingsEvent._() : super._();

  /// The new locale.
  Locale get locale;
  @JsonKey(ignore: true)
  _$$_UpdateLocaleSettingsEventCopyWith<_$_UpdateLocaleSettingsEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ToggleThemeSettingsEventCopyWith<$Res> {
  factory _$$_ToggleThemeSettingsEventCopyWith(
          _$_ToggleThemeSettingsEvent value,
          $Res Function(_$_ToggleThemeSettingsEvent) then) =
      __$$_ToggleThemeSettingsEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ToggleThemeSettingsEventCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res, _$_ToggleThemeSettingsEvent>
    implements _$$_ToggleThemeSettingsEventCopyWith<$Res> {
  __$$_ToggleThemeSettingsEventCopyWithImpl(_$_ToggleThemeSettingsEvent _value,
      $Res Function(_$_ToggleThemeSettingsEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ToggleThemeSettingsEvent extends _ToggleThemeSettingsEvent {
  const _$_ToggleThemeSettingsEvent() : super._();

  @override
  String toString() {
    return 'SettingsEvent.toggleTeheme()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ToggleThemeSettingsEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppTheme appTheme) updateTheme,
    required TResult Function(Locale locale) updateLocale,
    required TResult Function() toggleTeheme,
  }) {
    return toggleTeheme();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppTheme appTheme)? updateTheme,
    TResult? Function(Locale locale)? updateLocale,
    TResult? Function()? toggleTeheme,
  }) {
    return toggleTeheme?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppTheme appTheme)? updateTheme,
    TResult Function(Locale locale)? updateLocale,
    TResult Function()? toggleTeheme,
    required TResult orElse(),
  }) {
    if (toggleTeheme != null) {
      return toggleTeheme();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateThemeSettingsEvent value) updateTheme,
    required TResult Function(_UpdateLocaleSettingsEvent value) updateLocale,
    required TResult Function(_ToggleThemeSettingsEvent value) toggleTeheme,
  }) {
    return toggleTeheme(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateThemeSettingsEvent value)? updateTheme,
    TResult? Function(_UpdateLocaleSettingsEvent value)? updateLocale,
    TResult? Function(_ToggleThemeSettingsEvent value)? toggleTeheme,
  }) {
    return toggleTeheme?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateThemeSettingsEvent value)? updateTheme,
    TResult Function(_UpdateLocaleSettingsEvent value)? updateLocale,
    TResult Function(_ToggleThemeSettingsEvent value)? toggleTeheme,
    required TResult orElse(),
  }) {
    if (toggleTeheme != null) {
      return toggleTeheme(this);
    }
    return orElse();
  }
}

abstract class _ToggleThemeSettingsEvent extends SettingsEvent {
  const factory _ToggleThemeSettingsEvent() = _$_ToggleThemeSettingsEvent;
  const _ToggleThemeSettingsEvent._() : super._();
}
