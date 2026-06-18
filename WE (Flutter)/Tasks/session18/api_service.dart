import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/book.dart'; // Correct relative path to the book model

class ApiService {
  // Base API URL for pythonanywhere server
  String baseUrl = "https://weflutter2026.pythonanywhere.com/api/";
  String endpointsGetBooks = "books";

  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };

  // Asynchronous function to fetch all books from the API
  Future<List<Book>> fetchBooks() async {
    final url = Uri.parse(baseUrl + endpointsGetBooks);
    final result = await http.get(url, headers: headers);

    if (result.statusCode == 200) {
      // Decode with UTF-8 to display characters properly without corruption
      List<dynamic> body = json.decode(utf8.decode(result.bodyBytes));
      List<Book> books = body.map((dynamic item) => Book.fromJson(item)).toList();
      return books;
    } else {
      throw Exception("Failed to load books from server");
    }
  }
}