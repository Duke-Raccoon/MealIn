import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipeapp/components/custom_app_bar.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Saved', back: false),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ValueListenableBuilder(
            valueListenable: Hive.box('saved').listenable(),
            builder: (context, box, _) {
              return ListView.builder(
                itemCount: box.length,
                itemBuilder: (context, index) {
                  var data = box.values.toList();
                  return ListTile(
                      title: Container(
                    color: Colors.deepOrange,
                    child: Row(
                      children: [
                        Expanded(flex: 3, child: Text(data[index])),
                        PopupMenuButton(itemBuilder: (context) {
                          return const [
                            PopupMenuItem(value: 'share', child: Text('share')),
                            PopupMenuItem(
                                value: 'delete', child: Text('delete')),
                          ];
                        })
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
