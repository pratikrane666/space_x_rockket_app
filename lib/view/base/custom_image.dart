import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:space_x_rockket_app/util/images.dart';

class CustomImage extends StatelessWidget {
  final String? image;
  final double? height;
  final double? width;
  final BoxFit? fit;
  CustomImage({@required this.image, this.height, this.width, this.fit});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image!,
      height: height,
      width: width,
      fit: fit != null ? fit : BoxFit.fitHeight,
      placeholder: (context, url) => Image.asset(Images.placeholder,
          height: height, width: width, fit: fit),
      errorWidget: (context, url, error) => Image.asset(Images.placeholder,
          height: height, width: width, fit: fit),
    );
  }
}
