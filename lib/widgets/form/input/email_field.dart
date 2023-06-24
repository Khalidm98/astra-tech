import 'package:flutter/material.dart';

import '../../../constants/styles.dart';
import '../../../constants/validators.dart';

class EmailField extends StatelessWidget {
  final FormFieldSetter<String>? onSaved;
  final TextInputAction? textInputAction;

  const EmailField({
    Key? key,
    this.onSaved,
    this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: Styles.fieldDecoration(
        label: 'Email address',
        suffixIcon: const Icon(Icons.email),
      ),
      keyboardType: TextInputType.emailAddress,
      onSaved: onSaved,
      textInputAction: textInputAction,
      validator: Validators.email,
    );
  }
}
