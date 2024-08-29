class NewsDataModel {
  final String title;
  final String description;
  final String publishedAt;
  final String content;
  final String image;
  bool favorite=false;

  NewsDataModel(
      {required this.title,
      required this.description,
      required this.publishedAt,
      required this.content,required this.image});

  factory NewsDataModel.fromJson(Map<String, dynamic> data) {
    return NewsDataModel(
        title: data['title'],
        description: data['description'],
        publishedAt: data['publishedAt'],
        content: data['content'],
        image: data['urlToImage'].toString()
        );
  }
}
