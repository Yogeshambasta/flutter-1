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


// import 'package:flutter/material.dart';
// import '../../category/category_detail_screen.dart';
// import '../../../core/services/file_service.dart';
// import 'categories_screen.dart';
// import 'dart:io';
// import 'package:pdfx/pdfx.dart';
//
//
//
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
//   List<PickedFileData> _selectedFiles = [];
//
//
//   /// Pages (No const list issue)
//   List<Widget> get _pages =>
//       [
//         _buildHomeTab(),
//         const Center(child: Text("Videos Page")),
//         const CategoriesScreen(),
//         const Center(child: Text("Profile Page")),
//       ];
//
//   /// Handle File Pick
//   // Future<void> _handlePickFile() async {
//   //   final fileData = await FileService.pickFile();
//   //
//   //   if (fileData != null) {
//   //     setState(() {
//   //       _selectedFileName = fileData.name;
//   //     });
//   //   }
//   // }
//   Future<void> _handlePickFile() async {
//     try {
//       final fileData = await FileService.pickFile();
//
//       if (fileData != null) {
//         setState(() {
//           _selectedFiles.add(fileData); // multiple files
//         });
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("Only PDF files are allowed!"),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
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
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
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
//   /// HOME TAB
//   Widget _buildHomeTab() {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//
//           ///  Search Bar
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
//           ///  Top Story Card
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
//           const SizedBox(height: 40),
//
//           const Text(
//             "Popular News",
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//
//           const SizedBox(height: 100),
//
//           /// Add File Button
//           Center(
//             child: ElevatedButton.icon(
//               onPressed: _handlePickFile,
//               icon: const Icon(Icons.upload_file),
//               label: const Text("Add File"),
//             ),
//           ),
//
//           const SizedBox(height: 10),
//
//           /// Show Selected File Name
//           const SizedBox(height: 20),
//
//           if (_selectedFiles.isNotEmpty)
//             ListView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: _selectedFiles.length,
//               itemBuilder: (context, index) {
//                 final file = _selectedFiles[index];
//
//                 return Container(
//                   margin: const EdgeInsets.symmetric(vertical: 10),
//                   padding: const EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(16),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.2),
//                         blurRadius: 6,
//                       )
//                     ],
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//
//                       /// PDF PREVIEW (FIRST PAGE)
//                       Container(
//                         height: 200,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         clipBehavior: Clip.hardEdge,
//                         child: SfPdfViewer.file(
//                           File(file.path),
//                         ),
//                       ),
//
//                       const SizedBox(height: 10),
//
//                       /// File Name
//                       Text(
//                         file.name,
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//
//                       const SizedBox(height: 5),
//
//                       Text(
//                         "Size: ${(file.size / 1024).toStringAsFixed(2)} KB",
//                         style: const TextStyle(color: Colors.grey),
//                       ),
//
//                       const SizedBox(height: 10),
//
//                       /// Buttons Row
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//
//                           IconButton(
//                             icon: const Icon(Icons.info, color: Colors.blue),
//                             onPressed: () {
//                               showModalBottomSheet(
//                                 context: context,
//                                 builder: (_) {
//                                   return Padding(
//                                     padding: const EdgeInsets.all(16),
//                                     child: Column(
//                                       mainAxisSize: MainAxisSize.min,
//                                       crossAxisAlignment:
//                                       CrossAxisAlignment.start,
//                                       children: [
//                                         Text("File Name: ${file.name}"),
//                                         const SizedBox(height: 10),
//                                         Text(
//                                             "File Size: ${(file.size / 1024).toStringAsFixed(2)} KB"),
//                                         const SizedBox(height: 10),
//                                         Text("Path: ${file.path}"),
//                                       ],
//                                     ),
//                                   );
//                                 },
//                               );
//                             },
//                           ),
//
//                           IconButton(
//                             icon: const Icon(Icons.delete, color: Colors.red),
//                             onPressed: () {
//                               setState(() {
//                                 _selectedFiles.removeAt(index);
//                               });
//                             },
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//
//
//         ],
//       ),
//     );
//   }
// }

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import '../../../core/services/file_service.dart';
import 'categories_screen.dart';
import 'pdf_view_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<PickedFileData> _selectedFiles = [];

  /// Pick File
  Future<void> _handlePickFile() async {
    final fileData = await FileService.pickFile();
    if (fileData == null) return;

    if (!fileData.name.toLowerCase().endsWith('.pdf')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              "You selected the wrong file (Unsupported).\nPlease select PDF file only."),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _selectedFiles.add(fileData);
    });
  }

  /// Generate PDF Thumbnail
  Future<Uint8List?> _renderPdfPreview(String path) async {
    try {
      final document = await PdfDocument.openFile(path);
      final page = await document.getPage(1);

      final pageImage = await page.render(
        width: page.width,
        height: page.height,
        format: PdfPageImageFormat.png,
      );

      await page.close();
      await document.close();

      return pageImage?.bytes;
    } catch (e) {
      return null;
    }
  }

  List<Widget> get _pages => [
    _buildHomeTab(),
    const Center(child: Text("Videos Page")),
    const CategoriesScreen(),
    const Center(child: Text("Profile Page")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "NewsHour",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold),
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

  /// ================= HOME TAB =================
  Widget _buildHomeTab() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Search
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

          /// Top Story
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee",
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 30),

          const Text(
            "Popular News",
            style:
            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          /// Add File Button
          Center(
            child: ElevatedButton.icon(
              onPressed: _handlePickFile,
              icon: const Icon(Icons.upload_file),
              label: const Text("Add File"),
            ),
          ),

          const SizedBox(height: 20),

          /// GRID VIEW (Scrollable)
          Expanded(
            child: _selectedFiles.isEmpty
                ? const Center(
              child: Text(
                "No Files Selected",
                style: TextStyle(color: Colors.grey),
              ),
            )
                : GridView.builder(
              itemCount: _selectedFiles.length,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                final file = _selectedFiles[index];

                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PdfViewScreen(
                            path: file.path,
                            name: file.name,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          /// THUMBNAIL + ICONS
                          Expanded(
                            child: Stack(
                              children: [
                                /// PDF Thumbnail
                                Positioned.fill(
                                  child: ClipRRect(
                                    borderRadius:
                                    const BorderRadius.vertical(
                                      top: Radius.circular(16),
                                    ),
                                    child:
                                    FutureBuilder<Uint8List?>(
                                      future:
                                      _renderPdfPreview(
                                          file.path),
                                      builder:
                                          (context, snapshot) {
                                        if (snapshot
                                            .connectionState ==
                                            ConnectionState
                                                .waiting) {
                                          return const Center(
                                            child:
                                            CircularProgressIndicator(),
                                          );
                                        }

                                        if (!snapshot
                                            .hasData) {
                                          return const Center(
                                            child: Icon(
                                              Icons.picture_as_pdf,
                                              size: 50,
                                              color:
                                              Colors.red,
                                            ),
                                          );
                                        }

                                        return Image.memory(
                                          snapshot.data!,
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    ),
                                  ),
                                ),

                            /// Delete
                            Positioned(
                              top: 6,
                              left: 6,
                              child: IconButton(
                                icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size: 18),
                                onPressed: () {
                                  setState(() {
                                    _selectedFiles
                                        .removeAt(
                                        index);
                                  });
                                },
                              ),
                            ),

                            /// Info
                            Positioned(
                              top: 6,
                              right: 6,
                              child: IconButton(
                                icon: const Icon(
                                    Icons.info_outline,
                                    color: Colors.blue,
                                    size: 18),
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    shape:
                                    const RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius
                                          .vertical(
                                        top: Radius
                                            .circular(
                                            20),
                                      ),
                                    ),
                                    builder: (_) {
                                      return Padding(
                                        padding:
                                        const EdgeInsets
                                            .all(20),
                                        child: Column(
                                          mainAxisSize:
                                          MainAxisSize
                                              .min,
                                          crossAxisAlignment:
                                          CrossAxisAlignment
                                              .start,
                                          children: [
                                            const Text(
                                              "PDF Details",
                                              style:
                                              TextStyle(
                                                fontSize:
                                                18,
                                                fontWeight:
                                                FontWeight
                                                    .bold,
                                              ),
                                            ),
                                            const SizedBox(
                                                height:
                                                15),
                                            Text(
                                                "Name: ${file.name}"),
                                            Text(
                                                "Size: ${(file.size / 1024).toStringAsFixed(2)} KB"),
                                            Text(
                                                "Path: ${file.path}"),
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
                      ),

                      /// File Name
                      Padding(
                        padding:
                        const EdgeInsets.all(8),
                        child: Text(
                          file.name,
                          maxLines: 1,
                          overflow:
                          TextOverflow.ellipsis,
                          textAlign:
                          TextAlign.center,
                          style: const TextStyle(
                              fontWeight:
                              FontWeight.w600,
                              fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                    ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
