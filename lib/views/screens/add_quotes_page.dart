import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_7_db_miner/controllers/db_quote_controller.dart';
import 'package:pr_7_db_miner/modals/quote_modal.dart';

class AddQuotesPage extends StatelessWidget {
  AddQuotesPage({super.key});

  QuoteModal quoteModal = QuoteModal.init();
  DBQuoteController dbQuoteController = Get.put(DBQuoteController());

  TextEditingController quoteController = TextEditingController();
  TextEditingController authorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Transaction"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Add Quote"),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    onChanged: (val) {
                      quoteModal.quote = val ?? '';
                    },
                    controller: quoteController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Quote",
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  const Text("Add Author Name"),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    onChanged: (val) {
                      quoteModal.author = val ?? '';
                    },
                    controller: authorController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Author",
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                        onPressed: () async {
                          quoteController.clear();
                          authorController.clear();

                          Navigator.of(context).pop();
                        },
                        child: const Text("Clear"),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          quoteModal.id = 0;

                          quoteController.clear();
                          authorController.clear();

                          int id = await dbQuoteController.insertQuote(
                              quoteModal: quoteModal);

                          Get.snackbar("Successfully Transaction Added !!",
                              "Category: ${quoteModal.quote}");

                          dbQuoteController.getAllQuotes();
                          Navigator.of(context).pop();
                        },
                        child: const Text("Save"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
