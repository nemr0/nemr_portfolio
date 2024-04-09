import 'package:flutter/cupertino.dart' show CupertinoActivityIndicator ;
import 'package:flutter/widgets.dart';
class DeferredWidget extends StatefulWidget {
  const DeferredWidget({ required ValueKey key, required this.loadLibrary, required this.builder}) : super(key: key);

  final Future<void> Function() loadLibrary;
  final Widget Function() builder;
  @override
  State<DeferredWidget> createState() => _DeferredWidgetState();
}

class _DeferredWidgetState extends State<DeferredWidget> {
  Future<void>? _future;

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  @override
  void didUpdateWidget(covariant DeferredWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    // refresh cached data
    if ((oldWidget.key as ValueKey).value != (widget.key as ValueKey).value ) _fetch();
  }

  void _fetch() => _future = widget.loadLibrary();

  @override
  Widget build(BuildContext context) => FutureBuilder<void>(
    future: _future,
    builder: (context, snapshot) {

      if (snapshot.connectionState == ConnectionState.done) {
        return widget.builder();
      }

        return CupertinoActivityIndicator();






    },
  );
}
// class DeferredWidget extends StatelessWidget {
//   final Future<void> Function() loadLibrary;
//   final Widget Function() builder;
//
//   const DeferredWidget({
//     Key? key,
//     required this.loadLibrary,
//     required this.builder,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: loadLibrary(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           return builder();
//         }
//         return SizedBox();
//       },
//     );
//   }
// }