import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// a hook that uses flutter's precache image to preserve image for faster loading.
Image usePrecacheImage(Image image) => use(_PrecacheImageHook(image));

class _PrecacheImageHook extends Hook<Image> {
  final Image image;

  const _PrecacheImageHook(this.image);

  @override
  HookState<Image, Hook<Image>> createState() => _PrecacheImageHookState();
}

class _PrecacheImageHookState extends HookState<Image, _PrecacheImageHook> {
  late final Image image = hook.image;

  @override
  Image build(BuildContext context) => image;

  @override
  void didUpdateHook(_PrecacheImageHook oldHook) {
    if (hook != oldHook) precacheImage(image.image, context);
    super.didUpdateHook(oldHook);
  }
}
