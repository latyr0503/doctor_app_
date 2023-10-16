import 'package:flutter/material.dart';

class listTileWidget extends StatelessWidget {
  
  String title, subTitle;
  IconData leadingIcon, trainingIcon;
  Color? listTileColor, iconColor;

listTileWidget({
required this.title,
required this.subTitle,
this.leadingIcon = Icons.label,
this.trainingIcon = Icons.add_shopping_cart,
required this.listTileColor,
required this.iconColor,
});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
    child: ListTile(
        tileColor: listTileColor,
        shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(10.0),
        side: const BorderSide(
          width: 1.0,
          color: Colors.blue,
        )),
        title: Text(title),
        subtitle: Text(subTitle),

        leading: IconButton(onPressed: (){}, 
        icon: const Icon(Icons.person),
        color : iconColor),

        trailing: IconButton(
          onPressed: (){},
           icon: Icon(trainingIcon)
           ),
      )
      );
  }
}
