class QuoteModal {
  late int id;
  String? quote;
  String? author;
  String? category;
  bool? favrouite = false;

  QuoteModal(
    this.quote,
    this.author,
    this.category,
    this.favrouite,
  );

  factory QuoteModal.fromMap({required Map data}) {
    return QuoteModal(
      data['quote'],
      data['author'],
      data['category'],
      data['favrouite'],
    );
  }
}
