
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gragat/gragat/data/repositories/basic_home_repoistery.dart';
import 'package:gragat/gragat/presentation/providers/HomeProvider/HomeProvider_state.dart';

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return BasicHomeRepository();
});

// ignore: non_constant_identifier_names
final HomeProvider = NotifierProvider<HomeNotifier, HomeState>(HomeNotifier.new);

class HomeNotifier extends Notifier<HomeState> {
  late final HomeRepository _repo;

  @override
  HomeState build() {
    _repo = ref.read(homeRepositoryProvider);
    return const HomeState();
  }

  // ✅ Bottom nav
  void setSelectedIndex(int index) {
    state = state.copyWith(selectedIndex: index);
  }

  // ✅ Services
  void loadServices() {
    try {
      state = state.copyWith(isLoadingServices: true, error: null);
      final data = _repo.loadServices();
      state = state.copyWith(serviceList: data, isLoadingServices: false);
    } catch (e) {
      state = state.copyWith(isLoadingServices: false, error: e.toString());
    }
  }

  // ✅ Filter services
  void filterServices(String query) {
    try {
      final filtered = _repo.filterServices(query);
      state = state.copyWith(serviceList: filtered);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  // ✅ Offers
  void loadOffers() {
    try {
      state = state.copyWith(isLoadingOffers: true, error: null);
      final data = _repo.loadOffers();
      state = state.copyWith(offerList: data, isLoadingOffers: false);
    } catch (e) {
      state = state.copyWith(isLoadingOffers: false, error: e.toString());
    }
  }
}
