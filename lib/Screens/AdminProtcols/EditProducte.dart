import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/Constans.dart';
import 'package:ecommerce/Moudels/ProductInfo.dart';
import 'package:ecommerce/services/store.dart';
import 'package:flutter/material.dart';

import 'UpdateProducte.dart';

class MangeProducte extends StatefulWidget {
  static String manageProducte = "MangeProducte";

  @override
  State<MangeProducte> createState() => _MangeProducteState();
}

class _MangeProducteState extends State<MangeProducte> {
  final _store = Store(); //here is The Method that contue method to load or get our data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        // FutureBuilder that widget is to make get data that will come later or that we havet wait withot Reloding page
        stream: _store.loadProudct(),
        //future is method that take data that will come later
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ProductInfo> Producte = []; // this Our Moudle
            for (var Docs in snapshot.data!.docs) {
              dynamic data = Docs
                  .data(); // we use Dynamic case Docs is Qureysanpshot and later we use String that is error
              Producte.add(ProductInfo(
                ProductID: Docs.id,
                  ProductNanme: data[HintProuductName],
                  ProductPrice: data[HintProudctPrice],
                  ProductCategory: data[HintProductCategory],
                  ProductDescription: data[HintProductDescription],
                  ProductImage: data[HintProductImage]));
            }
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.8),
              itemBuilder: ((context, index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: GestureDetector(
                      onTapUp: (details) async {
                        double dx = details.globalPosition.dx;
                        double dy = details.globalPosition.dy;
                        double dxright = MediaQuery.of(context).size.width - dx;
                        double dyBottom =
                            MediaQuery.of(context).size.height - dy;
                       await  showMenu(
                            context: context,
                            position: RelativeRect.fromLTRB(
                                dx, dy, dxright, dyBottom),
                            items: [
                              MypopItemMany(
                                child: Text(EditMessg),
                                onClick: (){
                                  Navigator.pushNamed(context, EditProducte.editProducte,arguments: Producte[index]
                                  );
                                },
                              ),

                              MypopItemMany(
                                child: Text(DeletMessg),
                                onClick: (){
                                  _store.deletProducte(Producte[index].ProductID);
                                  Navigator.pop(context);
                                },
                              )
                            ]);
                      },
                      child: Stack(
                        children: [
                          // Image.asset(Producte[index].ProductImage!)
                          Positioned.fill(
                            child: Image(
                              fit: BoxFit.fill,
                              image: AssetImage(Producte[index].ProductImage!),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Opacity(
                              opacity: 0.6,
                              child: Container(
                                color: Colors.white,
                                height: 60,
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        Producte[index].ProductNanme!,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text('${Producte[index].ProductPrice}\$')
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              itemCount: Producte.length,
            );
          } else {
            return Center(child: Text(LoadingMessg));
          }
        },
      ),
    );
  }
/* @override
  void initState()//that method like constractor work frist thing when the page is carted
  {
    getPrdoucte();
  }

  void getPrdoucte () async // that metho to get all data form fire
  {
    // We Sommon The method to get our data From Our firebase
    _Product= await _store.loadProudct();
  }*/
}

class MypopItemMany<T> extends PopupMenuItem<T> {
 Function? onClick ;
  Widget? child;
  MypopItemMany( {@required this.child ,@required this.onClick}) : super(child: child);

  @override
  PopupMenuItemState<T, PopupMenuItem<T>> createState() {
    return MypopItemManyState();
  }
}

class MypopItemManyState<T, PopupMenuItem>
    extends PopupMenuItemState<T, MypopItemMany<T>> {

  @override
  void handleTap() {
    widget.onClick!();

  }
}
