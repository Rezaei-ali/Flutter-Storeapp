import 'dart:convert';

import 'package:flutter/material.dart';
import 'ShopBottomNavigator.dart';
import 'package:http/http.dart';
import 'Product.dart';
import 'BranchesPage.dart';
import 'DescriptionPage.dart';

void main() {
  runApp(MainMaterial());
}

class MainMaterial extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Store(),
    );
  }
}



class Store extends StatefulWidget {
  const Store({Key? key}) : super(key: key);

  @override
  _StoreState createState() => _StoreState();
}




class _StoreState extends State<Store> {
  List<Product> _items=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchItems();
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
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
          actions: [
            IconButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BranchesPage()
                  ));
                },
                icon: Icon(Icons.map,color:Colors.black54)
            )
          ],
        ),

        body: Padding(
          padding: EdgeInsets.all(15),
          child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 15,
              children: List.generate(_items.length, (int position){
                return generateItem(_items[position] , context);
          }),
          ),
        ),

        bottomNavigationBar: ShopBottomNavigator(),
        floatingActionButton: FloatingActionButton(onPressed: () {  },child: Icon(Icons.add_shopping_cart_outlined),),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }

  void fetchItems() async{
    var url = Uri.parse('http://welearnacademy.ir/flutter/products_list.json');
    Response response = await get(url);
    setState(() {
      var productJson = json.decode(utf8.decode(response.bodyBytes));
      for(var i in productJson){
        var productItem = Product(i['product_name'], i['id'], i['price'],
            i['image_url'], i['off'], i['description']);
        _items.add(productItem);
      }
    });
  }
}

Card generateItem(Product product , context){
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30))
    ),
    elevation: 4,
    child: InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context)=> DescriptionPage(product)
        ));
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              child: Image.network(product.imageUrl),
            ),
            Text(
                product.price,
                style: TextStyle(
                  fontFamily: 'Vazir',
                  color: Colors.red,
                  fontSize: 16
                ),
            ),
            Text(
              product.productName,
              style: TextStyle(
                  fontFamily: 'Vazir',
                  color: Colors.blue,
                  fontSize: 14
              ),
            )
          ],
        ),
      ),
    ),

  );
}