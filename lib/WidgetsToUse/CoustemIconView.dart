import 'package:flutter/material.dart';

import '../Constans.dart';

class CoustomIconVeiw extends StatelessWidget {
  /*const CoustomIconVeiw({
    Key? key,
  }) : super(key: key);*/

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image(
              image: AssetImage('Images/onlines.png'),
            ),
            Positioned(
              bottom: 10,
              child: Text(
                CommercialPhrases,
                style: TextStyle(
                  fontFamily: 'Pacifico',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}