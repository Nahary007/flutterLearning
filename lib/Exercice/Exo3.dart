import 'package:flutter/material.dart';

class Article {
  final String title;
  final String highlightedWord;
  final String imagePath;
  bool isLiked;

  Article({
    required this.title,
    required this.highlightedWord,
    required this.imagePath,
    this.isLiked = false,
  });
}

class Exo3 extends StatefulWidget {
  const Exo3({super.key});

  @override
  _ArticleListPageState createState() => _ArticleListPageState();
}

class _ArticleListPageState extends State<Exo3> {
  final List<Article> articles = [
    Article(title: 'Découvrez la culture Malagasy', highlightedWord: 'culture', imagePath: 'assets/images/article.jpeg'),
    Article(title: 'Voyage à travers les traditions', highlightedWord: 'traditions', imagePath: 'assets/images/article.jpeg'),
    Article(title: 'L\'art culinaire de Madagascar ', highlightedWord: 'culinaire', imagePath: 'assets/images/article.jpeg'),
    Article(title: 'Les paysages époustouflants', highlightedWord: 'paysages', imagePath: 'assets/images/article.jpeg'),
    Article(title: 'La musique locale en fête', highlightedWord: 'musique', imagePath: 'assets/images/article.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Articles')),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                Image.asset(
                  article.imagePath,
                  errorBuilder: (context, error, stackTrace) {
                    print('Erreur de chargement image: $error');
                    return Container(
                      height: 200,
                      color: Colors.grey[300],
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.image_not_supported, size: 50),
                          Text('Image non trouvée'),
                        ],
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: TextSpan(
                        style: const TextStyle(fontSize: 18, color: Colors.black),
                        children: _buildRichText(article)
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        article.isLiked
                            ?Icons.favorite
                            :Icons.favorite_border,
                        color: article.isLiked ? Colors.red: Colors.grey,
                      ),
                      onPressed: (){
                        setState(() {
                          article.isLiked = !article.isLiked;
                        });
                      },
                    ),
                    const Icon(
                      Icons.info_outline,
                      semanticLabel: 'Informations sur l\'article',
                      color: Colors.blueGrey,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  List<TextSpan> _buildRichText(Article article) {
    final parts = article.title.split(article.highlightedWord);
    return [
      TextSpan(
          text: parts[0],
          style: const TextStyle(fontWeight: FontWeight.bold)
      ),
      TextSpan(
        text: article.highlightedWord,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.teal,
          decoration: TextDecoration.underline,
        ),
      ),
      if (parts.length > 1)
        TextSpan(
          text: parts[1],
          style: const TextStyle(fontWeight: FontWeight.bold),
        )
    ];
  }
}