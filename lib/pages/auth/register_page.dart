import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sizer/sizer.dart';
import 'package:taskzmi/model/auth/register_model.dart';
import 'package:taskzmi/pages/auth/login_page.dart';
import 'package:taskzmi/repositories/auth/auth_repository.dart';

import '../../widget/btn_primary.dart';
import '../../widget/text_field_custom.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Register",
                style: GoogleFonts.inter(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff020202),
                ),
              ),
              Text(
                "Silahkan Register untuk memulai",
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w300,
                  color: const Color(0xff8D92A3),
                ),
              ),
              const SizedBox(height: 50),
              TextFieldCustom(
                controller: _nameController,
                label: "Name",
              ),
              const SizedBox(height: 16),
              TextFieldCustom(
                controller: _emailController,
                label: "Email",
              ),
              const SizedBox(height: 16),
              TextFieldCustom(
                controller: _passwordController,
                label: "Pasworrd",
                isPassword: true,
              ),
              const SizedBox(height: 16),
              TextFieldCustom(
                controller: _phoneController,
                label: "Phone",
              ),
              const SizedBox(height: 24),
              BtnPrimary(
                onPressed: () async {
                  if (_emailController.text.isEmpty ||
                      _passwordController.text.isEmpty ||
                      _nameController.text.isEmpty ||
                      _phoneController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Data tidak boleh kosong"),
                      ),
                    );
                  } else {
                    context.loaderOverlay.show();
                    RegisterModel register = await AuthRepository().register(
                      _nameController.text,
                      _emailController.text,
                      _passwordController.text,
                      _phoneController.text,
                    );
                    if (register.status == "200") {
                      context.loaderOverlay.hide();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                          (route) => false);
                    } else {
                      context.loaderOverlay.hide();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Register gagal"),
                        ),
                      );
                    }
                  }
                },
                txtBtn: "Register",
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sudah punya akun? ",
                    style: GoogleFonts.inter(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                      color: const Color(0xff8D92A3),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ));
                    },
                    child: Text(
                      "Login",
                      style: GoogleFonts.inter(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff020202),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
