import 'package:flutter/material.dart';

class ShowQuantity {
  static Future showQuantity(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(70)),
            backgroundColor: Colors.pinkAccent,
            title: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.pinkAccent, Colors.deepOrangeAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(50),
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: const Center(
                child: Text(
                  "Units of mesurement",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Table(
                  border: TableBorder.all(
                      color: Colors.white, style: BorderStyle.solid, width: 2),
                  children: const [
                    TableRow(children: [
                      BuildTableCell(
                        text1: 'CUP',
                        text2: '(cup)',
                      ),
                      BuildTableCell(
                        text1: 'OUNCE',
                        text2: '(oz)',
                      ),
                      BuildTableCell(
                        text1: 'TABLE',
                        text2: 'SPOON',
                        text3: '(tbsp)',
                      ),
                      BuildTableCell(
                        text1: 'TEA',
                        text2: 'SPOON',
                        text3: '(tsp)',
                      ),
                      BuildTableCell(
                        text1: 'MILLI',
                        text2: 'LITRE',
                        text3: '(ml)',
                      ),
                    ]),
                    TableRow(children: [
                      BuildTableCell(
                        text1: '1',
                        text2: 'cup',
                      ),
                      BuildTableCell(
                        text1: '8',
                        text2: 'oz',
                      ),
                      BuildTableCell(
                        text1: '16',
                        text2: 'tbsp',
                      ),
                      BuildTableCell(
                        text1: '48',
                        text2: 'tsp',
                      ),
                      BuildTableCell(
                        text1: '237',
                        text2: 'ml',
                      ),
                    ]),
                    TableRow(children: [
                      BuildTableCell(
                        text1: '1/8',
                        text2: 'cup',
                      ),
                      BuildTableCell(
                        text1: '1',
                        text2: 'oz',
                      ),
                      BuildTableCell(
                        text1: '2',
                        text2: 'tbsp',
                      ),
                      BuildTableCell(
                        text1: '6',
                        text2: 'tsp',
                      ),
                      BuildTableCell(
                        text1: '30',
                        text2: 'ml',
                      ),
                    ]),
                    TableRow(children: [
                      BuildTableCell(
                        text1: '1/16',
                        text2: 'cup',
                      ),
                      BuildTableCell(
                        text1: '0.5',
                        text2: 'oz',
                      ),
                      BuildTableCell(
                        text1: '1',
                        text2: 'tbsp',
                      ),
                      BuildTableCell(
                        text1: '3',
                        text2: 'tsp',
                      ),
                      BuildTableCell(
                        text1: '15',
                        text2: 'ml',
                      ),
                    ]),
                    TableRow(children: [
                      BuildTableCell(
                        text1: '1/48',
                        text2: 'cup',
                      ),
                      BuildTableCell(
                        text1: '0.16',
                        text2: 'oz',
                      ),
                      BuildTableCell(
                        text1: '1/3',
                        text2: 'tbsp',
                      ),
                      BuildTableCell(
                        text1: '1',
                        text2: 'tsp',
                      ),
                      BuildTableCell(
                        text1: '5',
                        text2: 'ml',
                      ),
                    ]),
                  ],
                ),
                Container(
                  width: 300,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.pinkAccent, Colors.deepOrangeAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Weight chart',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: w * 0.05,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Table(
                  border: TableBorder.all(
                      color: Colors.white, style: BorderStyle.solid, width: 2),
                  children: const [
                    TableRow(children: [
                      BuildTableCell(text1: '1000', text2: 'gramm'),
                      BuildTableCell(text1: '1', text2: 'kilogramm'),
                      BuildTableCell(text1: '2.2', text2: 'pound'),
                      BuildTableCell(text1: '35.7', text2: 'ounce'),
                    ])
                  ],
                )
              ],
            ),
          );
        });
  }
}

class BuildTableCell extends StatelessWidget {
  final String text1, text2;
  final String? text3;
  const BuildTableCell(
      {super.key, required this.text1, required this.text2, this.text3});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return TableCell(
        child: Container(
      color: Colors.deepOrangeAccent,
      width: w * 0.3,
      height: h * 0.1,
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text1,
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
          Text(
            text2,
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
          if (text3 != null)
            Text(
              text3!,
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
        ],
      ),
    ));
  }
}
