import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipeapp/components/custom_app_bar.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const CustomAppBar(title: 'Saved', back: false),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ValueListenableBuilder(
            valueListenable: Hive.box('saved').listenable(),
            builder: (context, box, _) {
              return ListView.builder(
                itemCount: box.length,
                itemBuilder: (context, index) {
                  var data = box.values.toList();
                  return ListTile(
                      title: Container(
                        padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.pinkAccent, Colors.deepOrangeAccent],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius:
                          BorderRadius.circular(30), // Rounded corners
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pink
                              .withOpacity(0.4), // Pink shadow for glow effect
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    height: h * 0.1,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Text(
                              data[index],
                              style: const TextStyle(color: Colors.white),
                            )),
                        PopupMenuButton(
                            color: Colors.white,
                            itemBuilder: (context) {
                              return const [
                                PopupMenuItem(
                                    value: 'share', child: Text('share')),
                                PopupMenuItem(
                                    value: 'delete', child: Text('delete')),
                              ];
                            },
                            onSelected: (String value) async{
                              
                            },)
                      ],
                    ),
                  ));
                },
              );
            }),
      ),
    );
  }
}
