import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../config/colors.dart';
import '../generated/assets.dart';

/// Config for [LinkButton] Widget
class LinkButtonConfig extends Equatable {
  const LinkButtonConfig({
    required this.name,
    this.icon,
    this.asset,
    this.link,
    required this.color,
    this.toolTipOn = true,
    this.newPage = true,
  });

  LinkButtonConfig copyWith({
    IconData? icon,
    String? link,
    Color? color,
    bool? toolTipOn,
    bool? newPage,
    String? name,
  }) =>
      LinkButtonConfig(
        icon: icon ?? this.icon,
        color: color ?? this.color,
        link: link ?? this.link,
        toolTipOn: toolTipOn ?? this.toolTipOn,
        newPage: newPage ?? this.newPage,
        name: name ?? this.name,
      );
  final IconData? icon;
  final bool newPage;
  final String? asset;
  final String? link;
  final Color color;
  final bool toolTipOn;
  final String name;

  @override
  List<Object?> get props =>
      [icon, newPage, asset, link, color, toolTipOn, name];
}

/// Linkedin Link

/// , Asset

/// & Color
const LinkButtonConfig kLinkedInLinkButtonConfig = LinkButtonConfig(
  icon: FontAwesomeIcons.linkedin,
  link: "https://www.linkedin.com/in/nemrdev/",
  color: Color.fromRGBO(0, 250, 250, .35),
  name: 'LinkedIn',
);
//---------------------------------------------------------------------
/// CV Link

/// , Asset

/// & Color
const LinkButtonConfig kCVLinkButtonConfig = LinkButtonConfig(
  // asset: Assets.linksIconsResume,
  icon: FontAwesomeIcons.file,
  link:
      "https://drive.google.com/file/d/1zj1p6hld6wr7gBEgDJL3eIHhuGedk3Gf/view",
  color: Color.fromRGBO(255, 245, 0, .35),
  name: 'Resume',
);
//---------------------------------------------------------------------

/// Instagram Link

/// , Asset

/// & Color
const LinkButtonConfig kInstagramLinkButtonConfig = LinkButtonConfig(
  // asset: Assets.linksIconsInstagram,
  icon: FontAwesomeIcons.instagram,
  link: 'https://www.instagram.com/nemrdev/',
  color: Color.fromRGBO(174, 1, 255, .35),
  name: 'Instagram',
);
//---------------------------------------------------------------------
/// Dribble Link

/// ,  Asset

/// & Color
const LinkButtonConfig kDribbleLinkButtonConfig = LinkButtonConfig(
  icon: FontAwesomeIcons.squareDribbble,
  // asset: Assets.linksIconsDribbble,
  link: 'https://dribbble.com/omarelnemr',
  color: Color.fromRGBO(207, 17, 120, .35),
  name: 'Dribbble',
);
//---------------------------------------------------------------------
/// GitHub Link

/// , Asset

/// & Color

const LinkButtonConfig kGithubLinkButtonConfig = LinkButtonConfig(
  icon: FontAwesomeIcons.github,
  // asset: Assets.linksIconsGithub,
  link: 'https://github.com/nemr0',
  color: Color.fromRGBO(0, 250, 250, .35),
  name: 'Github',
);
//---------------------------------------------------------------------
/// Tiktok Link

/// , Asset

/// & Color
const LinkButtonConfig kTiktokLinkButtonConfig = LinkButtonConfig(
  icon: FontAwesomeIcons.tiktok,
  // asset: Assets.linksIconsTiktok,
  link: 'https://www.tiktok.com/@nemrdev',
  color: Color.fromRGBO(255, 0, 78, .35),
  name: 'Tiktok',
);
//---------------------------------------------------------------------
//---------------------------------------------------------------------
//---------------------------------------------------------------------
/// Whatsapp Link

/// , Asset/SEO

/// & Color
const LinkButtonConfig kWhatsappLinkButtonConfig = LinkButtonConfig(
  icon: FontAwesomeIcons.whatsapp,
  // asset: Assets.linksIconsWhatsapp,
  link:
      "https://wa.me/201147898061?text=Hey%20Omar,%20%0AI%20need%20your%20help%20ASAP%20with%20this:",
  color: Color.fromRGBO(5, 234, 108, .35), name: 'Whatsapp',
);
//---------------------------------------------------------------------
//---------------------------------------------------------------------
//---------------------------------------------------------------------
/// Rive Link

/// , Asset/SEO

/// & Color
const LinkButtonConfig kRiveLinkButtonConfig = LinkButtonConfig(
  asset: Assets.linksIconsRive,
  link: 'https://rive.app',
  color: Color.fromRGBO(255, 255, 255, .35),
  name: 'Rive',
);
//---------------------------------------------------------------------
/// EmailJS Link

/// , Asset/SEO

/// & Color
const LinkButtonConfig kEmailJSLinkButtonConfig = LinkButtonConfig(
  asset: Assets.linksIconsEmailjs,
  link: 'https://www.emailjs.com',
  color: Color.fromRGBO(239, 166, 97, .35),
  name: 'EmailJS',
);
//---------------------------------------------------------------------
/// Flutter Link

/// , Asset/SEO

/// & Color
const LinkButtonConfig kFlutterLinkButtonConfig = LinkButtonConfig(
  asset: Assets.linksIconsFlutter,
  link: 'https://flutter.dev/',
  color: Color.fromRGBO(115, 194, 243, .35),
  name: 'Flutter',
);

/// Flutter Hooks Link

/// , Asset/SEO

/// & Color
const LinkButtonConfig kFHooksLinkButtonConfig = LinkButtonConfig(
  asset: Assets.linksIconsFlutterHooks,
  link: 'https://pub.dev/packages/flutter_hooks',
  color: Color.fromRGBO(115, 194, 243, .35),
  name: 'Flutter Hooks',
);

/// Flutter Riverpod Link

/// , Asset/SEO

/// & Color
const LinkButtonConfig kFRiverpodLinkButtonConfig = LinkButtonConfig(
  asset: Assets.linksIconsFlutterRiverpod,
  link: 'https://riverpod.dev/',
  color: Color.fromRGBO(115, 194, 243, .35),
  name: 'Riverpod',
);

///  Heart Link

/// , Asset/SEO

/// & Color
const LinkButtonConfig kHeartLinkButtonConfig = LinkButtonConfig(
  asset: Assets.linksIconsLOVE,
  toolTipOn: false,
  color: Color.fromRGBO(236, 91, 49, .35),
  name: '',
);

///  Vercel Link

/// , Asset/SEO

/// & Color
const LinkButtonConfig kVercelLinkButtonConfig = LinkButtonConfig(
  asset: Assets.linksIconsVercel,
  link: 'https://vercel.com/nemr0',
  color: Color.fromRGBO(255, 255, 255, .35),
  name: 'Vercel',
);
const LinkButtonConfig kAppstoreLinkButtonConfig = LinkButtonConfig(
  name: 'Check it on Appstore',
  color: kContainerColor,
  link: 'https://apps.apple.com/us/app/hala-jary/id6445865046',
  icon: FontAwesomeIcons.appStoreIos,
);
const LinkButtonConfig kPlayStoreLinkButtonConfig = LinkButtonConfig(
  name: 'Check it on PlayStore',
  color: kContainerColor,
  icon: FontAwesomeIcons.googlePlay,
);

const List<LinkButtonConfig> contactConfigs = [
  kGithubLinkButtonConfig,
  kLinkedInLinkButtonConfig,
  kTiktokLinkButtonConfig,
  kInstagramLinkButtonConfig,
  kCVLinkButtonConfig,
  kDribbleLinkButtonConfig,
];
