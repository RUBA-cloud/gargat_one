class ServicesModel {
  final int id;
  final String? nameEn;
  final String? nameAr;
  final String? image;

  const ServicesModel({
    required this.id,
    this.nameEn,
    this.nameAr,
    this.image,
  });

  factory ServicesModel.fromJson(Map<String, dynamic> json) {
    return ServicesModel(
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

  ServicesModel copyWith({
    int? id,
    String? nameEn,
    String? nameAr,
    String? image,
  }) {
    return ServicesModel(
      id: id ?? this.id,
      nameEn: nameEn ?? this.nameEn,
      nameAr: nameAr ?? this.nameAr,
      image: image ?? this.image,
    );
  }
}
