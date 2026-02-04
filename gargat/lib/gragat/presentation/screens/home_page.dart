
import 'package:gragat/core/shared_packages.dart' ;
import 'package:gragat/gragat/presentation/providers/HomeProvider/HomeProvider_notifier.dart';
import 'package:gragat/gragat/presentation/screens/home_tab.dart' show HomeTab;

class HomePage  extends ConsumerWidget {
 const HomePage({super.key});
 

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(HomeProvider);
    final notifier = ref.read(HomeProvider.notifier);

    final pages = <Widget>[
      HomeTab(),
      const Center(child: Text('My Cars')),
      const Center(child: Text('Services')),
      const Center(child: Text('Garages')),
      const Center(child: Text('Profile')),
    ];

    return Scaffold(
      body: SafeArea(child: pages[state.selectedIndex]),

      // ✅ Custom bottom bar like the image
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Container(
            height: 67, // ✅ مثل الصورة (375x67)
            decoration: BoxDecoration(
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
                  selectedIndex: state.selectedIndex,
                  onTap: notifier.setSelectedIndex,
                ),
                _NavItem(
                  index: 1,
                  label: 'My Cars',
                  icon: Icons.directions_car_filled_rounded,
                  selectedIndex: state.selectedIndex,
                  onTap: notifier.setSelectedIndex,
                ),
                _NavItem(
                  index: 2,
                  label: 'Services',
                  icon: Icons.room_service_rounded,
                  selectedIndex: state.selectedIndex,
                  onTap: notifier.setSelectedIndex,
                ),
                _NavItem(
                  index: 3,
                  label: 'Garages',
                  icon: Icons.home_repair_service_rounded,
                  selectedIndex: state.selectedIndex,
                  onTap: notifier.setSelectedIndex,
                ),
                _NavItem(
                  index: 4,
                  label: 'Profile',
                  icon: Icons.person_rounded,
                  selectedIndex: state.selectedIndex,
                  onTap: notifier.setSelectedIndex,
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
  });

  final int index;
  final String label;
  final IconData icon;
  final int selectedIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final bool isSelected = selectedIndex == index;

    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () => onTap(index),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ✅ orange indicator (مثل الصورة فوق الأيقونة)
             

         isSelected?     GradientIcon(
               icon: icon,
                size: 22,
               gradient: linearGradient,
              ):Icon(icon,color: whiteColor,),
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
