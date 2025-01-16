import 'package:flutter/cupertino.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final w= MediaQuery.of(context).size.width;
    return Row(
      children: [
        Text('What are you\ncooking today?',style: TextStyle(
          fontSize: w*0.06,
          height: 1,
          fontWeight: FontWeight.bold
        ),),
        const Spacer()
      ],
    );
  }
}