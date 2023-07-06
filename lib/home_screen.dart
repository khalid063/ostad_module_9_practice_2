import 'package:flutter/material.dart';
import 'package:module_9_practice_2/new_product_add_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CRUD"),
      ),
      body: ListView.separated(
        itemCount: 20,
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
              title: Text("Product Name"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Product Code"),
                  Text("Total Price"),
                  Text("Available Unites"),
                ],
              ),
              //leading: Icon(Icons.image),
              leading: Image.network(
                "https://images.newscientist.com/wp-content/uploads/2022/11/15134521/SEI_133692139.jpg?width=900",
                //"https://images.newscientist.com/uploads/2022/11/15134521/SEI_133692139.jpg?width=900",
                width: 60,
                errorBuilder: (_, __, ___){
                  return Icon(Icons.image);
                },
              ),
              trailing: Text("Unit Price"),
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
