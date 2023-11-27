class SaveItemWaterMark {
  String id;
  String title;
  DateTime dateTime;

  SaveItemWaterMark({
    required this.id,
    required this.title,
    required this.dateTime,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'dateTime': dateTime.toIso8601String(),
      };

  factory SaveItemWaterMark.fromJson(Map<String, dynamic> json) {
    return SaveItemWaterMark(
      id: json['id'],
      title: json['title'],
      dateTime: DateTime.parse(json['dateTime']),
    );
  }
}
