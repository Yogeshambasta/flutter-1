// import 'package:flutter/material.dart';
// import '../models/news_model.dart';
// import '../widgets/news_card.dart';
//
// class HomeScreen extends StatelessWidget {
//   HomeScreen({super.key});
//
//   final List<NewsModel> exploreNews = [
//     NewsModel(
//       title: "Top 10 Lifestyle Trends to Watch in 2024",
//       imageUrl:
//           "https://images.unsplash.com/photo-1518609878373-06d740f60d8b",
//       category: "Lifestyle",
//       date: "07 July 2024",
//     ),
//   ];
//
//   final List<NewsModel> techNews = [
//     NewsModel(
//       title: "AI is Transforming the Future",
//       imageUrl:
//           "https://images.unsplash.com/photo-1518770660439-4636190af475",
//       category: "Technology",
//       date: "10 July 2024",
//     ),
//   ];
//
//   final List<NewsModel> entertainmentNews = [
//     NewsModel(
//       title: "Celebrity Style Trends This Year",
//       imageUrl:
//           "https://images.unsplash.com/photo-1497032205916-ac775f0649ae",
//       category: "Entertainment",
//       date: "12 July 2024",
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text("NewsHour"),
//           bottom: const TabBar(
//             tabs: [
//               Tab(text: "Explore"),
//               Tab(text: "Technology"),
//               Tab(text: "Entertainment"),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             _buildList(exploreNews),
//             _buildList(techNews),
//             _buildList(entertainmentNews),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildList(List<NewsModel> newsList) {
//     return ListView.builder(
//       padding: const EdgeInsets.all(12),
//       itemCount: newsList.length,
//       itemBuilder: (context, index) {
//         return NewsCard(news: newsList[index]);
//       },
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import '../models/news_model.dart';
// import '../widgets/news_card.dart';
// import '../../../core/services/file_service.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//
//   String? _selectedFileName;
//
//   final List<NewsModel> exploreNews = [
//     NewsModel(
//       title: "Top 10 Lifestyle Trends to Watch in 2024",
//       imageUrl:
//       "https://images.unsplash.com/photo-1518609878373-06d740f60d8b",
//       category: "Lifestyle",
//       date: "07 July 2024",
//     ),
//   ];
//
//   final List<NewsModel> techNews = [
//     NewsModel(
//       title: "AI is Transforming the Future",
//       imageUrl:
//       "https://images.unsplash.com/photo-1518770660439-4636190af475",
//       category: "Technology",
//       date: "10 July 2024",
//     ),
//   ];
//
//   final List<NewsModel> entertainmentNews = [
//     NewsModel(
//       title: "Celebrity Style Trends This Year",
//       imageUrl:
//       "https://images.unsplash.com/photo-1497032205916-ac775f0649ae",
//       category: "Entertainment",
//       date: "12 July 2024",
//     ),
//   ];
//
//   Future<void> _handleFilePick() async {
//     final result = await FileService.pickFile();
//
//     if (result != null) {
//       setState(() {
//         _selectedFileName = result["fileName"];
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text("NewsHour"),
//           bottom: const TabBar(
//             tabs: [
//               Tab(text: "Explore"),
//               Tab(text: "Technology"),
//               Tab(text: "Entertainment"),
//             ],
//           ),
//         ),
//         body: Column(
//           children: [
//
//             /// 🔹 Add File Button
//             Padding(
//               padding: const EdgeInsets.all(12),
//               child: ElevatedButton(
//                 onPressed: _handleFilePick,
//                 child: const Text("Add File"),
//               ),
//             ),
//
//             /// 🔹 Show Selected File Name
//             if (_selectedFileName != null)
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 12),
//                 child: Text(
//                   "Selected File: $_selectedFileName",
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//
//             const SizedBox(height: 10),
//
//             /// 🔹 Tab Content
//             Expanded(
//               child: TabBarView(
//                 children: [
//                   _buildList(exploreNews),
//                   _buildList(techNews),
//                   _buildList(entertainmentNews),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildList(List<NewsModel> newsList) {
//     return ListView.builder(
//       padding: const EdgeInsets.all(12),
//       itemCount: newsList.length,
//       itemBuilder: (context, index) {
//         return NewsCard(news: newsList[index]);
//       },
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import '../../../core/widgets/banner_ad_widget.dart';
// import '../../../core/services/file_service.dart';
// import '../../category/screens/categories_screen.dart';
// import '../../../screens/language_screen.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   int _currentIndex = 0;
//
//   final List<Widget> _pages = const [
//     HomeTab(),
//     Center(child: Text("Videos Page")),
//     CategoriesScreen(),
//     Center(child: Text("Profile Page")),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: _buildDrawer(),
//       backgroundColor: Colors.grey.shade100,
//       appBar: _buildAppBar(),
//       body: _pages[_currentIndex],
//
//       bottomNavigationBar: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const BannerAdWidget(),
//           BottomNavigationBar(
//             currentIndex: _currentIndex,
//             selectedItemColor: Colors.blue,
//             unselectedItemColor: Colors.grey,
//             type: BottomNavigationBarType.fixed,
//             onTap: (index) {
//               setState(() {
//                 _currentIndex = index;
//               });
//             },
//             items: const [
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.home_outlined), label: "Home"),
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.play_circle_outline), label: "Videos"),
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.grid_view), label: "Categories"),
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.person_outline), label: "Profile"),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   PreferredSizeWidget _buildAppBar() {
//     if (_currentIndex == 2) {
//       return AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         iconTheme: const IconThemeData(color: Colors.black),
//         title: const Text(
//           "Categories",
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       );
//     }
//
//     return AppBar(
//       backgroundColor: Colors.white,
//       elevation: 0,
//       centerTitle: true,
//       iconTheme: const IconThemeData(color: Colors.black),
//       title: const Text(
//         "NewsHour",
//         style: TextStyle(
//           color: Colors.black,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       actions: [
//         IconButton(
//           icon: const Icon(Icons.search),
//           onPressed: () {},
//         ),
//         IconButton(
//           icon: const Icon(Icons.notifications_none),
//           onPressed: () {},
//         ),
//       ],
//     );
//   }
//
//   Drawer _buildDrawer() {
//     return Drawer(
//       child: ListView(
//         children: [
//           const DrawerHeader(
//             child: Text("Menu"),
//           ),
//           ListTile(
//             leading: const Icon(Icons.language),
//             title: const Text("Select Language"),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (_) => const LanguageScreen(),
//                 ),
//               );
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.grid_view),
//             title: const Text("Categories"),
//             onTap: () {
//               setState(() {
//                 _currentIndex = 2;
//               });
//               Navigator.pop(context);
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// /// ================= HOME TAB =================
//
// class HomeTab extends StatefulWidget {
//   const HomeTab({super.key});
//
//   @override
//   State<HomeTab> createState() => _HomeTabState();
// }
//
// class _HomeTabState extends State<HomeTab> {
//   String? _selectedFileName;
//
//   Future<void> _handlePickFile() async {
//     final fileData = await FileService.pickFile();
//
//     if (fileData != null) {
//       setState(() {
//         _selectedFileName = fileData["fileName"];
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//
//           /// Add File Button
//           ElevatedButton.icon(
//             onPressed: _handlePickFile,
//             icon: const Icon(Icons.upload_file),
//             label: const Text("Add File"),
//           ),
//
//           const SizedBox(height: 10),
//
//           /// Show Selected File Name
//           if (_selectedFileName != null)
//             Text(
//               "Selected File: $_selectedFileName",
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: Colors.blue,
//               ),
//             ),
//
//           const SizedBox(height: 20),
//
//           /// Search Bar
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(30),
//             ),
//             child: const TextField(
//               decoration: InputDecoration(
//                 hintText: "Search News",
//                 prefixIcon: Icon(Icons.search),
//                 border: InputBorder.none,
//                 contentPadding:
//                 EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//               ),
//             ),
//           ),
//
//           const SizedBox(height: 20),
//
//           /// Top Story Card
//           ClipRRect(
//             borderRadius: BorderRadius.circular(20),
//             child: Stack(
//               children: [
//                 Image.network(
//                   "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee",
//                   height: 220,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//                 Positioned(
//                   top: 15,
//                   left: 15,
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 12, vertical: 6),
//                     decoration: BoxDecoration(
//                       color: Colors.blue,
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: const Text(
//                       "Top Story",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ),
//                 const Positioned(
//                   bottom: 20,
//                   left: 20,
//                   right: 20,
//                   child: Text(
//                     "Top 10 Lifestyle Trends to Watch in 2024",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           const SizedBox(height: 20),
//
//           const Text(
//             "Popular News",
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//


import 'package:flutter/material.dart';
import '../../category/category_detail_screen.dart';
import '../../../core/services/file_service.dart';
import 'categories_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  String? _selectedFileName;

  /// Pages (No const list issue)
  List<Widget> get _pages =>
      [
        _buildHomeTab(),
        const Center(child: Text("Videos Page")),
        const CategoriesScreen(),
        const Center(child: Text("Profile Page")),
      ];

  /// Handle File Pick
  Future<void> _handlePickFile() async {
    final fileData = await FileService.pickFile();

    if (fileData != null) {
      setState(() {
        _selectedFileName = fileData.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "NewsHour",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: _pages[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.play_circle_outline), label: "Videos"),
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_view), label: "Categories"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: "Profile"),
        ],
      ),
    );
  }

  /// HOME TAB
  Widget _buildHomeTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          ///  Search Bar
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: "Search News",
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
                contentPadding:
                EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
            ),
          ),

          const SizedBox(height: 20),

          ///  Top Story Card
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.network(
                  "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee",
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 15,
                  left: 15,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "Top Story",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Text(
                    "Top 10 Lifestyle Trends to Watch in 2024",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),

          const Text(
            "Popular News",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 200),

          /// Add File Button
          Center(
            child: ElevatedButton.icon(
              onPressed: _handlePickFile,
              icon: const Icon(Icons.upload_file),
              label: const Text("Add File"),
            ),
          ),

          const SizedBox(height: 10),

          /// Show Selected File Name
          if (_selectedFileName != null)
            Center(
              child: Text(
                "Selected File: $_selectedFileName",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),


        ],
      ),
    );
  }
}
