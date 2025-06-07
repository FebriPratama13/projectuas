import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectuas/routes/app_routes.dart';
import '../../../config/theme.dart';

class CreateModulPage extends StatefulWidget {
  const CreateModulPage({super.key});

  @override
  State<CreateModulPage> createState() => _CreateModulPageState();
}

class _CreateModulPageState extends State<CreateModulPage> {
  final TextEditingController _judulController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();
  final TextEditingController _langkahController = TextEditingController();

  String? selectedKategori;
  final List<String> kategoriList = [
    "Pemrograman Website",
    "Pemrograman Mobile",
    "Pemrograman Berbasis Event",
    "Basis Data",
  ];

  @override
  void dispose() {
    _judulController.dispose();
    _deskripsiController.dispose();
    _langkahController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        onTap: (i) => Navigator.pop(context),
        selectedItemColor: AppTheme.primaryColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Module'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Authors'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.close),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.home);
                        // TODO: Kirim data ke backend
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text("Upload"),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Input Judul
                TextField(
                  controller: _judulController,
                  decoration: const InputDecoration(
                    labelText: "Judul",
                    hintText: "Masukkan judul modul",
                  ),
                ),
                const SizedBox(height: 16),

                // Deskripsi Modul
                TextField(
                  controller: _deskripsiController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    labelText: "Deskripsi Module",
                    hintText: "Tulis deskripsi singkat modul",
                  ),
                ),
                const SizedBox(height: 16),

                // Dropdown Kategori
                Text(
                  "Pilih Kategori",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: selectedKategori,
                  hint: const Text("Pilih kategori"),
                  items:
                      kategoriList.map((kategori) {
                        return DropdownMenuItem(
                          value: kategori,
                          child: Text(kategori),
                        );
                      }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedKategori = value;
                    });
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Langkah-langkah (satu TextField besar)
                Text(
                  "Langkah-langkah",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _langkahController,
                  maxLines: 8,
                  decoration: const InputDecoration(
                    hintText: "Tulis semua langkah di sini...",
                    filled: true,
                  ),
                ),
                const SizedBox(height: 16),

                // Upload Gambar
                Text(
                  "Gambar Modul",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    // TODO: Gunakan image_picker nanti
                  },
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDEDED),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      size: 32,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
