import 'package:flutter/cupertino.dart';

import '../widgets/dialogs/error_dialog.dart';

showErrorDialog(BuildContext context, String error) {
  if (context.mounted) {
    showCupertinoDialog(
        context: context,
        builder: (context) => errorDialog(error),
        barrierDismissible: true);
  }
}
