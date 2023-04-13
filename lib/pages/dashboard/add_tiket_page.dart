import 'package:flutter/material.dart';
import 'package:taskzmi/pages/dashboard/dashboard_page.dart';
import 'package:taskzmi/repositories/dashboard/dashboard_repository.dart';
import 'package:taskzmi/widget/btn_primary.dart';
import 'package:taskzmi/widget/text_field_custom.dart';

class AddTiketPage extends StatelessWidget {
  AddTiketPage({super.key});
  TextEditingController namaTiket = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController qty = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Tiket"),
        backgroundColor: const Color(0xff1B9C42),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFieldCustom(
              label: "Nama Tiket",
              controller: namaTiket,
            ),
            const SizedBox(height: 10),
            TextFieldCustom(
              label: "Price",
              controller: price,
            ),
            const SizedBox(height: 10),
            TextFieldCustom(
              label: "QTY",
              controller: qty,
            ),
            const SizedBox(height: 20),
            BtnPrimary(
              txtBtn: "Add Tiket",
              onPressed: () {
                DashboardRepository()
                    .addTiket(
                        name: namaTiket.text, price: price.text, qty: qty.text)
                    .then((value) => {
                          if (value.status == "200")
                            {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const DashboardPage(),
                                  ),
                                  (route) => false),
                            }
                          else
                            {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(value.message!),
                                ),
                              )
                            },
                        });
              },
            )
          ],
        ),
      ),
    );
  }
}
