class QuoteModal {
  late int id;
  String? quote;
  String? author;

  QuoteModal(
    this.quote,
    this.author,
  );

  factory QuoteModal.fromMap({required Map data}) {
    return QuoteModal(
      data['quote'],
      data['author'],
    );
  }
}
