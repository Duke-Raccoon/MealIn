import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipeapp/components/custom_app_bar.dart';
import 'package:recipeapp/constants/share.dart';

class ShoppingScreen extends StatelessWidget {
  
  const ShoppingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const CustomAppBar(title: 'Shopping', back: false,),
      body: ValueListenableBuilder(
        valueListenable: Hive.box('shopping').listenable(), 
        builder: (context,box,_){
          var data=box.values.toList();
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index){
              
              return ListTile(
                title: Container(
                  decoration: BoxDecoration(
                  color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(20)),
                  height: h*0.1,
                  
                  padding: EdgeInsets.all(10),
                  child: Row(children: [
                    Expanded(
                      flex: 3,
                      child: Text(data[index].toString(), style: TextStyle(color: Colors.white),)),
                      PopupMenuButton(
                        color: Colors.white,
                        itemBuilder: (context){
                        return const [
                          PopupMenuItem(value: 'share', child: Text('share')),
                          PopupMenuItem(value: 'delete', child: Text('delete')),
                        ];
                      },
                      onSelected: (String value) async{
                        if(value=='delete'){
                          deleteItem(index);
                        }
                        else if(value=='share'){
                          ShareRecipe.share(data[index].toString());
                        }
                        
                      },
                      
                      )
                  ],),
                )
                );
            },
          );
        },
    ));
  }
  
  Future <void> deleteItem(int index) async{
    await Hive.box('shopping').deleteAt(index);
  }
}