// import 'package:flutter/material.dart';
// import 'language_screen.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   String selectedLanguage = "None";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Home")),
//       drawer: Drawer(
//         child: ListView(
//           children: [
//             DrawerHeader(
//               child: Text("Menu", style: TextStyle(fontSize: 20)),
//             ),
//             ListTile(
//               title: Text("Language"),
//               onTap: () async {
//                 final result = await Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (_) => LanguageScreen(),
//                   ),
//                 );

//                 if (result != null) {
//                   setState(() {
//                     selectedLanguage = result;
//                   });
//                 }
//               },
//             ),
//             ListTile(
//               title: Text("Contact Us"),
//             ),
//           ],
//         ),
//       ),
//       body: Center(
//         child: Text(
//           "Selected Language: $selectedLanguage",
//           style: TextStyle(fontSize: 18),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import '../core/utils/app_preferences.dart';
import '../core/widgets/my_button.dart';
import 'language_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedLanguage = "None";

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();

  String output = "";

  @override
  void initState() {
    super.initState();
    loadLanguage();
  }

  Future<void> loadLanguage() async {
    final lang = await AppPreferences.getLanguage();
    setState(() {
      selectedLanguage = lang ?? "None";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text("Menu")),
            ListTile(
              title: Text("Language"),
              onTap: () async {
                Navigator.pop(context);
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => LanguageScreen()),
                );
                if (result != null) {
                  setState(() {
                    selectedLanguage = result;
                  });
                }
              },
            ),
          ],
        ),
      ),

      
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text("Selected Language: $selectedLanguage"),
              SizedBox(height: 20),

              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Enter Name (String)",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),

              TextField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Enter Age (Int)",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),

              TextField(
                controller: salaryController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Enter Salary (Double)",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

              ///  Reusable Button – SAVE
              MyButton(
                text: "Save to SharedPreferences",
                onPressed: () async {
                  await AppPreferences.setName(nameController.text);
                  await AppPreferences.setAge(
                      int.parse(ageController.text));
                  await AppPreferences.setSalary(
                      double.parse(salaryController.text));

                  setState(() {
                    output = "Data Saved Successfully";
                  });
                },
              ),

              SizedBox(height: 10),

              ///  Same Button class – GET
              MyButton(
                text: "Get from SharedPreferences",
                color: Colors.green,
                onPressed: () async {
                  final name = await AppPreferences.getName();
                  final age = await AppPreferences.getAge();
                  final salary = await AppPreferences.getSalary();

                  setState(() {
                    output =
                        "Name: $name\nAge: $age\nSalary: $salary";
                  });
                },
              ),

              SizedBox(height: 20),
              Text(
                output,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
