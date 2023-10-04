import 'package:flutter/material.dart';

class Profilpage extends StatefulWidget {
  const Profilpage({Key? key});

  @override
  _ProfilpageState createState() => _ProfilpageState();
}

class _ProfilpageState extends State<Profilpage> {
  TextEditingController _namaController = TextEditingController();
  TextEditingController _nimController = TextEditingController();
  TextEditingController _semesterController = TextEditingController();
  TextEditingController _prodiController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Inisialisasi nilai-nilai dalam controller sesuai dengan data akun yang sudah login
    _namaController.text = "Nama Anda";
    _nimController.text = "NIM Anda";
    _semesterController.text = "Semester Anda";
    _prodiController.text = "Program Studi Anda";
    _emailController.text = "Email Anda";
  }

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _semesterController.dispose();
    _prodiController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 16.0),
              CircleAvatar(
                radius: 64.0,
                // backgroundImage: AssetImage('assets/images/merta.jpg'),
              ),
              const SizedBox(height: 16.0),
              Text(
                'LogBook App',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8.0),
              Text(
                'Versi 1.0.0',
                style: TextStyle(
                  fontSize: 14.0,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              buildInfoTextField('Nama', _namaController),
              buildInfoTextField('NIM', _nimController),
              buildInfoTextField('Semester', _semesterController),
              buildInfoTextField('Program Studi', _prodiController),
              buildInfoTextField('Email', _emailController),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Tambahkan logika untuk menyimpan perubahan ke profil di sini.
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  padding: EdgeInsets.symmetric(
                    vertical: 12.0,
                  ),
                ),
                child:
                    Text('Simpan Perubahan', style: TextStyle(fontSize: 16.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4.0),
        TextField(
          controller: controller,
          style: TextStyle(fontSize: 14.0),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 12.0,
            ),
          ),
        ),
        SizedBox(height: 16.0),
      ],
    );
  }
}
