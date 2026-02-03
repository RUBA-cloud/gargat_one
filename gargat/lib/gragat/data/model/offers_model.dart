class OffersModel {
  final int id;
  final String? nameEn;
  final String? nameAr;
  final String? image;

  const OffersModel({
    required this.id,
    this.nameEn,
    this.nameAr,
    this.image,
  });

  factory OffersModel.fromJson(Map<String, dynamic> json) {
    return OffersModel(
      id: (json['id'] as num).toInt(),
      nameEn: json['name_en'] as String?,
      nameAr: json['name_ar'] as String?,
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_en': nameEn,
      'name_ar': nameAr,
      'image': image,
    };
  }

  OffersModel copyWith({
    int? id,
    String? nameEn,
    String? nameAr,
    String? image,
  }) {
    return OffersModel(
      id: id ?? this.id,
      nameEn: nameEn ?? this.nameEn,
      nameAr: nameAr ?? this.nameAr,
      image: image ?? this.image,
    );
  }
}
