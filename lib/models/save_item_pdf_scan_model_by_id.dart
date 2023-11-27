import 'package:flutter_getx_base/models/save_item_scan_ocr_model.dart';

class ScanOCRListWithId {
  String id;
  List<ScanOCR> scanOCRList;

  ScanOCRListWithId({
    required this.id,
    required this.scanOCRList,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'scanOCRList': scanOCRList.map((scanOCR) => scanOCR.toJson()).toList(),
      };

  factory ScanOCRListWithId.fromJson(Map<String, dynamic> json) {
    return ScanOCRListWithId(
      id: json['id'],
      scanOCRList: (json['scanOCRList'] as List<dynamic>)
          .map((json) => ScanOCR.fromJson(json))
          .toList(),
    );
  }
}
