import 'package:flutter/material.dart';
import '../localsto/employeeDb.dart';

class Databasescreen extends StatefulWidget {
  @override
  State<Databasescreen> createState() => _DatabasescreenState();
}

class _DatabasescreenState extends State<Databasescreen> {
  EmployeeDB obj = EmployeeDB();
  bool isLoading = true;

  // Controllers to manage text field inputs inside the dialog box
  final TextEditingController nameController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();
  final TextEditingController deptController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initAndFetch();
  }

  // Synchronously awaits the database preparation before requesting data
  void _initAndFetch() async {
    await obj.createTable();
    _refreshUI();
  }

  // Re-fetches the updated data and triggers a setState to redraw the UI instantly
  void _refreshUI() async {
    if (obj.database != null) {
      List<Map> data = await obj.getEmployeeData(obj.database!);
      setState(() {
        obj.emps = data;
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  // Displays a popup form dialog configured for either inserting or editing data
  void _showFormDialog({int? empId, String? currentName, int? currentSalary, String? currentDept}) {
    if (empId != null) {
      nameController.text = currentName ?? '';
      salaryController.text = currentSalary?.toString() ?? '';
      deptController.text = currentDept ?? '';
    } else {
      nameController.clear();
      salaryController.clear();
      deptController.clear();
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          empId == null ? "Add New Employee" : "Edit Employee",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Full Name", prefixIcon: Icon(Icons.person)),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: salaryController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Salary", prefixIcon: Icon(Icons.payments)),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: deptController,
                decoration: const InputDecoration(labelText: "Department", prefixIcon: Icon(Icons.work)),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel", style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1A479B),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            ),
            onPressed: () async {
              if (nameController.text.trim().isNotEmpty) {
                if (empId == null) {
                  // Await the insertion to finish completely before moving to the next line
                  await obj.fillData(
                    fn: nameController.text.trim(),
                    salary: int.tryParse(salaryController.text.trim()) ?? 0,
                    dn: deptController.text.trim(),
                  );
                } else {
                  // Await update for existing employee
                  await obj.updatedata(
                    id: empId,
                    fn: nameController.text.trim(),
                    sal: int.tryParse(salaryController.text.trim()) ?? 0,
                    dn: deptController.text.trim(),
                  );
                }

                // Now close the dialog and refresh safely with data loaded
                Navigator.pop(context);
                _refreshUI();
              }
            },
            child: Text(empId == null ? "Insert" : "Save", style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Employees Data",
          style: TextStyle(color: Color(0xFF1E293B), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      // Floating Action Button situated at the bottom right corner to trigger inserts
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF1A479B),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        onPressed: () => _showFormDialog(),
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),

      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : obj.emps.isEmpty
          ? const Center(
        child: Text(
          "No employees registered yet.\nTap the '+' button to add.",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        itemCount: obj.emps.length,
        itemBuilder: (context, index) {
          final item = obj.emps[index];
          final String name = item['fullname']?.toString() ?? 'Employee';
          final String firstLetter = name.isNotEmpty ? name[0].toUpperCase() : 'E';

          return Container(
            margin: const EdgeInsets.only(bottom: 14),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4)),
              ],
            ),
            child: Row(
              children: [
                // Circular avatar demonstrating the initial character of the employee's name
                CircleAvatar(
                  radius: 26,
                  backgroundColor: const Color(0xFFE0E7FF),
                  child: Text(
                    firstLetter,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF4338CA)),
                  ),
                ),
                const SizedBox(width: 16),

                // Textual column displaying detailed employee parameters
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "${item['salary'] ?? 0} EGP",
                        style: const TextStyle(color: Color(0xFF4338CA), fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        item['department_name']?.toString() ?? '',
                        style: const TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ],
                  ),
                ),

                // Action buttons to trigger transactional changes (Edit / Delete)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blueAccent, size: 22),
                      onPressed: () => _showFormDialog(
                        empId: item['employee_id'],
                        currentName: item['fullname'],
                        currentSalary: item['salary'],
                        currentDept: item['department_name'],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.redAccent, size: 22),
                      onPressed: () async {
                        await obj.deleteEmployee(id: item['employee_id']);
                        _refreshUI();
                      },
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
}