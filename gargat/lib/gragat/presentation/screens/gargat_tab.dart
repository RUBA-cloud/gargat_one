

import 'package:gragat/core/shared_packages.dart';
import 'package:gragat/gragat/presentation/widgets/custom_text_serach.dart';
import 'package:gragat/gragat/presentation/widgets/garage_card.dart';
import '../providers/home_provider/home_notifier.dart';

class GargatTab extends ConsumerWidget {
  const GargatTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(HomeProvider);
    final notifier = ref.read(HomeProvider.notifier);

    // ✅ تحميل مرة واحدة (ما رح يعيدها إذا صار في بيانات)
    if (state.grageList.isEmpty) {
      Future.microtask(() => notifier.loadGrages());
    }

    final grageList = state.grageList;

    return SafeArea(
      child: ListView(
        children: [
          const SizedBox(height: 8),

          // ✅ Header: Back + Title centered
        
CustomAppBarWidget(title: "Garagat"),
          const SizedBox(height: 5),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Explore verified garages and book services with confidence",
              style: setTextStyle(
                fontWight: FontWeight.normal,
                fontSize: 14,
                color: mainColor,
              ),
            ),
          ),

          const SizedBox(height: 10),

          // ✅ بدون Controller (مناسب لـ Stateless)
          CustomSearchBar(
            hintText: "Enter the name of the Garage",
            onChanged: (value) {
              // لو عندك فلترة في notifier
              // notifier.searchGarages(value);
            },
            onTapSearch: () {
              // إذا بدك زر البحث يشتغل
              // notifier.searchGarages(state.searchText);
            }, controller: TextEditingController(),
          ),

          const SizedBox(height: 5),

          // ✅ List
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: GargatList(garageList: grageList),
          ),
        ],
      ),
    );
  }
}
