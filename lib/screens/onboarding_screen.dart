import 'package:flutter/material.dart';
import 'package:recipeapp/constants/images_path.dart';
import 'package:recipeapp/screens/home.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        height: h,
        width: w,
        child: Stack(
          children: [
            Positioned(
                top: 0,
                child: Container(
                  height: h * 0.85,
                  width: w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImagesPath.onBoardingTitle),
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
            Center(
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.8),
                  BlendMode.dstATop,
                ),
                child: Image.asset(ImagesPath.onBoardingText),
              ),
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  height: h * 0.2,
                  width: w,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: h * 0.02),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        Text('Lets cook good food',style: TextStyle(
                          fontSize: w*0.06,
                          fontWeight: FontWeight.w600
                        ),),
                        SizedBox(height: h*0.01,),
                        Text('Your favorite food is just a click away',style: TextStyle(
                          fontSize: w*0.04,
                          fontWeight: FontWeight.w400
                        ),),
                        SizedBox(height: h*0.01,),
                        SizedBox(
                          width: w*0.8,
                          child: ElevatedButton(onPressed:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const Home()));

                          }, 
                          child: const Text('Get Started',style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black
                          ),),),
                        )
                        ],
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
