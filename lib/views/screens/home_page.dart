import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pr_7_db_miner/controllers/home_controller.dart';
import 'package:pr_7_db_miner/controllers/quotes_controller.dart';
import 'package:pr_7_db_miner/views/components/home_component.dart';
import 'package:pr_7_db_miner/views/components/menu_component.dart';
import 'package:pr_7_db_miner/views/components/quotes_component.dart';
import 'package:pr_7_db_miner/views/components/search_component.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  HomeController homeController = Get.put(HomeController());
  QuotesController quotesController = Get.put(QuotesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "MyQu",
              style: GoogleFonts.aBeeZee(
                color: const Color(0xff09203F),
                fontSize: 24,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(
              width: 2,
            ),
            const Icon(
              Icons.all_inclusive,
              size: 36,
              color: Color(0xff09203F),
            ),
            const SizedBox(
              width: 2,
            ),
            Text(
              "tes",
              style: GoogleFonts.aBeeZee(
                color: const Color(0xff09203F),
                fontSize: 24,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border_rounded),
          ),
        ],
      ),
      body: PageView(
        controller: homeController.pageController,
        children: [
          HomeComponent(),
          QuotesComponent(),
          SearchComponent(),
          MenuComponent(),
        ],
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          onTap: (index) {
            homeController.onPageChange(index: index);
            if (index == 1) {
              quotesController.getImages();
            }
          },
          currentIndex: homeController.getCurrentIndex,
          selectedLabelStyle: const TextStyle(color: Color(0xff09203F)),
          selectedItemColor: Color(0xff09203F),
          unselectedLabelStyle: const TextStyle(color: Colors.grey),
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.layers_outlined),
              label: 'Quotes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_rounded),
              label: 'Menu',
            ),
          ],
        );
      }),
    );
  }
}