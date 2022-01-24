import 'package:ecommerce/Constans.dart';
import 'package:flutter/material.dart';

import 'AddProducte.dart';
import 'EditProducte.dart';

class AdminPage extends StatelessWidget {
  static String adminPage = "AdminPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KMainColor,
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            SizedBox(
              width: double.infinity,
            ),
            TextButton.icon(
                icon: Icon(Icons.add_shopping_cart,
                color: Colors.black,),
                label: const Text(BTNAdd,
                style: TextStyle(
                  color: Colors.black
                ),),
                onPressed: ()  {
                  Navigator.pushNamed(context, AddProducte.addProducte);
                },
                style: TextButton.styleFrom(
                  backgroundColor: KBackGroundButton,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                )),
            TextButton.icon(
                onPressed: () {
                Navigator.pushNamed(context,MangeProducte.manageProducte);
                },
                icon: Icon(Icons.shopping_bag_outlined,
                    color: Colors.black),
                label: Text(BTNManage
                ,style: TextStyle(
                    color: Colors.black
                  ),),
                style: TextButton.styleFrom(
                  backgroundColor: KBackGroundButton,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                )),
            TextButton.icon(
                onPressed: () => {},
                icon: Icon(Icons.delete_forever,
                    color: Colors.black),
                label: Text(BTNDlete,
                style: TextStyle(color: Colors.black),),
                style: TextButton.styleFrom(
                  backgroundColor: KBackGroundButton,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ))
          ]),
    );
  }
}
