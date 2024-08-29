String imageIfnull =
    'https://cdn.pixabay.com/photo/2017/06/26/19/03/news-2444778_1280.jpg';

class NewsDataModel {
  final String title;
  final String description;
  final String publishedAt;
  final String content;
  final String image;
  bool favorite = false;

  NewsDataModel(
      {required this.title,
      required this.description,
      required this.publishedAt,
      required this.content,
      required this.image});

  factory NewsDataModel.fromJson(Map<String, dynamic> data) {
    return NewsDataModel(
      title: data['title'],
      description: data['description']??data['title'],
      publishedAt: data['publishedAt'],
      content: data['content']??data['title'],
      image: data['urlToImage']?.toString() ?? imageIfnull,
    );
  }
}
