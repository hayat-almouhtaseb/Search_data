import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:search_pro/services/get_languages_service.dart';

class SearchUiWithBackend extends StatefulWidget {
  const SearchUiWithBackend({super.key});

  @override
  State<SearchUiWithBackend> createState() => _SearchUiWithBackendState();
}

class _SearchUiWithBackendState extends State<SearchUiWithBackend> {
  String lexem = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 40, right: 40, bottom: 10, top: 5),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle:
                      TextStyle(color: Color.fromARGB(255, 194, 33, 140)),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color.fromARGB(255, 194, 33, 140),
                    size: 20,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              onChanged: (value) {
                setState(() {
                  lexem = value;
                });
              },
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: SearchInLanguage(lexem: lexem),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(snapshot.data![index].name),
                      leading: Text(snapshot.data![index].id.toString()),
                      subtitle: Text(snapshot.data![index].languageCode),
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
