import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nemr_portfolio/UI/helper/extensions/context_config.dart';
import 'package:nemr_portfolio/UI/widgets/background_widget.dart';
import 'package:nemr_portfolio/UI/widgets/window_widgets/projects/project_list.dart';
import 'package:nemr_portfolio/UI/widgets/window_widgets/about_me/avatar_widget.dart';
import 'package:nemr_portfolio/UI/widgets/window_widgets/about_me/profile_widget.dart';
import 'package:nemr_portfolio/UI/widgets/window_widgets/title_widget.dart';
import 'package:nemr_portfolio/UI/widgets/window_widgets/window.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:seo/html/seo_widget.dart';

/// Where everything is rendered
class StartPoint extends HookWidget {
  const StartPoint({Key? key, this.id}) : super(key: key);
  final int? id;

  @override
  Widget build(BuildContext context) {
    const String seoTagOne =
        'Flutter Developer Software Engineer Portfolio Omar Elnemr nemrdev Ui Ux User Interface User Experience State Management BloC Riverpod Provider GetX';

    final itemScrollController = useState(ItemScrollController());
    final projectCTR = usePageController(viewportFraction: 0.4);
    final pageIndex = useState(0);
    const space = SizedBox(
      height: 20,
    );
    final List<Widget> children = [
      if (context.orientation == Orientation.portrait) ...[
        const AvatarWidget(),
        space,
        const ProfileWidget(),
      ],
      if (context.orientation == Orientation.landscape) ...[
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 4,
              child: AvatarWidget(),
            ),
            Expanded(
              flex: 5,
              child: ProfileWidget(),
            ),
          ],
        ),
      ],
      space,
      const TitleWidget(
        icon: FontAwesomeIcons.flaskVial,
        text: 'Projects',
      ),
      space,
      ProjectList(
        projectCTR: projectCTR,
        onPageChanged: (i) => pageIndex.value = i,
        currentIndex: pageIndex.value,
      ),
    ];
    useEffect(() {
      if (id == null) {
        return null;
      } else {
        if (id! < children.length) {
          itemScrollController.value.jumpTo(index: id!);
        }

        return null;
      }
    });

    return SelectionArea(
      child: Seo.text(
        text: seoTagOne,
        child: BackgroundWidget(
          child: Window(
            padding: EdgeInsets.only(
              top: context.height * .05,
              right: context.width * .05,
              left: context.width * .05,
            ),
            aboutEnabled: true,
            child: ScrollConfiguration(
              behavior: const CupertinoScrollBehavior(),
              child: ScrollablePositionedList.builder(
                padding: const EdgeInsets.all(20),
                shrinkWrap: true,
                itemCount: children.length,
                itemBuilder: (BuildContext context, int index) =>
                    children[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
