class QuotesFavoriteModals {
  late int id;
  late String quotes;
  late String category;

  QuotesFavoriteModals({
    required this.quotes,
    required this.category,
  });

  factory QuotesFavoriteModals.fromMap({required Map data}) {
    return QuotesFavoriteModals(
      quotes: data['quotes'],
      category: data['category'],
    );
  }
}
