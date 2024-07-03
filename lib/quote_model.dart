class DataModel {
  int limit;
  int skip;
  int total;
  List<QuoteModel> quotes;

  DataModel(
      {required this.limit,
      required this.skip,
      required this.total,
      required this.quotes});
  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
        limit: json['limit'],
        skip: json['skip'],
        total: json['total'],
        quotes: (json['quotes'] as List)
            .map((e) => QuoteModel.fromJson(e))
            .toList());
  }
}

class QuoteModel {
  String author;
  int id;
  String quote;

  QuoteModel({required this.author, required this.id, required this.quote});

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
        author: json['author'], id: json['id'], quote: json['quote']);
  }
}
