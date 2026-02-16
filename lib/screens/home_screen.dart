// // import 'package:flutter/material.dart';
// // import 'language_screen.dart'; // existing language screen
// //
// // class NewsHomeScreen extends StatefulWidget {
// //   const NewsHomeScreen({super.key});
// //
// //   @override
// //   State<NewsHomeScreen> createState() => _NewsHomeScreenState();
// // }
// //
// // class _NewsHomeScreenState extends State<NewsHomeScreen> {
// //
// //   int _currentIndex = 0;
// //
// //   final List<Widget> _pages = const [
// //     _HomeTab(),
// //     Center(child: Text("Videos Page")),
// //     CategoriesScreen(),
// //     Center(child: Text("Profile Page")),
// //   ];
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return DefaultTabController(
// //       length: 3,
// //       child: Scaffold(
// //         drawer: _buildDrawer(),
// //         backgroundColor: Colors.grey.shade100,
// //
// //         appBar: AppBar(
// //           backgroundColor: Colors.white,
// //           elevation: 0,
// //           centerTitle: true,
// //           iconTheme: const IconThemeData(color: Colors.black),
// //           title: const Text(
// //             "NewsHour",
// //             style: TextStyle(
// //                 color: Colors.black,
// //                 fontWeight: FontWeight.bold),
// //           ),
// //           actions: [
// //             IconButton(
// //               icon: const Icon(Icons.search),
// //               onPressed: () {
// //                 ScaffoldMessenger.of(context).showSnackBar(
// //                   const SnackBar(content: Text("Search Clicked")),
// //                 );
// //               },
// //             ),
// //             IconButton(
// //               icon: const Icon(Icons.notifications_none),
// //               onPressed: () {
// //                 ScaffoldMessenger.of(context).showSnackBar(
// //                   const SnackBar(content: Text("Notifications Clicked")),
// //                 );
// //               },
// //             ),
// //           ],
// //         ),
// //
// //         body: _pages[_currentIndex],
// //
// //         bottomNavigationBar: BottomNavigationBar(
// //           currentIndex: _currentIndex,
// //           selectedItemColor: Colors.blue,
// //           unselectedItemColor: Colors.grey,
// //           type: BottomNavigationBarType.fixed,
// //           onTap: (index) {
// //             setState(() {
// //               _currentIndex = index;
// //             });
// //           },
// //           items: const [
// //             BottomNavigationBarItem(
// //                 icon: Icon(Icons.home_outlined), label: "Home"),
// //             BottomNavigationBarItem(
// //                 icon: Icon(Icons.play_circle_outline), label: "Videos"),
// //             BottomNavigationBarItem(
// //                 icon: Icon(Icons.grid_view), label: "Categories"),
// //             BottomNavigationBarItem(
// //                 icon: Icon(Icons.person_outline), label: "Profile"),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Drawer _buildDrawer() {
// //     return Drawer(
// //       child: ListView(
// //         children: [
// //           const DrawerHeader(
// //             child: Text("Menu"),
// //           ),
// //           ListTile(
// //             leading: const Icon(Icons.language),
// //             title: const Text("Select Language"),
// //             onTap: () {
// //               Navigator.push(
// //                 context,
// //                 MaterialPageRoute(
// //                     builder: (_) => LanguageScreen()),
// //               );
// //             },
// //           ),
// //           ListTile(
// //             leading: const Icon(Icons.grid_view),
// //             title: const Text("Categories"),
// //             onTap: () {
// //               setState(() {
// //                 _currentIndex = 2;
// //               });
// //               Navigator.pop(context);
// //             },
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
//
//
// import 'package:flutter/material.dart';
// import 'language_screen.dart';
//
// class NewsHomeScreen extends StatefulWidget {
//   const NewsHomeScreen({super.key});
//
//   @override
//   State<NewsHomeScreen> createState() => _NewsHomeScreenState();
// }
//
// class _NewsHomeScreenState extends State<NewsHomeScreen> {
//   int _currentIndex = 0;
//
//   final List<Widget> _pages = [
//     const _HomeTab(),
//     const Center(child: Text("Videos Page")),
//     const CategoriesScreen(),
//     const Center(child: Text("Profile Page")),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: _buildDrawer(),
//       backgroundColor: Colors.grey.shade100,
//
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         centerTitle: true,
//         iconTheme: const IconThemeData(color: Colors.black),
//         title: const Text(
//           "NewsHour",
//           style: TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.bold),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.search),
//             onPressed: () {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(content: Text("Search Clicked")),
//               );
//             },
//           ),
//           IconButton(
//             icon: const Icon(Icons.notifications_none),
//             onPressed: () {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(content: Text("Notifications Clicked")),
//               );
//             },
//           ),
//         ],
//       ),
//
//       body: _pages[_currentIndex],
//
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         selectedItemColor: Colors.blue,
//         unselectedItemColor: Colors.grey,
//         type: BottomNavigationBarType.fixed,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         items: const [
//           BottomNavigationBarItem(
//               icon: Icon(Icons.home_outlined), label: "Home"),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.play_circle_outline), label: "Videos"),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.grid_view), label: "Categories"),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.person_outline), label: "Profile"),
//         ],
//       ),
//     );
//   }
//
//   Drawer _buildDrawer() {
//     return Drawer(
//       child: ListView(
//         children: [
//           const DrawerHeader(
//             child: Text(
//               "Menu",
//               style: TextStyle(fontSize: 20),
//             ),
//           ),
//           ListTile(
//             leading: const Icon(Icons.language),
//             title: const Text("Select Language"),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (_) => LanguageScreen(),
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
// ////////////////////////////////////////////////////////
// /// HOME TAB
// ////////////////////////////////////////////////////////
//
// class _HomeTab extends StatelessWidget {
//   const _HomeTab();
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//
//           /// SEARCH FIELD
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
//           /// TOP STORY CARD
//           ClipRRect(
//             borderRadius: BorderRadius.circular(20),
//             child: Stack(
//               children: [
//                 Image.network(
//                   "https://images.unsplash.com/photo-1517430816045-df4b7de11d1d",
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
//                         color: Colors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           const SizedBox(height: 20),
//
//           /// POPULAR NEWS TITLE
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: const [
//               Text(
//                 "Popular News",
//                 style:
//                 TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 "view all",
//                 style: TextStyle(color: Colors.blue),
//               )
//             ],
//           ),
//
//           const SizedBox(height: 15),
//
//           /// POPULAR CARD
//           Container(
//             padding: const EdgeInsets.all(15),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Row(
//               children: [
//                 const Expanded(
//                   child: Column(
//                     crossAxisAlignment:
//                     CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Celebrity Style: Red Carpet Looks to Inspire Your Wardrobe",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 15),
//                       ),
//                       SizedBox(height: 10),
//                       Text("07 July 2024"),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(12),
//                   child: Image.network(
//                     "https://images.unsplash.com/photo-1492724441997-5dc865305da7",
//                     height: 80,
//                     width: 80,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// ////////////////////////////////////////////////////////
// /// CATEGORIES SCREEN
// ////////////////////////////////////////////////////////
//
// class CategoriesScreen extends StatelessWidget {
//   const CategoriesScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final categories = [
//       "History",
//       "Finance",
//       "Sports",
//       "Travel",
//       "Entertainment",
//       "Science",
//     ];
//
//     return GridView.builder(
//       padding: const EdgeInsets.all(16),
//       itemCount: categories.length,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         crossAxisSpacing: 15,
//         mainAxisSpacing: 15,
//         childAspectRatio: 1,
//       ),
//       itemBuilder: (context, index) {
//         return Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             color: Colors.blue.shade100,
//           ),
//           child: Center(
//             child: Text(
//               categories[index],
//               style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }




// import 'package:flutter/material.dart';
// import 'language_screen.dart';
//
// class NewsHomeScreen extends StatefulWidget {
//   const NewsHomeScreen({super.key});
//
//   @override
//   State<NewsHomeScreen> createState() => _NewsHomeScreenState();
// }
//
// class _NewsHomeScreenState extends State<NewsHomeScreen> {
//
//   int _currentIndex = 0;
//
//   final List<String> _tabs = const [
//     "Explore",
//     "Entertainment",
//     "Technology",
//     "Sports",
//     "Business",
//     "Health",
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: _tabs.length,
//       child: Scaffold(
//         drawer: _buildDrawer(),
//         backgroundColor: Colors.grey.shade100,
//
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           centerTitle: true,
//           iconTheme: const IconThemeData(color: Colors.black),
//           title: RichText(
//             text: const TextSpan(
//               children: [
//                 TextSpan(
//                   text: "News",
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20),
//                 ),
//                 TextSpan(
//                   text: "Hour",
//                   style: TextStyle(
//                       color: Colors.orange,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20),
//                 ),
//               ],
//             ),
//           ),
//           actions: [
//             IconButton(
//               icon: const Icon(Icons.search),
//               onPressed: () {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text("Search Clicked")),
//                 );
//               },
//             ),
//             IconButton(
//               icon: const Icon(Icons.notifications_none),
//               onPressed: () {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text("Notifications Clicked")),
//                 );
//               },
//             ),
//           ],
//           bottom: TabBar(
//             isScrollable: true,
//             indicatorColor: Colors.blue,
//             labelColor: Colors.black,
//             unselectedLabelColor: Colors.grey,
//             tabs: _tabs.map((e) => Tab(text: e)).toList(),
//           ),
//         ),
//
//         body: TabBarView(
//           children: _tabs.map((e) => const _HomeTab()).toList(),
//         ),
//
//         bottomNavigationBar: BottomNavigationBar(
//           currentIndex: _currentIndex,
//           selectedItemColor: Colors.blue,
//           unselectedItemColor: Colors.grey,
//           type: BottomNavigationBarType.fixed,
//           onTap: (index) {
//             setState(() {
//               _currentIndex = index;
//             });
//           },
//           items: const [
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.home_outlined), label: "Home"),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.play_circle_outline), label: "Videos"),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.grid_view), label: "Categories"),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.person_outline), label: "Profile"),
//           ],
//         ),
//       ),
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
//                     builder: (_) => LanguageScreen()),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class _HomeTab extends StatelessWidget {
//   const _HomeTab();
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//
//           /// SEARCH BAR
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
//           /// TOP STORY
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
//                 Container(
//                   height: 220,
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                       colors: [
//                         Colors.transparent,
//                         Colors.black.withOpacity(0.7),
//                       ],
//                     ),
//                   ),
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
//                 Positioned(
//                   bottom: 20,
//                   left: 20,
//                   right: 20,
//                   child: const Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Top 10 Lifestyle Trends to Watch in 2024",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(height: 6),
//                       Row(
//                         children: [
//                           Icon(Icons.access_time,
//                               color: Colors.white70, size: 14),
//                           SizedBox(width: 5),
//                           Text(
//                             "07 July 2024",
//                             style: TextStyle(
//                                 color: Colors.white70, fontSize: 12),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           const SizedBox(height: 25),
//
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: const [
//               Text(
//                 "Popular News",
//                 style:
//                 TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 "view all",
//                 style: TextStyle(color: Colors.blue),
//               )
//             ],
//           ),
//
//           const SizedBox(height: 15),
//
//           Container(
//             padding: const EdgeInsets.all(15),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment:
//                     CrossAxisAlignment.start,
//                     children: const [
//                       Text(
//                         "Celebrity Style: Red Carpet Looks to Inspire Your Wardrobe",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 15),
//                       ),
//                       SizedBox(height: 10),
//                       Row(
//                         children: [
//                           Icon(Icons.access_time,
//                               size: 14, color: Colors.grey),
//                           SizedBox(width: 5),
//                           Text("07 July 2024",
//                               style: TextStyle(fontSize: 12))
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(12),
//                   child: Image.network(
//                     "https://images.unsplash.com/photo-1492724441997-5dc865305da7",
//                     height: 80,
//                     width: 80,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'language_screen.dart';
import '../features/home/screens/categories_screen.dart';
import '../core/widgets/banner_ad_widget.dart';

class NewsHomeScreen extends StatefulWidget {
  const NewsHomeScreen({super.key});

  @override
  State<NewsHomeScreen> createState() => _NewsHomeScreenState();
}

class _NewsHomeScreenState extends State<NewsHomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomeTab(),
    Center(child: Text("Videos Page")),
    CategoriesScreen(),
    Center(child: Text("Profile Page")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(),
      backgroundColor: Colors.grey.shade100,

      /// Dynamic AppBar
      appBar: _buildAppBar(),

      /// Body
      body: _pages[_currentIndex],

      /// Bottom Navigation + Banner Ad
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BannerAdWidget(), // 👈 Ad Here
          BottomNavigationBar(
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
        ],
      ),
    );
  }

  /// AppBar Builder (Clean Code)
  PreferredSizeWidget _buildAppBar() {
    if (_currentIndex == 2) {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Categories",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    return AppBar(
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
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Search Clicked")),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.notifications_none),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Notifications Clicked")),
            );
          },
        ),
      ],
    );
  }

  /// Drawer Builder
  Drawer _buildDrawer() {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Text("Menu"),
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text("Select Language"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => LanguageScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.grid_view),
            title: const Text("Categories"),
            onTap: () {
              setState(() {
                _currentIndex = 2;
              });
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

/// ================= HOME TAB =================

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Search Bar
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

          /// Top Story Card
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

          const SizedBox(height: 20),

          const Text(
            "Popular News",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
