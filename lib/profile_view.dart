import 'package:flutter/material.dart';
import 'dart:convert';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Article Viewer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ArticleListPage(),
    );
  }
}

class ArticleListPage extends StatefulWidget {
  @override
  _ArticleListPageState createState() => _ArticleListPageState();
}

class _ArticleListPageState extends State<ArticleListPage> {
  List<Article> articles = [];
  bool loading = false;
  
  get http => null;

  @override
  void initState() {
    super.initState();
    fetchArticles();
  }

  Future<void> fetchArticles() async {
    setState(() {
      loading = true;
    });
    try {
      final response = await http.get(Uri.parse('https://api.example.com/articles'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          articles = List<Article>.from(data.map((model) => Article.fromJson(model)));
          loading = false;
        });
      } else {
        throw Exception('Failed to load articles');
      }
    } catch (e) {
      setState(() {
        loading = false;
      });
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Article List'),
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(articles[index].title),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ArticleDetailPage(article: articles[index]),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}

class ArticleDetailPage extends StatelessWidget {
  final Article article;

  ArticleDetailPage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(article.content),
      ),
    );
  }
}

class Article {
  final String title;
  final String content;

  Article({required this.title, required this.content});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'],
      content: json['content'],
    );
  }
}