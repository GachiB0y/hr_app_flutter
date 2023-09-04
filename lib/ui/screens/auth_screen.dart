import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/auth_cubit/auth_cubit.dart';

class AuthenticationForm extends StatefulWidget {
  const AuthenticationForm({super.key});

  @override
  AuthenticationFormState createState() => AuthenticationFormState();
}

class AuthenticationFormState extends State<AuthenticationForm> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _smsCodeController = TextEditingController();
  bool _showSMSCodeField = false;
  String formattedPhoneNumber = '';
  String? code = null;

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _smsCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AuthViewCubit>();
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
                onPressed: () async {
                  if (_phoneNumberController.text.length == 17) {
                    /// ЗАГЛУШКА В ДАЛЬНЕЙШЕМ КОД ПРИЙДЕТ НА СМС
                    final String originalPhoneNumber =
                        _phoneNumberController.text;
                    formattedPhoneNumber =
                        originalPhoneNumber.replaceAll(RegExp(r'[^\d]'), '');
                    code =
                        await cubit.getCode(phoneNumber: formattedPhoneNumber);

                    /// ЗАГЛУШКА В ДАЛЬНЕЙШЕМ КОД ПРИЙДЕТ НА СМС
                    if (code != null) {
                      setState(() {
                        _smsCodeController.text = code as String;
                        _showSMSCodeField = true;
                      });
                    }
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
                      onPressed: () async {
                        await cubit.auth(
                            phoneNumber: formattedPhoneNumber,
                            code: _smsCodeController.text);
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

class InternationalPhoneFormatter extends TextInputFormatter {
  String internationalPhoneFormat(value) {
    String nums = value.replaceAll(RegExp(r'[\D]'), '');
    String internationalPhoneFormatted = nums.isNotEmpty
        ? '+${nums.substring(0, nums.isNotEmpty ? 1 : null)}${nums.length > 1 ? ' (' : ''}${nums.substring(1, nums.length >= 4 ? 4 : null)}${nums.length > 4 ? ') ' : ''}${nums.length > 4 ? nums.substring(4, nums.length >= 7 ? 7 : null) + (nums.length > 7 ? '-${nums.substring(7, nums.length >= 11 ? 11 : null)}' : '') : ''}'
        : nums;
    return internationalPhoneFormatted;
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    return newValue.copyWith(
        text: internationalPhoneFormat(text),
        selection: TextSelection.collapsed(
            offset: internationalPhoneFormat(text).length));
  }
}
