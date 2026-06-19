class Article {
  final String title;
  final String imageUrl;
  final String articleUrl;

  Article({required this.title, required this.imageUrl, required this.articleUrl});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? 'No Title',
      imageUrl: json['urlToImage'] ?? 'https://via.placeholder.com/150',
      articleUrl: json['url'] ?? '',
    );
  }
}