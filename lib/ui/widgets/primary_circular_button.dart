import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hamason/ui/common/app_colors.dart';

class PrimaryCircularWhiteButton extends StatelessWidget {
  const PrimaryCircularWhiteButton({
    super.key,
    this.onPressed,
    required this.icon,
  });
  final Function()? onPressed;
  final SvgPicture icon;

  @override
  Widget build(BuildContext context) {
    return _PrimaryButton(
      color: Colors.white,
      onPressed: onPressed,
      icon: icon,
      shape: const CircleBorder(),
    );
  }
}

class PrimaryCircularButton extends StatelessWidget {
  const PrimaryCircularButton({
    super.key,
    this.onPressed,
    required this.icon,
  });
  final Function()? onPressed;
  final SvgPicture icon;

  @override
  Widget build(BuildContext context) {
    return _PrimaryButton(
      onPressed: onPressed,
      icon: icon,
      shape: const CircleBorder(),
    );
  }
}

class PrimarySquaredButton extends StatelessWidget {
  const PrimarySquaredButton({
    super.key,
    this.onPressed,
    required this.icon,
  });
  final Function()? onPressed;
  final SvgPicture icon;

  @override
  Widget build(BuildContext context) {
    return _PrimaryButton(
      onPressed: onPressed,
      icon: icon,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  const _PrimaryButton({
    required this.shape,
    required this.onPressed,
    this.color = kcPrimaryGrey,
    required this.icon,
  });
  final ShapeBorder shape;
  final Function()? onPressed;
  final Color color;
  final SvgPicture icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 40,
      child: RawMaterialButton(
        shape: shape,
        fillColor: color,
        elevation: 0,
        onPressed: onPressed,
        child: icon,
      ),
    );
  }
}
