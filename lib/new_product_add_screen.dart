import 'package:flutter/material.dart';
import 'package:module_9_practice_2/style.dart';

class NewProductAddScreen extends StatefulWidget {
  const NewProductAddScreen({Key? key}) : super(key: key);

  @override
  State<NewProductAddScreen> createState() => _NewProductAddScreenState();
}

class _NewProductAddScreenState extends State<NewProductAddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Product"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              TextFormField(
                decoration: myInputDecoretion("Name"),
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: myInputDecoretion("Product Code"),
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: myInputDecoretion("Price"),
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: myInputDecoretion("Quality"),
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: myInputDecoretion("Total Price"),
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: myInputDecoretion("Image"),
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){}, child: Text("Add Pruduct"))
            ],
          ),
        ),
      ),
    );
  }
}
