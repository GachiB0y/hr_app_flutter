import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/auth_cubit/auth_cubit.dart';
import 'package:hr_app_flutter/router/router.dart';
import 'package:hr_app_flutter/utils/international_phone_formatter.dart';

@RoutePage()
class AuthenticationFormScreen extends StatefulWidget {
  const AuthenticationFormScreen({super.key});

  @override
  AuthenticationFormScreenState createState() =>
      AuthenticationFormScreenState();
}

class AuthenticationFormScreenState extends State<AuthenticationFormScreen> {
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
    final cubitAuth = context.watch<AuthViewCubit>();
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
                    code = await cubitAuth.getCode(
                        phoneNumber: formattedPhoneNumber);

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
                        await cubitAuth.auth(
                            phoneNumber: formattedPhoneNumber,
                            code: _smsCodeController.text);
                        AutoRouter.of(context).push(MainAppRoute());
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
