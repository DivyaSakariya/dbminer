import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pr_7_db_miner/controllers/json_data_controller.dart';
import 'package:pr_7_db_miner/controllers/db_quote_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pr_7_db_miner/modals/quote_modal.dart';
import 'package:pr_7_db_miner/utils/constant.dart';
import 'package:share_plus/share_plus.dart';

class HomeComponent extends StatelessWidget {
  HomeComponent({super.key});

  DBQuoteController dbQuoteController = Get.put(DBQuoteController());
  JsonDataController jsonDataController = Get.put(JsonDataController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: jsonDataController.allQuotesData.length,
        itemBuilder: (context, index) {
          QuoteModal quoteModal = jsonDataController.allQuotesData[index];
          Color c1 = color1[index % 10];
          Color c2 = color2[index % 10];

          return Container(
            margin: const EdgeInsets.all(10),
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),

              gradient: LinearGradient(
                colors: [
                  c1,
                  c2,
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ListTile(
                  title: Text(
                    quoteModal.quote!,
                    style: GoogleFonts.acme(
                      color: Colors.white,
                      letterSpacing: 1,
                      fontSize: 17,
                    ),
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "- ${quoteModal.author!}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        Clipboard.setData(
                          ClipboardData(
                              text:
                                  "${quoteModal.quote!}\n\n - ${quoteModal.author}"),
                        );
                      },
                      icon: const Icon(
                        Icons.copy_rounded,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        jsonDataController.onFavoriteTapped(data: quoteModal);
                        jsonDataController.checkFavorite();
                        Get.snackbar(
                            'Successfully Added', '${quoteModal.quote}');
                      },
                      icon: Icon(
                        jsonDataController.isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Share.share(
                            "${quoteModal.quote!}\n\n - ${quoteModal.author}");
                      },
                      icon: const Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
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
