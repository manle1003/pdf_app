class ScanOCR {
  String itemScanOrc;

  ScanOCR({
    required this.itemScanOrc,
  });

  Map<String, dynamic> toJson() => {
        'itemScanOrc': itemScanOrc,
      };

  factory ScanOCR.fromJson(Map<String, dynamic> json) {
    return ScanOCR(
      itemScanOrc: json['itemScanOrc'],
    );
  }
}
