import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:search_pro/pages/search_backend.dart';
import 'package:search_pro/pages/search_local.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
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
