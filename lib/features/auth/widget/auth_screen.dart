import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hr_app_flutter/features/auth/widget/auth_scope.dart';

import 'package:hr_app_flutter/core/utils/international_phone_formatter.dart';

class AuthenticationFormScreen extends StatefulWidget {
  const AuthenticationFormScreen({super.key, this.onLoginResult});
  final void Function(bool isLoggedIn)? onLoginResult;

  @override
  AuthenticationFormScreenState createState() =>
      AuthenticationFormScreenState();
}

class AuthenticationFormScreenState extends State<AuthenticationFormScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _smsCodeController = TextEditingController();
  bool _showSMSCodeField = false;
  String formattedPhoneNumber = '';

  String? error;

  void Function(bool)? get onLoginResult => widget.onLoginResult;

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _smsCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final cubitAuth = context.watch<AuthViewCubit>();
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Phone Number Authentication',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              error == null
                  ? const SizedBox.shrink()
                  : Text(
                      error!,
                      style: const TextStyle(color: Colors.red),
                    ),
              TextField(
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  InternationalPhoneFormatter(),
                ],
                decoration: const InputDecoration(
                  hintText: '+7 (___) ___-__-__',
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_phoneNumberController.text.length == 18) {
                    final String originalPhoneNumber =
                        _phoneNumberController.text;
                    formattedPhoneNumber =
                        originalPhoneNumber.replaceAll(RegExp(r'[^\d]'), '');

                    AuthScope.of(context, listen: false)
                        .getCode(formattedPhoneNumber);
                    setState(() {
                      _showSMSCodeField = true;
                    });
                  } else {
                    setState(() {
                      error = 'Неправильный номер телефона!';
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                ),
                child: const Text('Get Code'),
              ),
              const SizedBox(height: 20.0),
              if (_showSMSCodeField)
                Column(
                  children: [
                    TextFormField(
                      controller: _smsCodeController,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(4),
                      ],
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'SMS Code',
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        final phone = _phoneNumberController.text;
                        final code = _smsCodeController.text;
                        final enabled = phone.isNotEmpty && code.isNotEmpty;

                        if (enabled) {
                          AuthScope.of(context, listen: false).auth(
                              phoneNumber: formattedPhoneNumber,
                              code: _smsCodeController.text);
                          onLoginResult?.call(true);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green,
                      ),
                      child: const Text('Confirm'),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
