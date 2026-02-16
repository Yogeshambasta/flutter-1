// // import 'package:flutter/material.dart';
//
// // class CategoriesScreen extends StatelessWidget {
// //   const CategoriesScreen({super.key});
//
// //   @override
// //   Widget build(BuildContext context) {
// //     final categories = [
// //       "History",
// //       "Finance",
// //       "Sports",
// //       "Travel",
// //       "Entertainment",
// //       "Science"
// //     ];
//
// //     return GridView.builder(
// //       padding: const EdgeInsets.all(16),
// //       itemCount: categories.length,
// //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// //         crossAxisCount: 2,
// //         mainAxisSpacing: 15,
// //         crossAxisSpacing: 15,
// //         childAspectRatio: 1,
// //       ),
// //       itemBuilder: (_, index) {
// //         return Container(
// //           decoration: BoxDecoration(
// //             borderRadius: BorderRadius.circular(20),
// //             image: const DecorationImage(
// //               image: NetworkImage(
// //                 "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee",
// //               ),
// //               fit: BoxFit.cover,
// //             ),
// //           ),
// //           alignment: Alignment.bottomLeft,
// //           padding: const EdgeInsets.all(12),
// //           child: Text(
// //             categories[index],
// //             style: const TextStyle(
// //               color: Colors.white,
// //               fontWeight: FontWeight.bold,
// //               fontSize: 18,
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }
//
//
//
// import 'package:flutter/material.dart';
//
// class CategoriesScreen extends StatelessWidget {
//   const CategoriesScreen({super.key});
//
//   final List<Map<String, String>> categories = const [
//     {
//       "title": "History",
//       "image":
//       "https://images.unsplash.com/photo-1524995997946-a1c2e315a42f"
//     },
//     {
//       "title": "Finance",
//       "image":
//       "https://images.unsplash.com/photo-1559526324-593bc073d938"
//     },
//     {
//       "title": "Sports",
//       "image":
//       "https://images.unsplash.com/photo-1505842465776-3d90f616310d"
//     },
//     {
//       "title": "Travel",
//       "image":
//       "https://images.unsplash.com/photo-1507525428034-b723cf961d3e"
//     },
//     {
//       "title": "Entertainment",
//       "image":
//       "https://images.unsplash.com/photo-1497032205916-ac775f0649ae"
//     },
//     {
//       "title": "Science",
//       "image":
//       "https://images.unsplash.com/photo-1581093588401-22d1a7f1d2e6"
//     },
//     {
//       "title": "Technology",
//       "image":
//       "https://images.unsplash.com/photo-1518770660439-4636190af475"
//     },
//     {
//       "title": "Politics",
//       "image":
//       "https://images.unsplash.com/photo-1529101091764-c3526daf38fe"
//     },
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade100,
//       appBar: AppBar(
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
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: GridView.builder(
//           itemCount: categories.length,
//           gridDelegate:
//           const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             mainAxisSpacing: 16,
//             crossAxisSpacing: 16,
//             childAspectRatio: 0.9,
//           ),
//           itemBuilder: (context, index) {
//             final item = categories[index];
//
//             return ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: Stack(
//                 children: [
//                   Positioned.fill(
//                     child: Image.network(
//                       item["image"]!,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//
//                   // Gradient Overlay
//                   Positioned.fill(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                           colors: [
//                             Colors.transparent,
//                             Colors.black.withOpacity(0.6),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//
//                   // Title
//                   Positioned(
//                     bottom: 16,
//                     left: 16,
//                     child: Text(
//                       item["title"]!,
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  static const List<Map<String, String>> categories = [
    {
      "title": "History",
      "image":
      "https://images.unsplash.com/photo-1524995997946-a1c2e315a42f"
    },
    {
      "title": "Finance",
      "image":
      "https://images.unsplash.com/photo-1559526324-593bc073d938"
    },
    {
      "title": "Sports",
      "image":
      "https://images.unsplash.com/photo-1505842465776-3d90f616310d"
    },
    {
      "title": "Travel",
      "image":
      "https://images.unsplash.com/photo-1507525428034-b723cf961d3e"
    },
    {
      "title": "Entertainment",
      "image":
      "https://images.unsplash.com/photo-1497032205916-ac775f0649ae"
    },
    {
      "title": "Science",
      "image":
      "https://images.unsplash.com/photo-1581093588401-22d1a7f1d2e6"
    },
    {
      "title": "Technology",
      "image":
      "https://images.unsplash.com/photo-1518770660439-4636190af475"
    },
    {
      "title": "Politics",
      "image":
      "https://images.unsplash.com/photo-1529101091764-c3526daf38fe"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        /// Title like sir image
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
              horizontal: 20, vertical: 20),
          color: Colors.white,
          child: const Text(
            "Categories",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        /// Grid
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.builder(
              itemCount: categories.length,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.9,
              ),
              itemBuilder: (context, index) {
                final item = categories[index];

                return ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.network(
                          item["image"]!,
                          fit: BoxFit.cover,
                        ),
                      ),

                      /// Gradient
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.6),
                              ],
                            ),
                          ),
                        ),
                      ),

                      /// Title
                      Positioned(
                        bottom: 16,
                        left: 16,
                        child: Text(
                          item["title"]!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
