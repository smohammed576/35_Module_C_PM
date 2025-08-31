class History{
  String phase;
  String timerange;
  String intro;
  String image;

  History({required this.phase, required this.timerange, required this.intro, required this.image});

  factory History.fromJson(Map<String, dynamic> json) => History(
    phase: json['phase'], 
    timerange: json['time_range'], 
    intro: json['intro'], 
    image: json['image']
  );
}