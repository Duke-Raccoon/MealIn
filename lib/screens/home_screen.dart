import 'package:flutter/material.dart';
import 'package:recipeapp/components/home_app_bar.dart';
import 'package:recipeapp/components/tab_bar_widget.dart';
import 'package:recipeapp/components/text_field_widget.dart';
import 'package:recipeapp/constants/images_path.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeAppBar(),
              SizedBox(
                height: h * 0.02,
              ),
              const TextFieldWidget(),
              SizedBox(
                height: h * 0.02,
              ),
              Container(
                height: h * 0.2,
                width: w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(ImagesPath.explore), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20)
                ),
              ),
              SizedBox(
                height: h * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                        fontSize: w * 0.05,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text('see all'),
                  SizedBox(width: w*0.02,)
                ],
              ),
              SizedBox(height: h*0.02,),
              const TabBarWidget(),
            ],
          ),
        ),
      )),
    );
  }
}
