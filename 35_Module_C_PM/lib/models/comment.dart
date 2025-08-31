class Comment{
  String question;
  String answer;
  String avatar;
  String username;
  int likes;

  Comment({required this.question, required this.answer, required this.avatar, required this.username, required this.likes});

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    question: json['question'], 
    answer: json['answer'], 
    avatar: json['avatar'], 
    username: json['username'], 
    likes: json['likes']
  );
}