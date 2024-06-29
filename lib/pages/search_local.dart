import 'package:flutter/material.dart';

import 'package:search_pro/models/languages_model.dart';
import 'package:search_pro/services/get_languages_service.dart';

class Localsearch extends StatelessWidget {
  List<LanguagesModel> searchResult = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: GetLanguage(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            searchResult = snapshot.data!;
            return StatefulBuilder(builder: (context, setstate) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 40, right: 40, bottom: 10, top: 5),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(
                              color: Color.fromARGB(255, 194, 33, 140)),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color.fromARGB(255, 194, 33, 140),
                            size: 20,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onChanged: (value) {
                        searchResult = [];
                        setstate(() {
                          snapshot.data!.forEach((element) {
                            if (element.name.contains(value)) {
                              searchResult.add(element);
                            }
                          });
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: searchResult!.length,
                      itemBuilder: (context, index) => ListTile(
                        title: Text(searchResult![index].name),
                        leading: Text(searchResult![index].id.toString()),
                        subtitle: Text(searchResult![index].languageCode),
                      ),
                    ),
                  ),
                ],
              );
            });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
