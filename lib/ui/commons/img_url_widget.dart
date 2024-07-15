import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// Виджет загружаемой картинки.
class ImgUrlWidget extends StatefulWidget {
  final String url;
  final String placeholder;
  final double? size;
  final double? height;
  final double? width;
  final double? scalePlaceholder;
  final double? borderRadius;
  final BoxFit? boxFit;
  final Color? backgroundColorImage;
  final TextStyle? textStyle;
  final BoxShape? shape;
  final Widget? childPlaceholder;

  const ImgUrlWidget({
    Key? key,
    required this.url,
    required this.placeholder,
    this.size,
    this.scalePlaceholder,
    this.borderRadius,
    this.boxFit,
    this.height,
    this.width,
    this.backgroundColorImage,
    this.textStyle,
    this.shape,
    this.childPlaceholder,
  }) : super(key: key);

  @override
  State<ImgUrlWidget> createState() => _ImgUrlWidgetState();
}

class _ImgUrlWidgetState extends State<ImgUrlWidget> {
  late Text placeholder;
  late TextStyle style;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.textStyle != null) {
      style = widget.textStyle!;
      if (widget.placeholder.isNotEmpty) {
        placeholder = Text(
          widget.placeholder,
          style: style,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.url.isEmpty) return _placeholderWidget();

    return Container(
      height: (widget.height ?? widget.size),
      width: (widget.width ?? widget.size),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          widget.borderRadius ?? 20,
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: CachedNetworkImage(
        fit: widget.boxFit ?? BoxFit.fill,
        imageUrl: widget.url,
        placeholder: (context, url) => _placeholderWidget(),
        errorWidget: (context, url, error) => _placeholderWidget(),
      ),
    );
  }

  Widget _placeholderWidget() {
    return Container(
      height: widget.size,
      width: widget.size,
      decoration: BoxDecoration(
        color: widget.backgroundColorImage,
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 20),
      ),
      child: widget.placeholder.isNotEmpty ? placeholder : widget.childPlaceholder,
    );
  }
}
