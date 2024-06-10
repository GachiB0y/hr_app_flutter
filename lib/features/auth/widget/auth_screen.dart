import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/features/auth/bloc/auth_bloc/auth_bloc.dart';
import 'package:hr_app_flutter/features/auth/widget/auth_scope.dart';

import 'package:hr_app_flutter/core/utils/international_phone_formatter.dart';
import 'package:hr_app_flutter/features/initialiazation/widget/dependencies_scope.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AuthenticationFormScreen extends StatelessWidget {
  const AuthenticationFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Center(child: MyCustomForm())),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isCodeSent = false;
  bool _isTimerExpired = false;
  late int _counter;
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _smsCodeController = TextEditingController();
  String formattedPhoneNumber = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _smsCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                Image.asset('assets/images/logo_grass_up.png'),
                const SizedBox(
                  height: 70,
                ),
                !_isCodeSent
                    ? WriteNumberPhoneFormWidget(
                        formKey: _formKey,
                        phoneNumberController: _phoneNumberController,
                      )
                    : WriteSMSCodeFormWidget(
                        phoneNumberController: _phoneNumberController,
                        formattedPhoneNumber: formattedPhoneNumber,
                        smsCodeController: _smsCodeController,
                      ),
              ],
            ),
          ),
        ),
        !_isCodeSent
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState == null) return;
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      setState(() {
                        _isCodeSent = true;
                        _startTimer();
                      });
                      final String originalPhoneNumber =
                          '7${_phoneNumberController.text}';
                      formattedPhoneNumber =
                          originalPhoneNumber.replaceAll(RegExp(r'[^\d]'), '');
                      AuthScope.of(context, listen: false)
                          .getCode(formattedPhoneNumber);
                    }
                  },
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        return const Color.fromARGB(46, 94, 222, 102);
                      },
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all(
                      const Size(double.infinity, 57),
                    ),
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Theme.of(context).colorScheme.primary),
                  ),
                  child: Text(
                    'Получить код',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w500, color: Colors.white),
                  ),
                ),
              )
            : _isTimerExpired
                ? TextButton(
                    onPressed: () {
                      AuthScope.of(context, listen: false)
                          .getCode(formattedPhoneNumber);
                      setState(() {
                        _isTimerExpired = false;
                        _startTimer();
                      });
                    },
                    child: Text(
                      'Отправить код повторно',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          decoration: TextDecoration.underline,
                          fontSize: 17,
                          color: const Color(0xFF838383)),
                    ),
                  )
                : Text(
                    'Отправить код повторно ($_counter)',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 17, color: const Color(0xFF838383)),
                  ),
        const SizedBox(height: 20),
      ],
    );
  }

  void _startTimer() {
    _counter = 120;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          timer.cancel();
          _isTimerExpired = true;
        }
      });
    });
  }
}

class WriteSMSCodeFormWidget extends StatefulWidget {
  const WriteSMSCodeFormWidget({
    super.key,
    required TextEditingController phoneNumberController,
    required this.formattedPhoneNumber,
    required TextEditingController smsCodeController,
  })  : _phoneNumberController = phoneNumberController,
        _smsCodeController = smsCodeController;

  final TextEditingController _phoneNumberController;
  final String formattedPhoneNumber;
  final TextEditingController _smsCodeController;

  @override
  State<WriteSMSCodeFormWidget> createState() => _WriteSMSCodeFormWidgetState();
}

class _WriteSMSCodeFormWidgetState extends State<WriteSMSCodeFormWidget> {
  bool isShowError = false;
  bool isShowProgress = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBLoC, AuthState>(
        listener: (BuildContext context, state) {
          if (state is AuthState$Error) {
            setState(() {
              isShowError = true;
              isShowProgress = false;
            });
          } else if (state is AuthState$Processing) {
            setState(() {
              isShowError = false;
              isShowProgress = true;
            });
          }
        },
        bloc: DependenciesScope.of(context).authBloc,
        builder: (context, state) {
          return Column(
            children: [
              Text(
                "Введите код из SMS",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 24),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                textAlign: TextAlign.center,
                "Код придет в течение минуты\n на номер +7 ${widget._phoneNumberController.text}",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: PinCodeTextField(
                  readOnly: state is AuthState$Processing ? true : false,
                  onCompleted: (value) {
                    AuthScope.of(context, listen: false).auth(
                        phoneNumber: widget.formattedPhoneNumber,
                        code: widget._smsCodeController.text);
                  },
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  controller: widget._smsCodeController,
                  appContext: context,
                  length: 4,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                    activeColor: Colors.white,
                    selectedColor: const Color.fromARGB(179, 0, 0, 0),
                    inactiveColor: const Color.fromARGB(60, 0, 0, 0),
                  ),
                ),
              ),
              isShowError
                  ? Text(
                      'Неверный код',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.red),
                    )
                  : const SizedBox.shrink(),
              isShowProgress
                  ? const CircularProgressIndicator()
                  : const SizedBox.shrink(),
            ],
          );
        });
  }
}

