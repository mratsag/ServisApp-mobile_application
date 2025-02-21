import 'package:flutter/material.dart';
import 'package:servis_app/AdminPage.dart';
import 'package:servis_app/Driver/DriverHomeScreen.dart';
import 'package:servis_app/Driver/driver.dart'; // Doğru içe aktarma
import 'package:servis_app/Parent/ParentHomeScreen.dart';
import 'package:servis_app/Student/StudentHomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Öğrenci Giriş Sistemi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String _selectedRole = 'Öğrenci'; // Varsayılan rol

  void _login() {
    if (_formKey.currentState!.validate()) {
      String username = _usernameController.text;
      String password = _passwordController.text;

      // Rol bazlı giriş kontrolü
      if (_selectedRole == 'Öğrenci' && username == "ogrenci" && password == "123") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const StudentHomeScreen()),
        );
      } else if (_selectedRole == 'Veli' && username == "veli" && password == "123") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ParentHomeScreen()),
        );
      } else if (_selectedRole == 'Admin' && username == "admin" && password == "123") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AdminPage()),
        );
      } else if (_selectedRole == 'Şoför' && username == "sofor" && password == "123") {
        // Şoför girişi başarılıysa yeni sayfaya yönlendir
        final Driver driver = Driver(
          name: 'Ahmet Yılmaz',
          students: ['Ahmet', 'Mehmet', 'Ayşe', 'Fatma', 'Ali'],
          boardingStatus: {
            'Ahmet': false,
            'Mehmet': false,
            'Ayşe': false,
            'Fatma': false,
            'Ali': false,
          },
          routeHistory: [
            'Karabük Merkez -> Safranbolu',
            'Safranbolu -> Karabük Üniversitesi',
          ],
        );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DriverHomeScreen(driver: driver),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Kullanıcı adı veya şifre hatalı!')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text(
                        'Servis App',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      DropdownButtonFormField<String>(
                        value: _selectedRole,
                        items: ['Öğrenci', 'Veli', 'Admin', 'Şoför'].map((String role) {
                          return DropdownMenuItem(
                            value: role,
                            child: Text(
                              role,
                              style: const TextStyle(fontSize: 16.0),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedRole = value!;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Rol Seçin',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          labelText: 'Kullanıcı Adı',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Lütfen kullanıcı adınızı girin';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Şifre',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Lütfen şifrenizi girin';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24.0),
                      ElevatedButton(
                        onPressed: _login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32.0, vertical: 16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text(
                          'Giriş Yap',
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}