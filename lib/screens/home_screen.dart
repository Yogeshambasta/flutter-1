import 'package:flutter/material.dart';
import 'language_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedLanguage = "None";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text("Menu", style: TextStyle(fontSize: 20)),
            ),
            ListTile(
              title: Text("Language"),
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => LanguageScreen(),
                  ),
                );

                if (result != null) {
                  setState(() {
                    selectedLanguage = result;
                  });
                }
              },
            ),
            ListTile(
              title: Text("Contact Us"),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          "Selected Language: $selectedLanguage",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
