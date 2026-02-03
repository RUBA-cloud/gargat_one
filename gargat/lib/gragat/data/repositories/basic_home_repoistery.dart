import 'dart:developer';

import 'package:gragat/gragat/data/model/offers_model.dart';
import 'package:gragat/gragat/data/model/services_model.dart';
/// ✅ Repository contract
abstract class HomeRepository {
  List<ServicesModel> loadServices();
  List<OffersModel> loadOffers();
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

  final List<String> _imagesServices = const [
    "${_imgPath}service_1.jpg",
    "${_imgPath}service_2.jpg",
    "${_imgPath}service_3.jpg",
  ];

  late final List<ServicesModel> _services;
  late final List<OffersModel> _offers;

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
    if (query.isEmpty) return _services;

    return _services.where((s) {
      final name = s.nameEn ?? '';
      return name.toLowerCase().contains(query.toLowerCase());
    }).toList();
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
}
