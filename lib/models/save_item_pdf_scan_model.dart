class PdfScan {
  String id;
  String filePath;
  String title;
  DateTime dateTime;

  PdfScan({
    required this.id,
    required this.title,
    required this.filePath,
    required this.dateTime,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'filePath': filePath,
        'dateTime': dateTime.toIso8601String(),
      };

  factory PdfScan.fromJson(Map<String, dynamic> json) {
    return PdfScan(
      id: json['id'],
      title: json['title'],
      filePath: json['filePath'],
      dateTime: DateTime.parse(json['dateTime']),
    );
  }
}
