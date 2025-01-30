import 'package:flutter/material.dart';

class ShowDialog {
  static Future showCalories(
      Map<String, dynamic> item, BuildContext context) async {


        int fat=item['FAT']['quantity'].toInt();
        int sFat=item['FASAT']['quantity'].toInt();
        int cholesterol=item['CHOLE']['quantity'].toInt();
        int nA=item['NA']['quantity'].toInt();
        int carbohydrate=item['CHOCDF.net']['quantity'].toInt();
        int sugar=item['SUGAR']['quantity'].toInt();
        int protein=item['PROCNT']['quantity'].toInt();





    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(70)),
                backgroundColor:  Colors.pink,
            title: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.pinkAccent, Colors.deepOrangeAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(70),
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: const Center(
                child: Text(
                  "Calories",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            content: Container(
              height: 300,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.pinkAccent, Colors.deepOrangeAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total Fat',style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),),
                        Text(fat.toString(), style: const TextStyle(color:Colors.white, fontWeight: FontWeight.w400),)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('sFat', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),),
                        Text(sFat.toString(),style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('cholesterol', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400)),
                        Text(cholesterol.toString(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('NA', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400)),
                        Text(nA.toString(),style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('carbohydrate', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400)),
                        Text(carbohydrate.toString(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('sugar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400)),
                        Text(sugar.toString(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('protein', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400)),
                        Text(protein.toString(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
