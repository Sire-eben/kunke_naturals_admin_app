import 'package:kunke_naturals_admin_app/config/theme.dart';
// import "package:cached_network_image/cached_network_image.dart";
import 'package:flutter/material.dart';
import "package:flutter_svg/flutter_svg.dart";

//
// class HostedImage extends StatelessWidget {
//   const HostedImage(
//     this.url, {
//     Key? key,
//     this.height,
//     this.width,
//     this.fallback,
//     this.fit = BoxFit.cover,
//   }) : super(key: key);
//   final String url;
//   final double? height, width;
//   final BoxFit fit;
//
//   /// image widget to be displayed when the remote image failed to load
//   final Widget? fallback;
//
//   @override
//   Widget build(BuildContext context) {
//     String secureUrl = url;
//     if (url.contains("http://")) {
//       secureUrl = secureUrl.replaceAll("http://", "https://");
//     }
//     return CachedNetworkImage(
//       imageUrl: secureUrl,
//       fit: fit,
//       height: height,
//       width: width,
//       progressIndicatorBuilder: (_, s, i) =>
//           CupertinoActivityIndicator.partiallyRevealed(
//         progress: i.progress ?? 1,
//       ),
//       // errorWidget: (_, s, ___) =>
//       //     fallback or app logo,
//       fadeInDuration: 1.seconds,
//     );
//   }
// }

class LocalImage extends StatelessWidget {
  const LocalImage(
    this.image, {
    Key? key,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
  }) : super(key: key);
  final String image;
  final double? height, width;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      fit: fit,
      height: height,
      width: width,
    );
  }
}

class LocalSvgImage extends StatelessWidget {
  const LocalSvgImage(
    this.image, {
    Key? key,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
  }) : super(key: key);
  final String image;
  final double? height, width;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      image,
      fit: fit,
      height: height,
      width: width,
    );
  }
}

class LocalSvgIcon extends StatelessWidget {
  const LocalSvgIcon(
    this.icon, {
    this.fit = BoxFit.contain,
    this.size,
    this.color,
    Key? key,
  }) : super(key: key);
  final String icon;
  final BoxFit fit;
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size ?? IconSizes.sm,
      width: size ?? IconSizes.sm,
      child: Center(
        child: SvgPicture.asset(
          icon,
          height: size ?? IconSizes.sm,
          width: size ?? IconSizes.sm,
          fit: fit,
          color: color ?? Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
