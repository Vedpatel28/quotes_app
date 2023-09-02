class QuotesModals {
  late int id;
  late String quotes;
  late String category;

  QuotesModals(
    this.quotes,
    this.category,
  );

  factory QuotesModals.fromMap({required Map data}) {
    return QuotesModals(
      data['quotes'],
      data['category'],
    );
  }
}
