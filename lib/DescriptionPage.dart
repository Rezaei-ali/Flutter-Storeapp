import 'package:flutter/material.dart';
import 'package:flutterpractice/Product.dart';

class DescriptionPage extends StatelessWidget {
  Product _product;

  DescriptionPage(this._product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(
          'فروشگاه',
          style: TextStyle(color:Colors.black54 , fontFamily: 'Vazir'),
        ),
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black54,
        ),
        //backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Align(
            child: Text(
              'کفش ها',
              style: TextStyle(
                fontFamily:'Vazir',
                color: Colors.red[700],
                fontSize: 35
              ),

            ),
            alignment: Alignment.topLeft,
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Image.network(
              _product.imageUrl,
              height: 180,
              width: 180,
              fit: BoxFit.contain,
            ),
          ),
          Text(
            _product.price,
            style:TextStyle(
              color: Colors.red[700],
              fontFamily: 'Vazir',
              fontSize: 20
            )
          ),
          Text(
              _product.productName,
              style:TextStyle(
                  color: Colors.black54,
                  fontFamily: 'Vazir',
                  fontSize: 25
              )
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 45,right: 45),
            child: Text(
              _product.description,
              style: TextStyle(
                  color: Colors.black54,
                  fontFamily: 'Vazir',
                  fontSize: 14
              ),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),

    );
  }
}
