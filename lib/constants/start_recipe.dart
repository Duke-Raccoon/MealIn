

import 'package:url_launcher/url_launcher.dart';

class StartRecipe {

  static Future<void> startRecipe(String url)async{
    final recipe=Uri.parse(url);
    if(!await launchUrl(recipe)){
      throw Exception('Could not launch $recipe');
    }
  }
}