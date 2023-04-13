import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:taskzmi/pages/dashboard/add_tiket_page.dart';
import 'package:taskzmi/repositories/dashboard/dashboard_repository.dart';

import '../../widget/card_tiket.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        backgroundColor: const Color(0xff1B9C42),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddTiketPage(),
              ));
        },
        backgroundColor: const Color(0xff1B9C42),
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: DashboardRepository().getTiket(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color(0xff1B9C42),
                ),
              );
            }
            if (snapshot.hasData) {
              return GridView.builder(
                padding: const EdgeInsets.all(20),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 5,
                  childAspectRatio: 135 / 300,
                ),
                itemCount: snapshot.data!.data!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: TiketCard(data: snapshot.data!.data![index]),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Product tidak ada",
                  style: GoogleFonts.inter(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color(0xff1B9C42),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xff1B9C42),
              ),
            );
          },
        ),
      ),
    );
  }
}
