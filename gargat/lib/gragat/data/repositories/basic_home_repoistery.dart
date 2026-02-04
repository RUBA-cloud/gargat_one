import 'dart:developer';

import 'package:gragat/gragat/data/model/gragat_model.dart';
import 'package:gragat/gragat/data/model/offers_model.dart';
import 'package:gragat/gragat/data/model/services_model.dart';

/// ✅ Repository contract
abstract class HomeRepository {
  List<ServicesModel> loadServices();
  List<OffersModel> loadOffers();
  List<GarageModel> loadGrages();
  List<ServicesModel> filterServices(String query);
}

/// ✅ Basic implementation
class BasicHomeRepository implements HomeRepository {
  static const String _imgPath = "assets/images/";

  final List<String> _namesService = const [
    "Detailing",
    "Car Wash",
    "Oil Change",
    "Window Tinting",
    "Battery Change",
    "AC Service",
    "Detailing",
    "Car Wash",
    "Oil Change",
    "Window Tinting",
    "Battery Change",
    "AC Service",
  ];

  final List<String> _namesGrage = const [
    "Falcon Car Care Garage",
    "Al Noor Auto Care",
    "Al Noor Auto Care",
  ];

  final List<String> _imagesServices = const [
    "${_imgPath}service_1.jpg",
    "${_imgPath}service_2.jpg",
    "${_imgPath}service_3.jpg",
  ];

  final List<String> _imagesGrage = const [
    "${_imgPath}grage_1.jpg",
    "${_imgPath}grage_2.jpg",
    "${_imgPath}grage_3.jpg",
  ];

  late final List<ServicesModel> _services;
  late final List<OffersModel> _offers;
  late final List<GarageModel> _garages;

  // ===================== SERVICES =====================

  @override
  List<ServicesModel> loadServices() {
    _services = List.generate(
      _namesService.length,
      (index) => ServicesModel(
        id: index + 1,
        nameEn: _namesService[index],
        nameAr: _namesService[index],
        image: _imagesServices[index % _imagesServices.length],
      ),
    );

    log('Services loaded: ${_services.length}');
    return _services;
  }

  @override
  List<ServicesModel> filterServices(String query) {
    // ✅ لو ما تم تحميل الخدمات قبل، حمّليها
    if (!(_isServicesLoaded)) {
      loadServices();
    }

    if (query.trim().isEmpty) return _services;

    final q = query.toLowerCase().trim();
    return _services.where((s) {
      final name = (s.nameEn ?? '').toLowerCase();
      return name.contains(q);
    }).toList();
  }

  bool get _isServicesLoaded {
    try {
      // ignore: unnecessary_null_comparison
      return _services.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  // ===================== OFFERS =====================

  @override
  List<OffersModel> loadOffers() {
    _offers = List.generate(
      3,
      (index) => OffersModel(
        id: index + 1,
        nameEn: "Special Offer ${index + 1}",
        nameAr: "عرض خاص ${index + 1}",
        image: _imagesServices[index % _imagesServices.length],
      ),
    );

    log('Offers loaded: ${_offers.length}');
    return _offers;
  }

  // ===================== GARAGES =====================

  @override
  List<GarageModel> loadGrages() {
    _garages = List.generate(10, (index) {
      return GarageModel(
        id: index + 1,
        nameEn: _namesGrage[index % _namesGrage.length],
        nameAr: _namesGrage[index % _namesGrage.length],
        image: _imagesGrage[index % _imagesGrage.length], // ✅ الصورة من قائمة الجراجات
        reviewCount: 350,
        reviewStarsCount: 5,
        isTopService: true,
        city: "Amman",
        priceRange: "Price Range: AED 40 – 120",
      );
    });

    log('Garages loaded: ${_garages.length}');
    return _garages;
  }
}
