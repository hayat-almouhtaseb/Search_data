import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'package:search_pro/pages/search_backend.dart';
import 'package:search_pro/pages/search_local.dart';
import 'package:search_pro/provider/theme_provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool switchvalue = false;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Switch(
              value: switchvalue,
              onChanged: (bool newvalue) {
                switchvalue = newvalue;
                setState(() {
                  provider.ChangeTheme();
                });
              })
        ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  minimumSize: Size(200, 50),
                  backgroundColor: Color.fromARGB(255, 219, 170, 203),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Localsearch();
                    },
                  ));
                },
                child: Text(
                  'Local Search',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
            SizedBox(
              width: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  minimumSize: Size(200, 50),
                  backgroundColor: Color.fromARGB(255, 219, 170, 203),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return SearchUiWithBackend();
                    },
                  ));
                },
                child: Text(
                  'Back_End Search',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}