class WriteNumberPhoneFormWidget extends StatelessWidget {
  const WriteNumberPhoneFormWidget({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController phoneNumberController,
  })  : _formKey = formKey,
        _phoneNumberController = phoneNumberController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _phoneNumberController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            "Номер телефона",
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 24),
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: TextFormField(
                textAlign: TextAlign.center,
                autofocus: true,
                controller: _phoneNumberController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  CustomTextInputFormatter(),
                ],
                style: Theme.of(context).textTheme.titleLarge,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixText: '+7',
                  prefixStyle: Theme.of(context).textTheme.titleLarge,
                  hintText: '900 000-00-00',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Пожалуйста, введите номер телефона';
                  } else if (value?.length != 13) {
                    return 'Неверный формат номера телефона';
                  }
                  return null;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}







// class AuthenticationFormScreen extends StatefulWidget {
//   const AuthenticationFormScreen({super.key, this.onLoginResult});
//   final void Function(bool isLoggedIn)? onLoginResult;

//   @override
//   AuthenticationFormScreenState createState() =>
//       AuthenticationFormScreenState();
// }

// class AuthenticationFormScreenState extends State<AuthenticationFormScreen> {
//   final TextEditingController _phoneNumberController = TextEditingController();
//   final TextEditingController _smsCodeController = TextEditingController();
//   bool _showSMSCodeField = false;
//   String formattedPhoneNumber = '';

//   String? error;

//   void Function(bool)? get onLoginResult => widget.onLoginResult;

//   @override
//   void dispose() {
//     _phoneNumberController.dispose();
//     _smsCodeController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final cubitAuth = context.watch<AuthViewCubit>();
//     return Scaffold(
//       backgroundColor: Colors.green,
//       body: Center(
//         child: Container(
//           margin: const EdgeInsets.all(20.0),
//           padding: const EdgeInsets.all(20.0),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(5.0),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               const Text(
//                 'Phone Number Authentication',
//                 style: TextStyle(
//                   fontSize: 24.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 20.0),
//               error == null
//                   ? const SizedBox.shrink()
//                   : Text(
//                       error!,
//                       style: const TextStyle(color: Colors.red),
//                     ),
//               TextField(
//                 controller: _phoneNumberController,
//                 keyboardType: TextInputType.phone,
//                 inputFormatters: [
//                   InternationalPhoneFormatter(),
//                 ],
//                 decoration: const InputDecoration(
//                   hintText: '+7 (___) ___-__-__',
//                 ),
//               ),
//               const SizedBox(height: 20.0),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_phoneNumberController.text.length == 18) {
//                     final String originalPhoneNumber =
//                         _phoneNumberController.text;
//                     formattedPhoneNumber =
//                         originalPhoneNumber.replaceAll(RegExp(r'[^\d]'), '');

//                     AuthScope.of(context, listen: false)
//                         .getCode(formattedPhoneNumber);
//                     setState(() {
//                       _showSMSCodeField = true;
//                     });
//                   } else {
//                     setState(() {
//                       error = 'Неправильный номер телефона!';
//                     });
//                   }
//                 },
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.white,
//                   backgroundColor: Colors.green,
//                 ),
//                 child: const Text('Get Code'),
//               ),
//               const SizedBox(height: 20.0),
//               if (_showSMSCodeField)
//                 Column(
//                   children: [
//                     TextFormField(
//                       controller: _smsCodeController,
//                       inputFormatters: [
//                         FilteringTextInputFormatter.digitsOnly,
//                         LengthLimitingTextInputFormatter(4),
//                       ],
//                       keyboardType: TextInputType.number,
//                       decoration: const InputDecoration(
//                         labelText: 'SMS Code',
//                       ),
//                     ),
//                     const SizedBox(height: 20.0),
//                     ElevatedButton(
//                       onPressed: () {
//                         final phone = _phoneNumberController.text;
//                         final code = _smsCodeController.text;
//                         final enabled = phone.isNotEmpty && code.isNotEmpty;

//                         if (enabled) {
//                           AuthScope.of(context, listen: false).auth(
//                               phoneNumber: formattedPhoneNumber,
//                               code: _smsCodeController.text);
                          // onLoginResult?.call(true);
//                         }
//                       },
//                       style: ElevatedButton.styleFrom(
//                         foregroundColor: Colors.white,
//                         backgroundColor: Colors.green,
//                       ),
//                       child: const Text('Confirm'),
//                     ),
//                   ],
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
