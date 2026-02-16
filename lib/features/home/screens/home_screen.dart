import 'package:flutter/material.dart';
import '../models/news_model.dart';
import '../widgets/news_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<NewsModel> exploreNews = [
    NewsModel(
      title: "Top 10 Lifestyle Trends to Watch in 2024",
      imageUrl:
          "https://images.unsplash.com/photo-1518609878373-06d740f60d8b",
      category: "Lifestyle",
      date: "07 July 2024",
    ),
  ];

  final List<NewsModel> techNews = [
    NewsModel(
      title: "AI is Transforming the Future",
      imageUrl:
          "https://images.unsplash.com/photo-1518770660439-4636190af475",
      category: "Technology",
      date: "10 July 2024",
    ),
  ];

  final List<NewsModel> entertainmentNews = [
    NewsModel(
      title: "Celebrity Style Trends This Year",
      imageUrl:
          "https://images.unsplash.com/photo-1497032205916-ac775f0649ae",
      category: "Entertainment",
      date: "12 July 2024",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("NewsHour"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Explore"),
              Tab(text: "Technology"),
              Tab(text: "Entertainment"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildList(exploreNews),
            _buildList(techNews),
            _buildList(entertainmentNews),
          ],
        ),
      ),
    );
  }

  Widget _buildList(List<NewsModel> newsList) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: newsList.length,
      itemBuilder: (context, index) {
        return NewsCard(news: newsList[index]);
      },
    );
  }
}
