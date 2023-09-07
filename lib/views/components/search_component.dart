import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pr_7_db_miner/controllers/json_data_controller.dart';
import 'package:share_plus/share_plus.dart';

import '../../modals/quote_modal.dart';
import '../../utils/constant.dart';

class SearchComponent extends StatelessWidget {
  SearchComponent({super.key});

  JsonDataController jsonDataController = Get.find<JsonDataController>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            onChanged: (val) {
              jsonDataController.search(query: val);
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Search Quotes",
              suffixIcon: Icon(Icons.search),
            ),
          ),
          Expanded(
            child: jsonDataController.allQuotesData.isNotEmpty
                ? ListView.builder(
                    itemCount: jsonDataController.allQuotesData.length,
                    itemBuilder: (context, index) {
                      QuoteModal quoteModal =
                          jsonDataController.allQuotesData[index];
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
                                    jsonDataController.onFavoriteTapped(
                                        data: quoteModal);
                                    jsonDataController.checkFavorite();
                                    Get.snackbar('Successfully Added',
                                        '${quoteModal.quote}');
                                  },
                                  icon: Icon(
                                    jsonDataController.isFavorite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
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
                  )
                : SizedBox(
                    height: height - 185,
                    width: width - 0.2,
                    child: const SizedBox(
                      width: 100,
                      height: 100,
                      child: SpinKitFadingCircle(
                        color: Color(0xff09203F),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';
//
// class SearchComponent extends StatefulWidget {
//   const SearchComponent({Key? key}) : super(key: key);
//
//   @override
//   State<SearchComponent> createState() => _SearchComponentState();
// }
//
// class _SearchComponentState extends State<SearchComponent> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "GeeksForGeeks",
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               // method to show the search bar
//               showSearch(
//                   context: context,
//                   // delegate to customize the search bar
//                   delegate: CustomSearchDelegate()
//               );
//             },
//             icon: const Icon(Icons.search),
//           )
//         ],
//       ),
//     );
//   }
// }
//
//
// class CustomSearchDelegate extends SearchDelegate {
//   // Demo list to show querying
//   List<String> searchTerms = [
//     "Apple",
//     "Banana",
//     "Mango",
//     "Pear",
//     "Watermelons",
//     "Blueberries",
//     "Pineapples",
//     "Strawberries"
//   ];
//
//   // first overwrite to
//   // clear the search text
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         onPressed: () {
//           query = '';
//         },
//         icon: Icon(Icons.clear),
//       ),
//     ];
//   }
//
//   // second overwrite to pop out of search menu
//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       onPressed: () {
//         close(context, null);
//       },
//       icon: Icon(Icons.arrow_back),
//     );
//   }
//
//   // third overwrite to show query result
//   @override
//   Widget buildResults(BuildContext context) {
//     List<String> matchQuery = [];
//     for (var fruit in searchTerms) {
//       if (fruit.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(fruit);
//       }
//     }
//     return ListView.builder(
//       itemCount: matchQuery.length,
//       itemBuilder: (context, index) {
//         var result = matchQuery[index];
//         return ListTile(
//           title: Text(result),
//         );
//       },
//     );
//   }
//
//   // last overwrite to show the
//   // querying process at the runtime
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<String> matchQuery = [];
//     for (var fruit in searchTerms) {
//       if (fruit.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(fruit);
//       }
//     }
//     return ListView.builder(
//       itemCount: matchQuery.length,
//       itemBuilder: (context, index) {
//         var result = matchQuery[index];
//         return ListTile(
//           title: Text(result),
//         );
//       },
//     );
//   }
// }
