import 'package:flutter/cupertino.dart';
import 'package:nemr_portfolio/UI/widgets/background_widget.dart';
import 'package:nemr_portfolio/UI/widgets/windows/about_me_window/about_me_window.dart';
import 'package:nemr_portfolio/UI/widgets/windows/details_window/details_window.dart';

/// Where everything is rendered
class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          /// Landscape
          if (orientation == Orientation.landscape) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Flexible(
                    flex: 8,
                    child: AboutMeWindow(),
                  ),
                  Spacer(),
                  Flexible(flex: 12, child: DetailsWindow()),
                ],
              ),
            );
          } else {
            /// Portrait
            return ListView(
              // mainAxisSize: MainAxisSize.max,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              shrinkWrap: true,

              children: const [
                AboutMeWindow(),
                SizedBox(
                  height: 20,
                ),
                DetailsWindow(),
              ],
            );
          }
        },
      ),
    );
  }
}
