class QuotesFavoriteModals {
  late int id;
  late String quotes;
  late String category;

  QuotesFavoriteModals(
      this.quotes,
      this.category,
      );

  factory QuotesFavoriteModals.fromMap({required Map data}) {
    return QuotesFavoriteModals(
      data['quotes'],
      data['category'],
    );
  }
}
