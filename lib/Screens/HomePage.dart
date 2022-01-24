import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/Constans.dart';
import 'package:ecommerce/Moudels/ProductInfo.dart';
import 'package:ecommerce/services/auth.dart';
import 'package:ecommerce/services/store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  static String homePage="HomePage";

   @override
  _HomePageState createState()=> _HomePageState();




}

class _HomePageState extends State<HomePage>
{
  final _auth= Auth();
  final _store = Store(); //here is The Method that contue method to load or get our data


  late User usecurren;
  int _TabeIndex=0;
  int _indexbar=0;
  @override
  Widget build(BuildContext context) {
    double orjWidth = MediaQuery.of(context).size.width;
    double cameraWidth = orjWidth/24;
    double yourWidth = (orjWidth - cameraWidth)/5;

    // TODO: implement build
    return Stack(
     children: <Widget>[
       DefaultTabController(length: 6,
           child: Scaffold(
             bottomNavigationBar: BottomNavigationBar(
               type: BottomNavigationBarType.fixed,
              currentIndex:_indexbar ,
               fixedColor: KMainColor,
               onTap: (value){
                setState(() {
                  _indexbar=value;
                });
               },
               items: [
                 BottomNavigationBarItem(icon: Icon(Icons.home),label:homepage),
                 BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label:cart),
                 BottomNavigationBarItem(icon: Icon(Icons.wallet_giftcard_sharp),label:wallet),
                 BottomNavigationBarItem(icon: Icon(Icons.share),label:share)
               ],

             ),
             appBar: AppBar(
               backgroundColor: Colors.white,
               elevation: 1,
               bottom: TabBar(

                 indicatorColor: KMainColor,
                 labelPadding: EdgeInsets.symmetric(horizontal:(orjWidth - ( cameraWidth + yourWidth*3))/8),
                 isScrollable: true,
                 onTap: (value){
                   setState(() {
                     _TabeIndex=value;
                   });},
                 tabs:<Widget> [
                   Text(All,
                   style: TextStyle(
                     color: _TabeIndex==0 ? Colors.black:KLikeWhiteColor,
                     fontSize:  _TabeIndex==0 ? 16:null
                   )
                   ),
                   Text(AC,
                       style: TextStyle(
                       color: _TabeIndex==1? Colors.black:KLikeWhiteColor,
                       fontSize:  _TabeIndex==1? 16:null
                   )),
                   Text(CD,style: TextStyle(
                       color: _TabeIndex==2? Colors.black:KLikeWhiteColor,
                       fontSize:  _TabeIndex==2? 16:null
                   )),
                   Text(jacket,style: TextStyle(
                       color: _TabeIndex==3? Colors.black:KLikeWhiteColor,
                       fontSize:  _TabeIndex==3? 16:null
                   )),
                   Text(pc,style: TextStyle(
                       color: _TabeIndex==4? Colors.black:KLikeWhiteColor,
                       fontSize:  _TabeIndex==4? 16:null
                   )),
                   Text(ps,style: TextStyle(
                       color: _TabeIndex==5? Colors.black:KLikeWhiteColor,
                       fontSize:  _TabeIndex==5? 16:null
                   ))

                 ],
               ),
             ),
         body: TabBarView(

           children: [
            animeView(),
             animeView(),
             animeView(),
             animeView(),
             animeView(),
             animeView(),
           ],

         ),
       )),
       Material(
         child:Padding(padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
           child: Container(

             height: MediaQuery.of(context).size.height*0.1,
             child: Row(
               mainAxisAlignment:MainAxisAlignment.spaceBetween ,
               children: [
                 Text(Discvoer.toUpperCase(),
                     style:TextStyle(
                       fontSize: 20,
                       fontWeight: FontWeight.bold,
                     )),
                 Icon(
                     Icons.shopping_cart
                 )
               ],
             ),
           ),
           
         )
       )
     ],
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    getCurrentuser();
  }


  getCurrentuser() async
  {
    usecurren=  _auth.getUser() as User;
  }

 Widget animeView() {
    return StreamBuilder<QuerySnapshot>(
      // FutureBuilder that widget is to make get data that will come later or that we havet wait withot Reloding page
      stream: _store.loadProudct(),
      //future is method that take data that will come later
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ProductInfo> Producte = []; // this Our Moudle
          for (var Docs in snapshot.data!.docs) {
            dynamic data = Docs.data(); // we use Dynamic case Docs is Qureysanpshot and later we use String that is error
            if(_TabeIndex==0)
              {
            Producte.add(ProductInfo(
                ProductID: Docs.id,
                ProductNanme: data[HintProuductName],
                ProductPrice: data[HintProudctPrice],
                ProductCategory: data[HintProductCategory],
                ProductDescription: data[HintProductDescription],
                ProductImage: data[HintProductImage]));}
            else if( _TabeIndex==1)
              {
                if(Docs[HintProductCategory]==AC)
                  {
                    Producte.add(ProductInfo(
                        ProductID: Docs.id,
                        ProductNanme: data[HintProuductName],
                        ProductPrice: data[HintProudctPrice],
                        ProductCategory: data[HintProductCategory],
                        ProductDescription: data[HintProductDescription],
                        ProductImage: data[HintProductImage]));
                  }
              }
            else if( _TabeIndex==2)
            {
              if(Docs[HintProductCategory]==CD)
              {
                Producte.add(ProductInfo(
                    ProductID: Docs.id,
                    ProductNanme: data[HintProuductName],
                    ProductPrice: data[HintProudctPrice],
                    ProductCategory: data[HintProductCategory],
                    ProductDescription: data[HintProductDescription],
                    ProductImage: data[HintProductImage]));
              }
            }
            else if( _TabeIndex==3)
            {
              if(Docs[HintProductCategory]==jacket)
              {
                Producte.add(ProductInfo(
                    ProductID: Docs.id,
                    ProductNanme: data[HintProuductName],
                    ProductPrice: data[HintProudctPrice],
                    ProductCategory: data[HintProductCategory],
                    ProductDescription: data[HintProductDescription],
                    ProductImage: data[HintProductImage]));
              }
            }
            else if( _TabeIndex==4)
            {
              if(Docs[HintProductCategory]==pc)
              {
                Producte.add(ProductInfo(
                    ProductID: Docs.id,
                    ProductNanme: data[HintProuductName],
                    ProductPrice: data[HintProudctPrice],
                    ProductCategory: data[HintProductCategory],
                    ProductDescription: data[HintProductDescription],
                    ProductImage: data[HintProductImage]));
              }
            }
            else if( _TabeIndex==5)
            {
              if(Docs[HintProductCategory]==ps)
              {
                Producte.add(ProductInfo(
                    ProductID: Docs.id,
                    ProductNanme: data[HintProuductName],
                    ProductPrice: data[HintProudctPrice],
                    ProductCategory: data[HintProductCategory],
                    ProductDescription: data[HintProductDescription],
                    ProductImage: data[HintProductImage]));
              }
            }
          }
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.8),
            itemBuilder: ((context, index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: GestureDetector(
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
    );
 }
  
}