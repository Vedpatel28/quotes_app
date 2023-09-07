class ApiModal {
  late int id;
  late String quotes;
  late String category;
  late String author;

  ApiModal(
    this.quotes,
    this.author,
    this.category,
  );

  factory ApiModal.fromApi({required Map data}) {
    return ApiModal(
      data['Quotes'],
      data['Category'],
      data['Author'],
    );
  }
}
