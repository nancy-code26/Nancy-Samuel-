class Book {
  late int id;
  late String title;
  late String author;
  late String status;
  late int rating;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.status,
    required this.rating,
  });

  factory Book.fromJson(Map<String, dynamic> data) {
    return Book(
      id: data['id'],
      title: data['title'] ?? '',
      author: data['author'] ?? '',
      status: data['status'] ?? '',
      rating: data['rating'] ?? 1,
    );
  }
}