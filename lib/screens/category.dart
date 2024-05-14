import 'package:eazr_assignment/apiservice/apiservice.dart';
import 'package:eazr_assignment/screens/article.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  final String category;

  const CategoryScreen({super.key, required this.category});

  @override
  // ignore: library_private_types_in_public_api
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Article> articles = [];
  bool isLoading = false;
  int page = 1;

  NewsService newsService = NewsService();

  @override
  void initState() {
    super.initState();
    fetchArticles();
  }

  void fetchArticles() async {
    setState(() {
      isLoading = true;
    });

    try {
      List<Article> fetchedArticles = await newsService.getArticlesByCategory(
        widget.category,
      );
      setState(() {
        articles.addAll(fetchedArticles);
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching articles: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.toUpperCase()),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                Article article = articles[index];
                return Card(
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (article.imageUrl.isNotEmpty)
                          Image.network(
                            article.imageUrl,
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            article.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Text(article.description),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ArticleScreen(articleUrl: article.url),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          if (isLoading)
            const SizedBox(
              height: 600,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
