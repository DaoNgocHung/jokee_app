import 'package:flutter/material.dart';


import 'package:jokee_app/app/core/themes/themes.dart';class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final List<Widget>? actions;
  final double height;
  final Color? backgroundColor;

  const CustomAppbar({
    super.key,
    this.leading,
    this.actions,
    this.height = kToolbarHeight,
    this.backgroundColor,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? AppColors.white,
      actions: actions,
      leading: leading,
    );
  }
}
