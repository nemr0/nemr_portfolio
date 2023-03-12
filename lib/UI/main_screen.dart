import 'package:flutter/cupertino.dart';
import 'package:nemr_portfolio/UI/widgets/background_widget.dart';
import 'package:nemr_portfolio/UI/widgets/windows/details_window/details_window.dart';

import 'widgets/windows/avatar_window/avatar_window.dart';

/// Where everything is rendered
class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Gets Orientation
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    Widget avatarWidget() => AboutMeWindow(
          height: isLandscape ? height * .54 : height * .42,
          width: isLandscape ? width * .3 : width * .6,
        );
    Widget detailsWidget() => DetailsWindow(
          height: height * .9,
          width: width * .5,
        );
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
                children: [
                  Flexible(
                    flex: 8,
                    child: SizedBox(height: height * .5, child: avatarWidget()),
                  ),
                  const Spacer(),
                  Flexible(flex: 12, child: detailsWidget()),
                ],
              ),
            );
          } else {
            /// Portrait
            return ListView(
              // mainAxisSize: MainAxisSize.max,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              shrinkWrap: true,

              children: [
                avatarWidget(),
                const SizedBox(
                  height: 20,
                ),
                detailsWidget(),
              ],
            );
          }
        },
      ),
    );
  }
}
