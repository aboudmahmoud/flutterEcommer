import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/Moudels/ProductInfo.dart';

import '../Constans.dart';

class Store {
  //here we get instace to Our FireBase
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  addProduct(ProductInfo product) {
    //here We the Data we get for AddProdcte.dart page

    //this method is adding the data we get to friebase
    //ProductColletion = Product in Constans.dart
    _firestore.collection(ProductColletion).add({
      HintProuductName: product.ProductNanme,
      HintProudctPrice: product.ProductPrice,
      HintProductDescription: product.ProductDescription,
      HintProductCategory: product.ProductCategory,
      HintProductImage: product.ProductImage
    });
  }

  //this list to get The data form fire base
/* Future<List<ProductInfo>> loadProudct() async

{List<ProductInfo> Product = [];
    //here we get all data from firebase
    //var snapshot=await _firestore.collection(ProductColletion).get();//we will replactit with snapshot
    await for ( var snapshot in _firestore.collection(ProductColletion).snapshots())
      {
    for (var Docs in snapshot.docs) {
      var data = Docs.data();
      Product.add(ProductInfo(
          ProductNanme: data[HintProuductName],
          ProductPrice: data[HintProudctPrice],
          ProductCategory: data[HintProductCategory],
          ProductDescription: data[HintProductDescription],
          ProductImage: data[HintProductImage]

      ));
    }
   return Product;
      }
    return Product;
  }
}*/

  Stream<QuerySnapshot> loadProudct() {
    return _firestore.collection(ProductColletion).snapshots();
  }

  deletProducte(docID) {
    _firestore.collection(ProductColletion).doc(docID).delete();
  }

  editProducte(data,docID){
    _firestore.collection(ProductColletion).doc(docID).update(data);
  }


}
