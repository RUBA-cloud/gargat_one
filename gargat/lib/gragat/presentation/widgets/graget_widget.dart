
import 'package:gragat/core/shared_packages.dart';
import 'package:gragat/gragat/presentation/widgets/garage_card.dart';
import '../providers/home_provider/home_notifier.dart';

class GragetWidget extends ConsumerWidget {
  const GragetWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(HomeProvider);
    final notifier = ref.read(HomeProvider.notifier);

    if (state.grageList.isEmpty) {
      Future.microtask(() => notifier.loadGrages());
    }

    final grageList = state.grageList;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
      
          
             Row(
              children: [
                Text(
                  "Garages ",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: iconColor,
                        fontWeight: FontWeight.w800,
                      ),
                ),
                Text(
                  "Available Now",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: const Color(0xFF0D6E6E),
                        fontWeight: FontWeight.w800,
                      ),
                ),
                const Spacer(),
                Icon(Icons.arrow_forward, color: iconColor),
              ],
            
          ),
      
          const SizedBox(height: 8),
          Row(
        children: [
      Text(
        "Filters",
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: darkGray
            ),
      ),
      const SizedBox(width: 12),
      
      Expanded(
        child: _filterDropDown(
          context: context,
          value: "Service Type",
          items: const ["Service Type", "Oil Change", "Car Wash", "Detailing"],
          onChanged: (v) {},
        ),
      ),
      const SizedBox(width: 10),
      Expanded(
        child: _filterDropDown(
          context: context,
          value: "Review Score",
          items: const ["Review Score", "5+", "4+", "3+"],
          onChanged: (v) {},
        ),
      ),
        ],
      ),
      SizedBox(height: 10,),
        
     GargatList(garageList: grageList,)
        ],
      ),
    );
  }
Widget _filterDropDown({
  required BuildContext context,
  required String value,
  required List<String> items,
  required ValueChanged<String?> onChanged,
}) {
  return Container(
    height: 38,
    padding: const EdgeInsets.symmetric(horizontal: 12),
    decoration: setBoxDecoration( color:whiteColor, borderRadius: BorderRadius.circular(10),borderColor: borderColor),
    
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: value,
        isExpanded: true,
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        items: items
            .map(
              (e) => DropdownMenuItem<String>(
                value: e,
                child: Text(
                  e,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: darkGray
                      ),
                ),
              ),
            )
            .toList(),
        onChanged: onChanged,
      ),
    ),
  );
}
}
