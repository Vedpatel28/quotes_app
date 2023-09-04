class QuotesFavoriteModals {
  late int id;
  late String quotes;
  late String category;
  late String author;

  QuotesFavoriteModals({
    required this.quotes,
    required this.category,
    required this.author,
  });

  factory QuotesFavoriteModals.fromMap({required Map data}) {
    return QuotesFavoriteModals(
      quotes: data['FaQuotes'],
      category: data['FaCategory'],
      author: data['FaAuthor'],
    );
  }
}
