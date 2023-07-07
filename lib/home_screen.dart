import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:module_9_practice_2/new_product_add_screen.dart';
import 'package:http/http.dart';
import 'package:module_9_practice_2/products.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Products> products = [];

  ///API call initState
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("API Call");
    getProduct();
  }

  getProduct() async{
    Response response = await get(Uri.parse('https://crud.teamrabbil.com/api/v1/ReadProduct'));
    print(response.statusCode);
    print(response.body);
    final Map<String, dynamic> decodedResponse = jsonDecode(response.body);
    print(decodedResponse['data'].length);
    if ( response.statusCode == 200 && decodedResponse['status'] == 'success'){
      for ( var e in decodedResponse['data']){
        products.add(Products(
          e['_id'],
          e['ProductName'],
          e['ProductCode'],
          e['UnitPrice'],
          e['Qty'],
          e['TotalPrice'],
            //it, productName, productCode, image, unitPrice, totalPrice
        ));
      }
      setState(() {});
    }
    print("888 : ${products[0].productName}");
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CRUD"),
      ),
      body: ListView.separated(
        itemCount: products.length,
          itemBuilder: (context, index){
            return ListTile(
              onTap: (){
                showDialog(
                    context: context,
                    ///builder: (BuildContext context) ///*** we can be use also this code
                    builder: (_){
                      return AlertDialog(
                        //titlePadding: EdgeInsets.zero,
                        //contentPadding: EdgeInsets.zero,
                        titlePadding: EdgeInsets.only(left: 16),
                        contentPadding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
                        title: Row(
                          children: [
                            Text("Chose an Action"),
                            Spacer(),
                            IconButton(onPressed: (){
                              Navigator.pop(context);
                            }, icon: Icon(Icons.close)),
                          ],
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Divider(color: Colors.red, height: 2,),
                            ListTile(
                              onTap: (){},
                              leading: Icon(Icons.edit),
                              title: Text("Edit"),
                            ),
                            ListTile(
                              onTap: (){},
                              leading: Icon(Icons.delete),
                              title: Text("Delete"),
                            ),
                          ],
                        ),
                      );
                    }
                );
              },
              title: Text("Product Name : ${products[index].productName}"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Product Code : ${products[index].productCode}"),
                  Text("Total Price : ${products[index].totalPrice}"),
                  Text("Available Unites : ${products[index].totalPrice}"),
                ],
              ),
              //leading: Icon(Icons.image),
              leading: Image.network(
                products[index].image,
                //"https://images.newscientist.com/wp-content/uploads/2022/11/15134521/SEI_133692139.jpg?width=900",
                //"https://images.newscientist.com/uploads/2022/11/15134521/SEI_133692139.jpg?width=900",
                width: 60,
                errorBuilder: (_, __, ___){
                  return Icon(Icons.image);
                },
              ),
              trailing: Text("Unit Price : ${products[index].unitPrice}"),
            );
          }, separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          color: Colors.purple,
          height: 1,
        );
      },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => NewProductAddScreen()));
        },child: Icon(Icons.add),
      ),
    );
  }
}
