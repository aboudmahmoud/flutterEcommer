import 'package:ecommerce/Constans.dart';
import 'package:ecommerce/Moudels/ProductInfo.dart';
import 'package:ecommerce/WidgetsToUse/coustemTextField.dart';
import 'package:ecommerce/services/store.dart';
import 'package:flutter/material.dart';

class EditProducte extends StatelessWidget {
  static String  editProducte = "EditProducte";
  final GlobalKey<FormState> _globalKey=GlobalKey<FormState>();
  // that mathod to Uese Firebase and store data in it
  final _store=Store();

  //Varlble to save The data We Get from User
  String? _ProuductName,_ProductDescription,_ProductCategory,_ProductPrice,_ImagePath;

  @override
  Widget build(BuildContext context) {
   ProductInfo? Producte= ModalRoute.of(context)!.settings.arguments as ProductInfo?  ;


    return Scaffold(
      body: Form(
        key: _globalKey,
        child: ListView(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.2),
            Column(
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
                    _store.editProducte( ({
                      HintProuductName:_ProuductName,
                      HintProudctPrice:_ProductPrice,
                      HintProductDescription : _ProductDescription ,
                      HintProductCategory: _ProductCategory,
                      HintProductImage:_ImagePath


                    }), Producte!.ProductID);

                  }
                },
                  icon: Icon(Icons.add_shopping_cart),
                  label: Text(
                    BTNAdd,
                  ),
                  style: ElevatedButton.styleFrom(primary: KBackGroundButton),)
              ],
            ),
          ],
        )
      ),
    );
  }
}
