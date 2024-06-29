import 'package:dio/dio.dart';

import 'package:search_pro/models/languages_model.dart';

Future<List<LanguagesModel>> GetLanguage() async {
  Dio dio = Dio();
  Response response = await dio.get('https://freetestapi.com/api/v1/languages');
  if (response.statusCode == 200) {
    List<LanguagesModel> language = [];
    for (var i = 0; i < response.data.length; i++) {
      LanguagesModel languagesModel = LanguagesModel.fromMap(response.data[i]);
      language.add(languagesModel);
    }
    return language;
  } else {
    print("nooo");
    return [];
  }
}

Future<List<LanguagesModel>> SearchInLanguage({String lexem = ''}) async {
  Dio dio = Dio();
  Response response =
      await dio.get("https://freetestapi.com/api/v1/languages?search=${lexem}");
  if (response.statusCode == 200) {
    List<LanguagesModel> language = [];
    for (var i = 0; i < response.data.length; i++) {
      LanguagesModel languagesModel = LanguagesModel.fromMap(response.data[i]);
      language.add(languagesModel);
    }
    return language;
  } else {
    return [];
  }
}
