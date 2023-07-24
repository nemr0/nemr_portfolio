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

  const ProjectConfig({
    this.icons,
    required this.id,
    required this.url,
    required this.name,
    required this.desc,
  });

  @override
  List<Object?> get props => [
        url,
        name,
        desc,
        id,
        icons,
      ];
}

List<ProjectConfig> configs = [
  const ProjectConfig(
    id: Routes.projectHalaJary,
    url: 'https://i.ibb.co/3sMtsSL/halajary.png',
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
    id: Routes.projectLocalizationTextGenerator,
    url: 'https://i.ibb.co/7GcjJMn/glocalization.png',
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
    id: Routes.projectDartDonut,
    url: 'https://i.ibb.co/Z84Sdj4/dart-donut.gif',
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
    id: Routes.projectImIn,
    url: 'https://i.ibb.co/9pLDXYq/imin.png',
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
  const ProjectConfig(id: 'id', url: 'url', name: 'name', desc: 'desc'),
];
