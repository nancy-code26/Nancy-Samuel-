import 'package:flutter/material.dart';
import '../../models/book.dart';
import '../../service/api_service.dart';

class AllBooksPage extends StatefulWidget {
  const AllBooksPage({super.key});

  @override
  State<AllBooksPage> createState() => _AllBooksPageState();
}

class _AllBooksPageState extends State<AllBooksPage> {
  ApiService obj = ApiService();
  late Future<List<Book>> listofBooks;

  @override
  void initState() {
    super.initState();
    listofBooks = obj.fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4A6572),
        title: const Text(
          'Book Catalog',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: FutureBuilder<List<Book>>(
        future: listofBooks,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color(0xFF4A6572),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else if (snapshot.hasData) {
            List<Book> books = snapshot.data!;

            return ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  elevation: 1,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 6,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    leading: CircleAvatar(
                      backgroundColor: const Color(0xFFF0F4F8),
                      child: Text(
                        '${books[index].id}',
                        style: const TextStyle(
                          color: Color(0xFF4A6572),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: Text(
                      books[index].title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFF232F34),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        'By: ${books[index].author}',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              BookDetailsPage(book: books[index]),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text('No books available at the moment.'),
            );
          }
        },
      ),
    );
  }
}

// ================== Book Details Screen ==================

class BookDetailsPage extends StatelessWidget {
  final Book book;

  const BookDetailsPage({
    super.key,
    required this.book,
  });

  String getEnglishStatus(String status) {
    if (status == 'reading') return '📖 Reading';
    if (status == 'finished') return '✅ Finished';
    return '⏳ Plan to Read';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4A6572),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          book.title,
          style: const TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            color: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 36,
                      backgroundColor: const Color(0xFFF0F4F8),
                      child: const Icon(
                        Icons.menu_book_rounded,
                        size: 36,
                        color: Color(0xFF4A6572),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  _buildDetailRow('Book ID', '#${book.id}'),
                  const Divider(height: 24),

                  _buildDetailRow(
                    'Title',
                    book.title,
                    isBold: true,
                  ),
                  const Divider(height: 24),

                  _buildDetailRow('Author', book.author),
                  const Divider(height: 24),

                  _buildDetailRow(
                    'Reading Status',
                    getEnglishStatus(book.status),
                  ),
                  const Divider(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Rating',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: List.generate(
                          book.rating,
                              (index) => const Icon(
                            Icons.star_rounded,
                            color: Colors.amber,
                            size: 22,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(
      String label,
      String value, {
        bool isBold = false,
      }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.grey,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 16,
              fontWeight:
              isBold ? FontWeight.bold : FontWeight.w500,
              color: const Color(0xFF232F34),
            ),
          ),
        ),
      ],
    );
  }
}