
import 'package:gragat/core/contsant.dart';
import 'package:gragat/core/shared_packages.dart';
import 'package:gragat/gragat/presentation/providers/home_provider/home_notifier.dart';
import 'package:gragat/gragat/presentation/screens/gargat_tab.dart';
import 'package:gragat/gragat/presentation/screens/home_tab.dart' show HomeTab;

import 'package:svg_image/svg_image.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(HomeProvider);
    final notifier = ref.read(HomeProvider.notifier);

    final pages = <Widget>[
      const HomeTab(),
      const Center(child: Text('My Cars')),
      const Center(child: Text('Services')),
      GargatTab(),
      const Center(child: Text('Profile')),
    ];

    final selectedIndex = state.selectedIndex.clamp(0, pages.length - 1);

    return Scaffold(
      body: SafeArea(child: pages[selectedIndex]),

      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Container(
            height: 67,
            decoration: setBoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: blackColor.withOpacity(0.18),
                  blurRadius: 14,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              children: [
                _NavItem(
                  index: 0,
                  label: 'Home',
                  icon: Icons.home_filled,
                  selectedIndex: selectedIndex,
                  onTap: notifier.setSelectedIndex,
                  svgAsset: '$assetsImage/home.svg',
                ),
                _NavItem(
                  index: 1,
                  label: 'My Cars',
                  icon: Icons.directions_car_filled_rounded,
                  selectedIndex: selectedIndex,
                  onTap: notifier.setSelectedIndex,
                     svgAsset: '$assetsImage/car.svg',
                ),
                _NavItem(
                  index: 2,
                  label: 'Services',
                  icon: Icons.room_service_rounded,
                  selectedIndex: selectedIndex,
                  onTap: notifier.setSelectedIndex,
                  svgAsset:'$assetsImage/setting.svg',
                ),
                _NavItem(
                  index: 3,
                  label: 'Garages',
                  icon: Icons.home_repair_service_rounded,
                  selectedIndex: selectedIndex,
                  onTap: notifier.setSelectedIndex,
                  
                  svgAsset: '$assetsImage/house-2.svg',
                ),
                _NavItem(
                  index: 4,
                  label: 'Profile',
                  icon: Icons.person_rounded,
                  selectedIndex: selectedIndex,
                  onTap: notifier.setSelectedIndex,
                  svgAsset: null, // ✅ بدون SVG
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.index,
    required this.label,
    required this.icon,
    required this.selectedIndex,
    required this.onTap,
    required this.svgAsset,
  });

  final int index;
  final String label;
  final IconData icon;
  final int selectedIndex;
  final ValueChanged<int> onTap;
  final String? svgAsset;

  @override
  Widget build(BuildContext context) {
    final bool isSelected = selectedIndex == index;

    Widget iconWidget;

    // ✅ لو في SVG استخدميه، لو لا استخدمي Icon عادي
    if (svgAsset != null && svgAsset!.isNotEmpty) {
      iconWidget = isSelected
          ? GradientIcon(
              svgImage: svgAsset, // GradientIcon لازم يدعم null؟ هنا مش null
              icon: icon,
              size: 22,
              gradient: linearGradient,
            )
          : SvgImage(
              svgAsset!,
              type: PathType.assets,
              // لو نسختك تدعم color:
              color: whiteColor,
              // وإلا احذفي color
              // width: 22,
              // height: 22,
            );
    } else {
      // ✅ fallback بدون SVG
      iconWidget = Icon(
        icon,
        size: 22,
        color: isSelected ? whiteColor : whiteColor,
      );
    }

    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () => onTap(index),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              iconWidget,
              const SizedBox(height: 4),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 11,
                  height: 1,
                  fontWeight: FontWeight.w600,
                  color: whiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
