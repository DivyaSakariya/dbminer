import 'dart:developer';

class QuoteModal {
  late int id;
  String? quote;
  String? author;

  QuoteModal(
    this.quote,
    this.author,
  );

  QuoteModal.init() {
    log("Quote Modal Initialized...");
  }

  factory QuoteModal.fromMap({required Map data}) {
    return QuoteModal(
      data['quote'],
      data['author'],
    );
  }
}
