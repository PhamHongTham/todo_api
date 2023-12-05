/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/bgdesign.png
  AssetGenImage get bgdesign =>
      const AssetGenImage('assets/images/bgdesign.png');

  /// File path: assets/images/br_onboarding1.png
  AssetGenImage get brOnboarding1 =>
      const AssetGenImage('assets/images/br_onboarding1.png');

  /// File path: assets/images/br_onboarding2.png
  AssetGenImage get brOnboarding2 =>
      const AssetGenImage('assets/images/br_onboarding2.png');

  /// File path: assets/images/br_onboarding3.png
  AssetGenImage get brOnboarding3 =>
      const AssetGenImage('assets/images/br_onboarding3.png');

  /// File path: assets/images/facebooklogo.png
  AssetGenImage get facebooklogo =>
      const AssetGenImage('assets/images/facebooklogo.png');

  /// File path: assets/images/googlelogo.png
  AssetGenImage get googlelogo =>
      const AssetGenImage('assets/images/googlelogo.png');

  /// File path: assets/images/googlelogo_svg.svg
  String get googlelogoSvg => 'assets/images/googlelogo_svg.svg';

  /// File path: assets/images/icon_back.png
  AssetGenImage get iconBack =>
      const AssetGenImage('assets/images/icon_back.png');

  /// File path: assets/images/icon_next.png
  AssetGenImage get iconNext =>
      const AssetGenImage('assets/images/icon_next.png');

  /// File path: assets/images/icon_next_svg.svg
  String get iconNextSvg => 'assets/images/icon_next_svg.svg';

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/logo_svg.svg
  String get logoSvg => 'assets/images/logo_svg.svg';

  /// File path: assets/images/onboarding1.png
  AssetGenImage get onboarding1 =>
      const AssetGenImage('assets/images/onboarding1.png');

  /// File path: assets/images/onboarding2.png
  AssetGenImage get onboarding2 =>
      const AssetGenImage('assets/images/onboarding2.png');

  /// File path: assets/images/onboarding3.png
  AssetGenImage get onboarding3 =>
      const AssetGenImage('assets/images/onboarding3.png');

  /// File path: assets/images/planit.png
  AssetGenImage get planit => const AssetGenImage('assets/images/planit.png');

  /// File path: assets/images/planit_svg.svg
  String get planitSvg => 'assets/images/planit_svg.svg';

  /// List of all assets
  List<dynamic> get values => [
        bgdesign,
        brOnboarding1,
        brOnboarding2,
        brOnboarding3,
        facebooklogo,
        googlelogo,
        googlelogoSvg,
        iconBack,
        iconNext,
        iconNextSvg,
        logo,
        logoSvg,
        onboarding1,
        onboarding2,
        onboarding3,
        planit,
        planitSvg
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
