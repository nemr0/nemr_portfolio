import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nemr_portfolio/UI/helper/extensions/context_config.dart';
import 'package:nemr_portfolio/UI/provider/form_sent_provider.dart';
import 'package:nemr_portfolio/UI/widgets/background_widget.dart';
import 'package:nemr_portfolio/UI/widgets/window_widgets/contact_me/contact_form_sent.dart';
import 'package:nemr_portfolio/UI/widgets/window_widgets/contact_me/contact_me_widget.dart';
import 'package:nemr_portfolio/UI/widgets/window_widgets/projects/project_list.dart';
import 'package:nemr_portfolio/UI/widgets/window_widgets/about_me/avatar_widget.dart';
import 'package:nemr_portfolio/UI/widgets/window_widgets/about_me/profile_widget.dart';
import 'package:nemr_portfolio/UI/widgets/window_widgets/title_widget.dart';
import 'package:nemr_portfolio/UI/widgets/window_widgets/window.dart';
import 'package:nemr_portfolio/config/colors.dart';
import 'package:seo/html/seo_widget.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

// final pageCTRProvider=Provider((ref) => PageController(viewportFraction: 0.4));
/// Where everything is rendered
class StartPoint extends HookWidget {
  const StartPoint({Key? key, this.id}) : super(key: key);
  final int? id;

  @override
  Widget build(BuildContext context) {
    const String seoTagOne =
        'Flutter Developer Software Engineer Portfolio Omar Elnemr nemrdev Ui Ux User Interface User Experience State Management BloC Riverpod Provider GetX';

    final projectCTR = useState(CardSwiperController());
    useEffect(
        () => () {
              projectCTR.value.dispose();
            },
        const []);
    final pageIndex = useState<int>(0);
    const space = SizedBox(
      height: 20,
      width: 20,
    );

    final List<Widget> children = [
      if (context.orientation == Orientation.portrait) ...[
        const AvatarWidget(),
        space,
        const ProfileWidget(),
      ],
      if (context.orientation == Orientation.landscape)
        const Row(
          children: [
            Expanded(
              flex: 4,
              child: AvatarWidget(),
            ),
            Spacer(),
            Expanded(
              flex: 5,
              child: ProfileWidget(),
            ),
          ],
        ),

      space,
      const TitleWidget(
        icon: FontAwesomeIcons.flaskVial,
        text: 'Projects',
      ),
      space,
      ProjectList(
        projectCTR: projectCTR.value,
        onPageChanged: (i) => pageIndex.value = i,
        currentIndex: pageIndex.value,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GradientBorderGlassBox(
            onlyTopRadius: false,
            radius: 100,
            inColor: kAltContainerColor,
            child: IconButton(
                onPressed: () {
                  projectCTR.value.undo();
                },
                icon: FaIcon(
                  FontAwesomeIcons.xmark,
                  color: CupertinoColors.white,
                )),
          ),
          space,
          GradientBorderGlassBox(
            onlyTopRadius: false,
            radius: 100,
            inColor: kAltContainerColor,
            child: IconButton(
                onPressed: () {
                  projectCTR.value.swipeRight();
                },
                icon: FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: CupertinoColors.white,
                )),
          ),
        ],
      ),
      space,
      const TitleWidget(
          icon: FontAwesomeIcons.solidEnvelope, text: 'Contact Me'),
      const SizedBox(
        height: 10,
      ),
      Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final formSent = ref.watch(isFormSentProvider);
          return AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              child:
                  formSent ? const ContactFormSent() : const ContactMeWidget());
        },
      ),
      space,
      // SizedBox(
      //   height: context.keyboardHeight,
      // ),
    ];
    // useEffect(() {
    //   return null;
    // }, const []);
    final scrollCTR = useScrollController();

    return Seo.text(
      text: seoTagOne,
      child: BackgroundWidget(
        child: Window(
          scaffoldKey: scaffoldKey,
          padding: EdgeInsets.only(
            top: context.height * .05,
            right: context.width * .05,
            left: context.width * .05,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 7.0, bottom: 7.0),
            child: CupertinoScrollbar(
              thumbVisibility: true,
              controller: scrollCTR,
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: HookBuilder(builder: (context) {
                  useAutomaticKeepAlive(wantKeepAlive: true);
                  return ListView.builder(
                    controller: scrollCTR,
                    padding: const EdgeInsets.all(20),
                    shrinkWrap: true,
                    itemCount: children.length,
                    itemBuilder: (BuildContext context, int index) =>
                        children[index],
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
