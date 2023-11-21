import 'package:flutter/material.dart';

class PdfFileItems extends StatelessWidget {
  const PdfFileItems({
    super.key,
    this.image,
    required this.title,
    required this.subtext,
    this.icon,
    this.iconButton,
    this.isCheckDisplayIcon = false,
    this.function,
  });
  final Widget? image;
  final Icon? icon;
  final Widget? iconButton;
  final String title;
  final String subtext;
  final bool isCheckDisplayIcon;
  final Function()? function;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.1),
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: image,
        title: Text(title),
        subtitle: Text(subtext),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            iconButton ?? SizedBox(),
            isCheckDisplayIcon
                ? SizedBox.shrink()
                : IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.radio_button_unchecked,
                      size: 16,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
