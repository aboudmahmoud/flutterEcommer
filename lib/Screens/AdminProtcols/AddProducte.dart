import 'package:ecommerce/Moudels/ProductInfo.dart';
import 'package:ecommerce/WidgetsToUse/coustemTextField.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/services/store.dart';


import '../../Constans.dart';

class AddProducte extends StatelessWidget {
  static String addProducte = "AddProducte";
  final GlobalKey<FormState> _globalKey=GlobalKey<FormState>();
  // that mathod to Uese Firebase and store data in it
  final _store=Store();

  //Varlble to save The data We Get from User
  String? _ProuductName,_ProductDescription,_ProductCategory,_ProductPrice,_ImagePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _globalKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
                hint: HintProuductName, icon: Icons.border_color,
            onClick: (value){
              _ProuductName=value;
            },),
            SizedBox(height: 10,),
            CustomTextField(
                hint: HintProductDescription, icon: Icons.description,
              onClick: (value){
                _ProductDescription=value;
              },
            ),
            SizedBox(height: 10,),
            CustomTextField( onClick: (value){
              _ProductCategory=value;
            }, hint: HintProductCategory, icon: Icons.category),
            SizedBox(height: 10,),
            CustomTextField(
                hint: HintProductImage, icon: Icons.image,
              onClick: (value){
                _ImagePath=value;
              },),
            SizedBox(height: 10,),
            CustomTextField(hint: HintProudctPrice, icon: Icons.price_change,onClick: (value){
              _ProductPrice=value;
            },),
            SizedBox(height: 20,),
            ElevatedButton.icon(onPressed: (){
              if (_globalKey.currentState!.validate())// valdting the data
                {
                  _globalKey.currentState!.save();
                  _store.addProduct(ProductInfo(
                      ProductNanme: _ProuductName,
                    ProductPrice: _ProductPrice,
                    ProductCategory: _ProductCategory,
                    ProductDescription: _ProductDescription,
                    ProductImage: _ImagePath

                  ));
                }
            },
                icon: Icon(Icons.add_shopping_cart),
                label: Text(
                    BTNAdd,
                ),
            style: ElevatedButton.styleFrom(primary: KBackGroundButton),)
          ],
        ),
      ),
    );
  }
}
