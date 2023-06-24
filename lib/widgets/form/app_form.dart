import 'package:flutter/material.dart';

import '../../constants/widgets.dart';

class AppForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final bool disallowIndicator;
  final EdgeInsetsGeometry padding;
  final List<Widget> children;

  const AppForm({
    Key? key,
    required this.formKey,
    required this.disallowIndicator,
    this.padding = Widgets.marginAll,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fields = ListView(
      padding: padding,
      children: children,
    );

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(),
      child: Form(
        key: formKey,
        child: disallowIndicator
            ? NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowIndicator();
                  return true;
                },
                child: fields,
              )
            : fields,
      ),
    );
  }
}
