import 'package:flutter/cupertino.dart';

class HorizontalPadding extends StatelessWidget {
  const HorizontalPadding({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: child,
    );
  }
}
