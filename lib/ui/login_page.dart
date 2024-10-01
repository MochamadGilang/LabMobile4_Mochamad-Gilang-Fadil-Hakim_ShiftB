import 'package:flutter/material.dart';
import 'package:tokokita/ui/registrasi_page.dart';
import 'package:tokokita/ui/produk_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final _emailTextboxController = TextEditingController();
  final _passwordTextboxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xFFf12711), Color(0xFFf5af19)], // Gradasi merah dan oranye
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 48.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 80),
                  const Text(
                    "Hello Again!",
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      fontStyle: FontStyle.italic, // Menambah gaya italic
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Welcome back, please login to your account",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white70, // Teks dengan warna putih sedikit transparan
                      letterSpacing: 1.2, // Menambah jarak antar huruf
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 50),
                  _emailTextField(),
                  const SizedBox(height: 20),
                  _passwordTextField(),
                  const SizedBox(height: 30),
                  _buttonLogin(),
                  const SizedBox(height: 20),
                  _menuRegistrasi(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _emailTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Email",
        prefixIcon: const Icon(Icons.mail_outline, color: Colors.white), // Ganti ikon dan warna menjadi putih
        filled: true,
        fillColor: Colors.black12, // Mengubah warna background input field
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), // Mengubah bentuk border menjadi lebih kotak
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      controller: _emailTextboxController,
      style: const TextStyle(color: Colors.white), // Ganti warna teks input menjadi putih
      validator: (value) {
        if (value!.isEmpty) {
          return 'Email is required';
        }
        return null;
      },
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Password",
        prefixIcon: const Icon(Icons.lock_outline, color: Colors.white), // Mengganti ikon menjadi outline lock
        filled: true,
        fillColor: Colors.black12, // Mengubah warna background input field
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      obscureText: true,
      controller: _passwordTextboxController,
      style: const TextStyle(color: Colors.white), // Mengubah warna teks input menjadi putih
      validator: (value) {
        if (value!.isEmpty) {
          return "Password is required";
        }
        return null;
      },
    );
  }

  Widget _buttonLogin() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purpleAccent, // Mengganti warna tombol menjadi ungu terang
          padding: const EdgeInsets.symmetric(vertical: 18.0), // Menambah padding tombol
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0), // Mengubah border radius menjadi lebih kecil
          ),
          elevation: 5.0, // Menambah efek bayangan pada tombol
        ),
        child: _isLoading
            ? const CircularProgressIndicator(
          color: Colors.white,
        )
            : const Text(
          "Sign In",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        onPressed: _isLoading
            ? null
            : () {
          if (_formKey.currentState!.validate()) {
            setState(() {
              _isLoading = true;
            });
            Future.delayed(const Duration(seconds: 2), () {
              setState(() {
                _isLoading = false;
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProdukPage()), // Replace `ProdukPage` with the actual product page widget
              );
            });
          }
        },
      ),
    );
  }

  Widget _menuRegistrasi() {
    return Center(
      child: InkWell(
        child: const Text(
          "Don't have an account? Sign up here",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline, // Menambah garis bawah pada teks
          ),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const RegistrasiPage()));
        },
      ),
    );
  }
}
