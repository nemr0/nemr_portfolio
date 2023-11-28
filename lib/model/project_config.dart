import 'package:equatable/equatable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nemr_portfolio/config/colors.dart';
import 'package:nemr_portfolio/model/link_button_config.dart';

import '../UI/router/routes.dart';

class ProjectConfig extends Equatable {
  final String url;
  final String name;
  final String desc;
  final String id;
  final List<LinkButtonConfig>? icons;
  final int index;
  const ProjectConfig({
    this.icons,
    required this.index,
    required this.id,
    required this.url,
    required this.name,
    required this.desc,
  });

  @override
  List<Object?> get props => [
        index,
        url,
        name,
        desc,
        id,
        icons,
      ];
}

List<ProjectConfig> configs = [
   ProjectConfig(
    index: 0,
    id: Routes.projectHindawiBooks,
    url: 'https://nemr0.github.io/nemr_portfolio/uploaded_assets/hindawi_kotob.png',
    name: 'هنداوي كتب',
    desc: '''A Mobile App for Hindawi Foundation to bring books in arabic for free
Contributed by:
- More than 35% Performance boost. 
- Numerous new features including stripe payment, storage check and more.''',
    icons: [
      kAppstoreLinkButtonConfig.copyWith(link: 'https://apps.apple.com/us/app/%D9%87%D9%86%D8%AF%D8%A7%D9%88%D9%8A-%D9%83%D8%AA%D8%A8/id1296718056'),
      kPlayStoreLinkButtonConfig.copyWith(link: 'https://play.google.com/store/apps/details?id=org.hindawi.booksapp&hl=en&gl=US'),
    ],
  ),
  const ProjectConfig(
    index: 1,
    id: Routes.projectHalaJary,
    url: 'https://nemr0.github.io/nemr_portfolio/uploaded_assets/halajary.png',
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
    index: 2,
    id: Routes.projectLocalizationTextGenerator,
    url:
        'https://nemr0.github.io/nemr_portfolio/uploaded_assets/localization_text_generator.png',
    name: Routes.projectLocalizationTextGenerator,
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
    index: 3,
    id: Routes.projectDartDonut,
    url: 'https://nemr0.github.io/nemr_portfolio/uploaded_assets/donut.gif',
    name: Routes.projectDartDonut,
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
    index: 4,
    id: Routes.projectImIn,
    url: 'https://nemr0.github.io/nemr_portfolio/uploaded_assets/imin.png',
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
      index: 5,
      id: Routes.projectUnigate,
      url: 'https://nemr0.github.io/nemr_portfolio/uploaded_assets/unigate.png',
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
      index: 1000, id: 'id', url: 'url', name: 'name', desc: 'desc'),
];
