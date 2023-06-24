import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/palette.dart';
import '../../constants/widgets.dart';
import '../../models/auth_credentials.dart';
import '../../network/api_auth.dart';
import '../../widgets/form/app_form.dart';
import '../../widgets/form/input/email_field.dart';
import '../../widgets/form/input/password_field.dart';

class Register extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _credentials = AuthCredentials();

  Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AppForm(
          formKey: _formKey,
          disallowIndicator: true,
          padding: Widgets.marginHorizontal,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Text(
                'Register',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            EmailField(
              textInputAction: TextInputAction.next,
              onSaved: (value) => _credentials.email = value,
            ),
            Widgets.spacingVertical,
            PasswordField(onSaved: (value) => _credentials.password = value),
            Widgets.spacingVertical,
            ElevatedButton(onPressed: _register, child: const Text('Register')),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account? '),
                  GestureDetector(
                    onTap: () => Get.offNamed('/login'),
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Palette.blue),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _register() {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    AuthAPI.register(credentials: _credentials);
  }
}
