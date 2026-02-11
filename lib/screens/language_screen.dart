// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class LanguageScreen extends StatefulWidget {
//   @override
//   _LanguageScreenState createState() => _LanguageScreenState();
// }

// class _LanguageScreenState extends State<LanguageScreen> {
//   List<String> languages = [
//     "English",
//     "Hindi",
//     "Urdu",
//     "French",
//     "Spanish"
//   ];

//   List<String> filteredList = [];

//   @override
//   void initState() {
//     super.initState();
//     filteredList = languages;
//   }

//   Future<void> saveLanguage(String lang) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString("language", lang);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Select Language")),
//       body: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.all(8),
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: "Search language",
//                 border: OutlineInputBorder(),
//               ),
//               onChanged: (value) {
//                 setState(() {
//                   filteredList = languages
//                       .where((e) =>
//                           e.toLowerCase().contains(value.toLowerCase()))
//                       .toList();
//                 });
//               },
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: filteredList.length,
//               itemBuilder: (_, index) {
//                 return ListTile(
//                   title: Text(filteredList[index]),
//                   onTap: () async {
//                     await saveLanguage(filteredList[index]);

//                     showDialog(
//                       context: context,
//                       builder: (_) => AlertDialog(
//                         title: Text("Language"),
//                         content: Text(
//                           "You have selected ${filteredList[index]}",
//                         ),
//                         actions: [
//                           TextButton(
//                             onPressed: () {
//                               Navigator.pop(context); // dialog
//                               Navigator.pop(
//                                   context, filteredList[index]); // screen
//                             },
//                             child: Text("OK"),
//                           )
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import '../core/utils/app_preferences.dart';

class LanguageScreen extends StatefulWidget {
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  List<String> languages = [
    "English",
    "Hindi",
    "Urdu",
    "French",
    "Spanish"
  ];

  List<String> filteredList = [];

  @override
  void initState() {
    super.initState();
    filteredList = languages;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Language")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search language",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  filteredList = languages
                      .where((e) =>
                          e.toLowerCase().contains(value.toLowerCase()))
                      .toList();
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (_, index) {
                return ListTile(
                  title: Text(filteredList[index]),
                  onTap: () async {

                    //  SAVE using UTIL class
                    await AppPreferences.setLanguage(
                        filteredList[index]);

                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text("Language"),
                        content: Text(
                          "You have selected ${filteredList[index]}",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // dialog
                              Navigator.pop(
                                  context, filteredList[index]); // screen
                            },
                            child: Text("OK"),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
