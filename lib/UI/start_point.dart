import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nemr_portfolio/UI/helper/extensions/context_config.dart';
import 'package:nemr_portfolio/UI/widgets/background_widget.dart';
import 'package:nemr_portfolio/UI/widgets/horizontal_padding.dart';
import 'package:nemr_portfolio/UI/widgets/window_widgets/about_me/avatar_widget.dart';
import 'package:nemr_portfolio/UI/widgets/window_widgets/about_me/profile_widget.dart';
import 'package:nemr_portfolio/UI/widgets/window_widgets/contact_me/contact_form_sent.dart';
import 'package:nemr_portfolio/UI/widgets/window_widgets/contact_me/contact_me_widget.dart';
import 'package:nemr_portfolio/UI/widgets/window_widgets/projects/project_list.dart';
import 'package:nemr_portfolio/UI/widgets/window_widgets/title_widget.dart';
import 'package:nemr_portfolio/UI/widgets/window_widgets/window.dart';
import 'package:nemr_portfolio/config/consts.dart';
import 'package:seo/html/seo_widget.dart';


// final pageCTRProvider=Provider((ref) => PageController(viewportFraction: 0.4));
/// Where everything is rendered
class StartPoint extends HookWidget {
  const StartPoint({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double length = context.height * .3;

    const String seoTagOne =
        'Flutter Developer Software Engineer Portfolio Omar Elnemr nemrdev Ui Ux User Interface User Experience State Management BloC Riverpod Provider GetX';
    final int initialPage = GetStorage().read(UsedStrings.projectIndexKey) ?? 0;
    final projectCTR = usePageController(
        viewportFraction:
            (!context.portrait) ? 0.2 : 0.5,
        initialPage: initialPage,
        keys: [context.orientation]);
    // final offset = useState<double>(0);
    final formSent =
        useState(GetStorage().read(UsedStrings.formSentKey) ?? false);
    final page = useState<int>(initialPage);
    // final int projectIndex = GetStorage().read('project-index') ?? 0;
    useEffect(() {
      GetStorage().listenKey(
          UsedStrings.formSentKey, (value) => formSent.value = value);

      projectCTR.addListener(() {

        page.value = projectCTR.page?.round() ?? 0;
        GetStorage()
            .write(UsedStrings.projectIndexKey, projectCTR.page?.toInt());
      });
      return null;
    });

    const Duration duration = Duration(milliseconds: 200);
    const Curve curve = Curves.easeInBack;
    final pageAnimating = useState(false);
    scroll({required bool next}) async {
      if (pageAnimating.value) return;
      pageAnimating.value = true;
      if (next)
        await projectCTR.nextPage(duration: duration, curve: curve);
      else
        await projectCTR.previousPage(duration: duration, curve: curve);
      pageAnimating.value = false;
    }

    const space = SizedBox(
      height: 20,
      width: 20,
    );

    final List<Widget> children = [
      if (context.portrait) ...[
        const HorizontalPadding(child: AvatarWidget()),
        space,
        const HorizontalPadding(child: ProfileWidget()),
      ],
      if (!context.portrait)
        const HorizontalPadding(
          child: Row(
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
        ),

      space,
      const TitleWidget(
        icon: FontAwesomeIcons.flaskVial,
        text: 'Projects',
      ),
      space,
      ProjectList(
        // currentIndex: projectCTR.page!.toInt(),
        projectCTR: projectCTR,
        length: length, currentPage: page.value,
      ),
      space,
      HorizontalPadding(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GradientBorderGlassBox(
              onlyTopRadius: false,
              radius: 100,
              // inColor: kAltContainerColor,
              child: IconButton(
                  onPressed: () => scroll(next: false),
                  icon: FaIcon(
                    FontAwesomeIcons.chevronLeft,
                    color: CupertinoColors.white,
                  )),
            ),
            space,
            space,
            GradientBorderGlassBox(
              onlyTopRadius: false,
              radius: 100,
              // inColor: kAltContainerColor,
              child: IconButton(
                  onPressed: () => scroll(next: true),
                  icon: FaIcon(
                    FontAwesomeIcons.chevronRight,
                    color: CupertinoColors.white,
                  )),
            ),
          ],
        ),
      ),
      space,
      const TitleWidget(
          icon: FontAwesomeIcons.solidEnvelope, text: 'Contact Me'),
      const SizedBox(
        height: 10,
      ),
      HorizontalPadding(
        child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            child: formSent.value
                ? const ContactFormSent()
                : const ContactMeWidget()),
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
        key: ValueKey('Background'),
        child: Window(
          padding: EdgeInsets.only(
            top: context.portrait?context.height * .04:context.height * .07,
            right: context.portrait?context.height * .02:context.height * .05,
            left: context.portrait?context.height * .02:context.height * .05,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 7.0, bottom: 7.0),
            child: CupertinoScrollbar(
              thumbVisibility: true,
              controller: scrollCTR,
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: ListView.builder(
                  controller: scrollCTR,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  shrinkWrap: true,
                  itemCount: children.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) => children[index],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
