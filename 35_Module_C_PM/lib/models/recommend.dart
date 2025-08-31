class Recommend{
  String title;
  String tag;
  String image;

  Recommend({required this.title, required this.tag, required this.image});

  factory Recommend.fromJson(Map<String, dynamic> json) => Recommend(
    title: json['title'], 
    tag: json['tag'], 
    image: json['image']
  );
}