import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gragat/core/shared_packages.dart';
import 'package:gragat/gragat/presentation/widgets/custom_text_serach.dart';
import 'package:gragat/gragat/presentation/widgets/garage_card.dart';
import 'package:gragat/gragat/presentation/widgets/icons_widget.dart';
import '../providers/home_provider/home_notifier.dart';

class GargatTab extends ConsumerStatefulWidget {
  const GargatTab({super.key});

  @override
  ConsumerState<GargatTab> createState() => _GargatTabState();
}

class _GargatTabState extends ConsumerState<GargatTab> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(HomeProvider);
    final notifier = ref.read(HomeProvider.notifier);

    // ✅ تحميل مرة واحدة إذا فاضي
    if (state.grageList.isEmpty) {
      Future.microtask(() => notifier.loadGrages());
    }

    final grageList = state.grageList;

    return SafeArea(
      child: ListView(
        children: [
          const SizedBox(height: 8),
      
          // ✅ Header: Back + Title centered
          Container(padding: EdgeInsets.symmetric(horizontal: 15),
            height: 44,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButtonWidget(
                    icon: Icons.arrow_back,
                    onTap: () => Navigator.of(context).maybePop(),
                  ),
                ),
                Text(
                  "Garages",
                  style: TextStyle(
                    color: mainColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
      
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
      
          CustomSearchBar(
            controller: _searchController,
            hintText: "Enter the name of the Garage",
            onTapSearch: () {
              // لو عندك فلترة في notifier:
              // notifier.searchGarages(_searchController.text);
            },
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
