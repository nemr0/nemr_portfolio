import 'package:equatable/equatable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nemr_portfolio/config/colors.dart';
import 'package:nemr_portfolio/model/link_button_config.dart';

import '../UI/router/routes.dart';

class ProjectConfig extends Equatable {
  final String url;
  final String name;
  final String desc;
  final String route;
  final List<LinkButtonConfig>? icons;
  const ProjectConfig({
    this.icons,
    required this.route,
    required this.url,
    required this.name,
    required this.desc,
  });

  @override
  List<Object?> get props => [
        url,
        name,
        desc,
        route,
        icons,
      ];
}

List<ProjectConfig> configs = [

   ProjectConfig(
    route: Routes.projectHindawiReaders,
    url: 'https://nemr0.github.io/nemr_portfolio/uploaded_assets/hindawi_readers.webp',
    name: ' هنداوي قراءات - Hindawi Readers',
    desc: '''- Hindawi Readers is one of "Hindawi Foundation" products which is a non-profit organization aimed at spreading knowledge and culture and instilling a love of reading among Arabic speakers.

- I contributed to Hindawi Books by:
    * Lead development of the whole app by translating requirements and user stories into code.

- Hindawi Reader is a children targeted stories app for various ages till 16 years with over 1000+ Arabic stories.''',
    icons: [
      kAppstoreLinkButtonConfig.copyWith(link: 'https://apps.apple.com/us/app/%D9%87%D9%86%D8%AF%D8%A7%D9%88%D9%8A-%D9%82%D8%B1%D8%A7%D8%A1%D8%A7%D8%AA/id6470289133'),
      kPlayStoreLinkButtonConfig.copyWith(link: 'https://play.google.com/store/apps/details?id=hindawi.readers&hl=en&gl=US'),
    ],
  ), ProjectConfig(
    route: Routes.projectHindawiBooks,
    url: 'https://nemr0.github.io/nemr_portfolio/uploaded_assets/hindawi_kotob.webp',
    name: 'هنداوي كتب - Hindawi Books',
    desc: '''- Hindawi Books is one of "Hindawi Foundation" products which is a non-profit organization aimed at spreading knowledge and culture and instilling a love of reading among Arabic speakers.
    
- I contributed to Hindawi Books by:

    * Boosted performance with over 60%.
    * Added Social Login. (Facebook, Apple and google)
    
- Hindawi Books is one of most valuable resources of Hindawi Foundation that brings thousands of books for free in Arabic all over the middle east.''',
    icons: [
      kAppstoreLinkButtonConfig.copyWith(link: 'https://apps.apple.com/us/app/%D9%87%D9%86%D8%AF%D8%A7%D9%88%D9%8A-%D9%83%D8%AA%D8%A8/id1296718056'),
      kPlayStoreLinkButtonConfig.copyWith(link: 'https://play.google.com/store/apps/details?id=org.hindawi.booksapp&hl=en&gl=US'),
    ],
  ), ProjectConfig(
    route: Routes.projectHindawiPoems,
    url: 'https://nemr0.github.io/nemr_portfolio/uploaded_assets/hindawi_poems.webp',
    name: 'هنداوي قصائد - Hindawi Poems',
    desc: '''- Hindawi poems is one of "Hindawi Foundation" products which is a non-profit organization aimed at spreading knowledge and culture and instilling a love of reading among Arabic speakers.

- I contributed to Hindawi Poems by:
    * Transition of Poems native app (swift for iOS and java for android) into a fully performant flutter app.
    * Added Background playing for poems audios.

- Hindawi Poems is an app with a large library of Arabic poems from different cultures of Arabic poems.''',
    icons: [
      kAppstoreLinkButtonConfig.copyWith(link: 'https://apps.apple.com/us/app/%D9%87%D9%86%D8%AF%D8%A7%D9%88%D9%8A-%D9%82%D8%B5%D8%A7%D8%A6%D8%AF/id1550905064'),
      kPlayStoreLinkButtonConfig.copyWith(link: 'https://play.google.com/store/apps/details?id=com.nagwa.poems&hl=en&gl=US'),
    ],
  ),
  const ProjectConfig(
    route: Routes.projectHalaJary,
    url: 'https://nemr0.github.io/nemr_portfolio/uploaded_assets/halajary.webp',
    name: 'Hala Jary',
    desc: '''A Web-App in Flutter Web-view
Contributed by:
- Fixing Permissions.
- Uploading to AppStore .''',
    icons: [
      kAppstoreLinkButtonConfig,
    ],
  ),
  ProjectConfig(
    route: Routes.projectLocalizationTextGenerator,
    url:
        'https://nemr0.github.io/nemr_portfolio/uploaded_assets/localization_text_generator.webp',
    name: 'Localization Text Generator',
    desc:
        '''A Dart CLI Tool that can help you generate json file for all texts in all screens in a Flutter project to implement localization.
        
  ✅ Single Quotation Text.
  ✅ Double Quotation Text.
  ⚠️ Triple Single Quotation.
  ✅ Triple Double Quotation.
  ✅ Excludes Imports.
  ✅ Excludes Keys.
  ✅ Checks for any file with Cupertino or Material imports.
  ⚠️ Automatically Check for Updates when launching package.''',
    icons: [
      kGithubLinkButtonConfig.copyWith(
        link: 'https://github.com/devmoaid1/localization_text_generator',
        name: 'Check Out The Package Repo on GitHub',
      ),
      kTiktokLinkButtonConfig.copyWith(
        name: 'Check Out Demonstration Video on Tiktok',
        link:
            'https://www.tiktok.com/@nemrdev/video/7244163541962411270?is_from_webapp=1&sender_device=pc&web_id=7238542170314458629',
      ),
    ],
  ),
  ProjectConfig(
    route: Routes.projectDartDonut,
    url: 'https://nemr0.github.io/nemr_portfolio/uploaded_assets/donut.gif',
    name: 'Dart Donut',
    desc:
        'An Implementation of donut.c in dart using zBuffer algorithm this uses the exact same logic implemented by a1kon.',
    icons: [
      kGithubLinkButtonConfig.copyWith(
        link: 'https://github.com/nemr0/dart_donut',
        name: 'Check Out Console App Repo on GitHub.',
      ),
    ],
  ),
  ProjectConfig(
    route: Routes.projectImIn,
    url: 'https://nemr0.github.io/nemr_portfolio/uploaded_assets/imin.webp',
    name: 'I\'m In',
    icons: [
      kDribbleLinkButtonConfig.copyWith(
        link:
            'https://dribbble.com/shots/21474944-I-m-In-Mobile-App?utm_source=Clipboard_Shot&utm_campaign=omarelnemr&utm_content=I%27m%20In%20Mobile%20App&utm_medium=Social_Share&utm_source=Clipboard_Shot&utm_campaign=omarelnemr&utm_content=I%27m%20In%20Mobile%20App&utm_medium=Social_Share',
        name: 'Check Out Design on Dribbble',
      ),
      kAppstoreLinkButtonConfig.copyWith(
        link:
            'https://apps.apple.com/eg/app/im-in-x-solutions-app/id1616877381',
      ),
      kPlayStoreLinkButtonConfig.copyWith(
        link:
            'http://play.google.com/store/apps/details?id=tech.xsolutions.imin',
      ),
    ],
    desc:
        '''- Enabled Finger-Print Scanner Substitution using one-device authentication and geo-location.
- Optimized design with seamless user experience.
- Provided a real-time attendance update using ERP-Next Restful APIs.
- Used Riverpod State Management to separate Business Logic from User Interface.
- Used Firebase in:
    Handle multiple ERP-Next APIs through Cloud-Store.
    Ensure Safety through Firebase App Check.
    Implemented Push Notifications through FCM and flutter local notification.
- Deployed to Appstore and Play store.''',
  ),
  const ProjectConfig(
      route: Routes.projectUnigate,
      url: 'https://nemr0.github.io/nemr_portfolio/uploaded_assets/unigate.webp',
      name: 'Unigate',
      desc: '''
GRADUATION PROJECT: Smart Attendance System using QR code 
  Degree: Excellent.
    - Participated in IUGRC 2021 .
    - Built with Flutter, React, node.js and more technologies.''',
      icons: [
        LinkButtonConfig(
            name: 'Unigate Full Prototype',
            color: kContainerColor,
            icon: FontAwesomeIcons.solidFileVideo,
            link:
                'https://drive.google.com/file/d/19tlqSBVf2wQGRIY1l7Fnk0PwXXEA4XTR/view?usp=sharing/preview'),
        LinkButtonConfig(
            name: 'Mobile App Figma Prototype',
            color: kContainerColor,
            icon: FontAwesomeIcons.figma,
            link:
                'https://www.figma.com/proto/l4Ws7UYweWiWjQuQbhO6gL/Unigate?node-id=554-5&starting-point-node-id=7%3A1373&mode=design&t=TT0RnhgQzSopqaCj-1'),
        LinkButtonConfig(
            name: 'IUGRC 2021 Certificate',
            color: kContainerColor,
            icon: FontAwesomeIcons.stamp,
            link:
                'https://drive.google.com/file/d/1FABAYYE2TmTTLfcWqyb93cnENMetus7f/view?usp=sharing/preview'),
      ]),
  const ProjectConfig(
      route: '1000', url: 'url', name: 'name', desc: 'desc'),
];
