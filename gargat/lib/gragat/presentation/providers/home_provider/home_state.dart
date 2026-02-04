
import 'package:gragat/gragat/data/model/gragat_model.dart';
import 'package:gragat/gragat/data/model/offers_model.dart';
import 'package:gragat/gragat/data/model/services_model.dart';

class HomeState {
  final int selectedIndex;
  final List<ServicesModel> serviceList;
  final List<OffersModel> offerList;
  final List<GarageModel> grageList;

  final bool isLoadingServices;
  final bool isLoadingOffers;

  final String? error;

  const HomeState( {
    this.selectedIndex = 0,
    this.serviceList = const [],
    this.offerList = const [],
    this.isLoadingServices = false,
    this.isLoadingOffers = false,
    this.grageList =const[],
    this.error,
  });

  HomeState copyWith({
    int? selectedIndex,
    List<ServicesModel>? serviceList,
    List<OffersModel>? offerList,
        List<GarageModel>? grageList,

    bool? isLoadingServices,
    bool? isLoadingOffers,
    String? error,
  }) {
    return HomeState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      serviceList: serviceList ?? this.serviceList,
      offerList: offerList ?? this.offerList,
      isLoadingServices: isLoadingServices ?? this.isLoadingServices,
      isLoadingOffers: isLoadingOffers ?? this.isLoadingOffers,
      grageList: grageList?? this.grageList,
      error: error,
    );
  }
}
