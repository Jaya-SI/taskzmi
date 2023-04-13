import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sizer/sizer.dart';
import 'package:taskzmi/model/auth/login_model.dart';
import 'package:taskzmi/pages/auth/register_page.dart';
import 'package:taskzmi/pages/dashboard/dashboard_page.dart';

import '../../repositories/auth/auth_repository.dart';
import '../../widget/btn_primary.dart';
import '../../widget/text_field_custom.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Login",
                style: GoogleFonts.inter(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff020202),
                ),
              ),
              Text(
                "Silahkan Login untuk memulai",
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w300,
                  color: const Color(0xff8D92A3),
                ),
              ),
              const SizedBox(height: 50),
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
              const SizedBox(height: 24),
              BtnPrimary(
                onPressed: () async {
                  if (_emailController.text.isEmpty ||
                      _passwordController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Email dan Password tidak boleh kosong"),
                      ),
                    );
                  } else {
                    context.loaderOverlay.show();
                    LoginModel login = await AuthRepository().login(
                      _emailController.text,
                      _passwordController.text,
                    );

                    if (login.status == "200") {
                      context.loaderOverlay.hide();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DashboardPage(),
                          ),
                          (route) => false);
                    } else {
                      context.loaderOverlay.hide();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Login gagal"),
                        ),
                      );
                    }
                  }
                },
                txtBtn: "Login",
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Belum punya akun? ",
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
                              builder: (context) => const RegisterPage()));
                    },
                    child: Text(
                      "Daftar",
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
