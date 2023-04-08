import 'dart:ui';
import 'package:flutter/cupertino.dart';

/// Linkedin Link

/// , Asset

/// & Color
const LinkButtonConfig kLinkedInLinkButtonConfig = LinkButtonConfig(
    asset: 'linkedin',
    link: "https://www.linkedin.com/in/nemrdev/",
    color: Color.fromRGBO(0, 250, 250, .35));
//---------------------------------------------------------------------
/// CV Link

/// , Asset

/// & Color
const LinkButtonConfig kCVLinkButtonConfig = LinkButtonConfig(
    asset: 'cv',
    link:
        "https://drive.google.com/file/d/1zj1p6hld6wr7gBEgDJL3eIHhuGedk3Gf/view",
    color: Color.fromRGBO(255, 245, 0, .35));
//---------------------------------------------------------------------

/// Instagram Link

/// , Asset

/// & Color
const LinkButtonConfig kInstagramLinkButtonConfig = LinkButtonConfig(
    asset: "instagram",
    link: 'https://www.instagram.com/nemrdev/',
    color: Color.fromRGBO(174, 1, 255, .35));
//---------------------------------------------------------------------
/// Dribble Link

/// ,  Asset

/// & Color
const LinkButtonConfig kDribbleLinkButtonConfig = LinkButtonConfig(
    asset: 'dribbble',
    link: 'https://dribbble.com/omarelnemr',
    color: Color.fromRGBO(207, 17, 120, .35));
//---------------------------------------------------------------------
/// GitHub Link

/// , Asset

/// & Color

const LinkButtonConfig kGithubLinkButtonConfig = LinkButtonConfig(
    asset: 'github',
    link: 'https://github.com/nemr0',
    color: Color.fromRGBO(0, 250, 250, .35));
//---------------------------------------------------------------------
/// Tiktok Link

/// , Asset

/// & Color
const LinkButtonConfig kTiktokLinkButtonConfig = LinkButtonConfig(
    asset: 'tiktok',
    link: 'https://www.tiktok.com/@nemrdev',
    color: Color.fromRGBO(255, 0, 78, .35));
//---------------------------------------------------------------------
//---------------------------------------------------------------------
//---------------------------------------------------------------------
/// Whatsapp Link

/// , Asset/SEO

/// & Color
const LinkButtonConfig kWhatsappLinkButtonConfig = LinkButtonConfig(
    asset: 'whatsapp',
    link:
        "https://wa.me/201147898061?text=Hey%20Omar,%20%0AI%20need%20your%20help%20ASAP%20with%20this:",
    color: Color.fromRGBO(5, 234, 108, .35));
//---------------------------------------------------------------------
//---------------------------------------------------------------------
//---------------------------------------------------------------------
/// Rive Link

/// , Asset/SEO

/// & Color
const LinkButtonConfig kRiveLinkButtonConfig = LinkButtonConfig(
    asset: 'rive',
    link: 'https://rive.app',
    color: Color.fromRGBO(255, 255, 255, .35));
//---------------------------------------------------------------------
/// EmailJS Link

/// , Asset/SEO

/// & Color
const LinkButtonConfig kEmailJSLinkButtonConfig = LinkButtonConfig(
    asset: 'emailjs',
    link: 'https://www.emailjs.com',
    color: Color.fromRGBO(239, 166, 97, .35));
//---------------------------------------------------------------------
/// Flutter Link

/// , Asset/SEO

/// & Color
const LinkButtonConfig kFlutterLinkButtonConfig = LinkButtonConfig(
    asset: 'flutter',
    link: 'https://flutter.dev/',
    color: Color.fromRGBO(115, 194, 243, .35));

/// Flutter Hooks Link

/// , Asset/SEO

/// & Color
const LinkButtonConfig kFHooksLinkButtonConfig = LinkButtonConfig(
    asset: 'flutter_hooks',
    link: 'https://pub.dev/packages/flutter_hooks',
    color: Color.fromRGBO(115, 194, 243, .35));

/// Flutter Riverpod Link

/// , Asset/SEO

/// & Color
const LinkButtonConfig kFRiverpodLinkButtonConfig = LinkButtonConfig(
    asset: 'flutter_riverpod',
    link: 'https://riverpod.dev/',
    color: Color.fromRGBO(115, 194, 243, .35));

///  Heart Link

/// , Asset/SEO

/// & Color
const LinkButtonConfig kHeartLinkButtonConfig = LinkButtonConfig(
    asset: 'LOVE', toolTipOn: false, color: Color.fromRGBO(236, 91, 49, .35));

///  Vercel Link

/// , Asset/SEO

/// & Color
const LinkButtonConfig kVercelLinkButtonConfig = LinkButtonConfig(
    asset: 'vercel',
    link: 'https://vercel.com/nemr0',
    color: Color.fromRGBO(255, 255, 255, .35));

const List<LinkButtonConfig> configs = [
  kGithubLinkButtonConfig,
  kLinkedInLinkButtonConfig,
  kTiktokLinkButtonConfig,
  kInstagramLinkButtonConfig,
  kCVLinkButtonConfig,
  kDribbleLinkButtonConfig,
];

class LinkButtonConfig {
  const LinkButtonConfig({
    required this.asset,
    this.link,
    required this.color,
    this.toolTipOn = true,
  });

  final String asset;
  final String? link;
  final Color color;
  final bool toolTipOn;
}
