import 'package:flutter/material.dart';

class Package extends StatelessWidget {
  final String title;
  final String subTitle;
  final String money;
  final String min;
  final IconData leadingIcon;
  final IconData trailingIcon;
  final Color? listTitleColor;
  final Color? iconColors;

  const Package({
    Key? key,
    required this.title,
    required this.money,
    required this.min,
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
         Row(
           children: [
             Container(
               child: CircleAvatar(
                 backgroundColor: iconColors,
                 child: Icon(leadingIcon, color: listTitleColor,),
               )
             ),

             Container(
               margin: EdgeInsets.only(left: 8),
               child: Row(
                 children: [
                 Container(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                   Text(title, style: TextStyle(fontWeight: FontWeight.bold),),
                   Text(subTitle)
                      ],),
                 ),
                 Container(
                   padding: EdgeInsets.only(left:50),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                     Text(money, style: TextStyle(fontWeight: FontWeight.bold)),
                     Text(min)
                   ],),
                 )
                 ],
               ),
             )
           ],
         )
      ],
    );
  }
}
