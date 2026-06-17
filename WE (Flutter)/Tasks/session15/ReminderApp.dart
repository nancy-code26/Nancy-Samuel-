import 'package:flutter/material.dart';

class ReminderItem {
  String title;
  String category;
  String time;

  ReminderItem({required this.title, required this.category, required this.time});
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Initial list of reminders
  List<ReminderItem> myReminders = [
    ReminderItem(title: "Flutter Study Session", category: "Study", time: "10:00 AM"),
    ReminderItem(title: "Vitamin D", category: "Medication", time: "04:00 PM"),
    ReminderItem(title: "Buy groceries", category: "Personal", time: "08:00 PM"),
  ];

  // Available categories for filtering
  List<String> categories = ["All", "Medication", "Study", "Personal"];
  String selectedCategory = "All";

  @override
  Widget build(BuildContext context) {
    // Filtering reminders based on the selected category
    List<ReminderItem> filteredReminders = selectedCategory == "All"
        ? myReminders
        : myReminders.where((item) => item.category == selectedCategory).toList();

    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        title: const Text('My Reminder ⏰', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.pink[300],
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),
          // 1. Horizontal Categories Bar
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final cat = categories[index];
                final isSelected = cat == selectedCategory;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ChoiceChip(
                    label: Text(cat),
                    selected: isSelected,
                    selectedColor: Colors.pink[300],
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.pink[700],
                      fontWeight: FontWeight.bold,
                    ),
                    backgroundColor: Colors.pink[100]?.withOpacity(0.4),
                    onSelected: (bool selected) {
                      setState(() {
                        selectedCategory = cat;
                      });
                    },
                  ),
                );
              },
            ),
          ),
          const Divider(height: 30, thickness: 1, color: Colors.pinkAccent),
          // 2. Reminders List View
          Expanded(
            child: filteredReminders.isEmpty
                ? const Center(child: Text('No reminders in this category!'))
                : ListView.builder(
              itemCount: filteredReminders.length,
              itemBuilder: (context, index) {
                final item = filteredReminders[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  elevation: 2,
                  color: Colors.white,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.pink[100],
                      child: Icon(Icons.alarm, color: Colors.pink[400]),
                    ),
                    title: Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('Category: ${item.category}'),
                    trailing: Text(
                      item.time,
                      style: TextStyle(color: Colors.pink[300], fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      // Floating Action Button to add a new reminder
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Future Step: Open Add Reminder Screen
        },
        backgroundColor: Colors.pink[300],
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}