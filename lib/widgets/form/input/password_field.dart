import 'package:flutter/material.dart';

import '../../../constants/styles.dart';
import '../../../constants/validators.dart';

class PasswordField extends StatefulWidget {
  final FormFieldSetter<String?>? onSaved;

  const PasswordField({Key? key, this.onSaved}) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscure,
      keyboardType: TextInputType.visiblePassword,
      onSaved: widget.onSaved,
      decoration: Styles.fieldDecoration(
        label: 'Password',
        suffixIcon: IconButton(
          icon: _obscure
              ? const Icon(Icons.visibility)
              : const Icon(Icons.visibility_off),
          onPressed: () => setState(() => _obscure = !_obscure),
        ),
      ),
      validator: Validators.passExtra,
    );
  }
}
