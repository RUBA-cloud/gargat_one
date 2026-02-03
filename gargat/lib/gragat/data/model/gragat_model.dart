class GarageModel {
  final int? id;
  final String? nameEn;
  final String? nameAr;

  final String? serviceTypeEn;
  final String? serviceTypeAr;

  final String? city;
  final String? priceRange;

  final bool? isTopService;
  final bool? isFav;

  final int? reviewStarsCount;
  final int? reviewCount;

  const GarageModel({
    this.id,
    this.nameEn,
    this.nameAr,
    this.serviceTypeEn,
    this.serviceTypeAr,
    this.city,
    this.priceRange,
    this.isTopService,
    this.isFav,
    this.reviewStarsCount,
    this.reviewCount,
  });

  factory GarageModel.fromJson(Map<String, dynamic> json) {
    return GarageModel(
      id: (json['id'] as num?)?.toInt(),
      nameEn: json['name_en'] as String?,
      nameAr: json['name_ar'] as String?,
      serviceTypeEn: json['service_type_en'] as String?,
      serviceTypeAr: json['service_type_ar'] as String?,
      city: json['city'] as String?,
      priceRange: json['price_range'] as String?,
      isTopService: _toBool(json['is_top_service']),
      isFav: _toBool(json['is_fav']),
      reviewStarsCount: (json['review_stars_count'] as num?)?.toInt(),
      reviewCount: (json['review_count'] as num?)?.toInt(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_en': nameEn,
      'name_ar': nameAr,
      'service_type_en': serviceTypeEn,
      'service_type_ar': serviceTypeAr,
      'city': city,
      'price_range': priceRange,
      'is_top_service': isTopService,
      'is_fav': isFav,
      'review_stars_count': reviewStarsCount,
      'review_count': reviewCount,
    };
  }

  GarageModel copyWith({
    int? id,
    String? nameEn,
    String? nameAr,
    String? serviceTypeEn,
    String? serviceTypeAr,
    String? city,
    String? priceRange,
    bool? isTopService,
    bool? isFav,
    int? reviewStarsCount,
    int? reviewCount,
  }) {
    return GarageModel(
      id: id ?? this.id,
      nameEn: nameEn ?? this.nameEn,
      nameAr: nameAr ?? this.nameAr,
      serviceTypeEn: serviceTypeEn ?? this.serviceTypeEn,
      serviceTypeAr: serviceTypeAr ?? this.serviceTypeAr,
      city: city ?? this.city,
      priceRange: priceRange ?? this.priceRange,
      isTopService: isTopService ?? this.isTopService,
      isFav: isFav ?? this.isFav,
      reviewStarsCount: reviewStarsCount ?? this.reviewStarsCount,
      reviewCount: reviewCount ?? this.reviewCount,
    );
  }

  // ✅ optional helper: localized name
  String displayName({bool isArabic = false}) {
    if (isArabic) return (nameAr?.isNotEmpty ?? false) ? nameAr! : (nameEn ?? '');
    return (nameEn?.isNotEmpty ?? false) ? nameEn! : (nameAr ?? '');
  }

  static bool? _toBool(dynamic v) {
    if (v == null) return null;
    if (v is bool) return v;
    if (v is num) return v != 0;
    if (v is String) {
      final s = v.toLowerCase().trim();
      if (s == 'true' || s == '1' || s == 'yes') return true;
      if (s == 'false' || s == '0' || s == 'no') return false;
    }
    return null;
  }
}
