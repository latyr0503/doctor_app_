import 'package:flutter/material.dart';

class NewWidgetList extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData leadingIcon;
  final IconData trailingIcon;
  final Color? listTitleColor;
  final Color? iconColors;

  const NewWidgetList({
    Key? key,
    required this.title,
    required this.subTitle,
    this.leadingIcon = Icons.label,
    this.trailingIcon = Icons.add_shopping_cart,
    this.listTitleColor,
    this.iconColors,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return 
    Column(
      children: [
        ListTile(
          tileColor: listTitleColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(
              width: 1.0,
              color: Colors.blue,
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(subTitle),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(leadingIcon),
            color: iconColors,
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(trailingIcon),
          ),
        ),
      ],
    );
  }
}
