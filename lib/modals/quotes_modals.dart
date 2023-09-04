class QuotesModals {
  late int id;
  late String quotes;
  late String category;
  late String author;

  QuotesModals(
    this.quotes,
    this.category,
    this.author,
  );

  factory QuotesModals.fromMap({required Map data}) {
    return QuotesModals(
      data['Quotes'],
      data['Category'],
      data['Author'],
    );
  }
}
