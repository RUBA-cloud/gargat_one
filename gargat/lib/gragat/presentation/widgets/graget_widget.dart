
import 'package:gragat/core/shared_packages.dart';
import 'package:gragat/gragat/data/model/gragat_model.dart';
import '../providers/HomeProvider/HomeProvider_notifier.dart';

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
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(), // لأنك داخل Column
            itemCount: grageList.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final g = grageList[index];
              return garageCard(context, g);
            },
          ),
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
                        color: grayColor
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
  Widget garageCard(BuildContext context, GarageModel model) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: setBoxDecoration(color: lightBlue,borderRadius: BorderRadius.circular(16)),
       
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ Image + Fav
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(
                    model.image ?? 'assets/images/garage_1.jpg',
                    width: 92,
                    height: 160,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: setBoxDecoration(color: whiteColor,borderRadius: BorderRadius.circular(10) ),
                   
                    child:  Icon(
                      Icons.favorite_border_rounded,
                      size: 18,
                      color: mainColor
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(width: 12),

            // ✅ Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                       Icon(Icons.star_rounded,
                          size: 18, color: yellowColor),
                      const SizedBox(width: 4),
                      Text(
                        (model.reviewStarsCount ?? 0).toString(),
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: mainColor,
                            ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '(${model.reviewCount ?? 0} reviews)',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: hintColor,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  Text(
                    model.nameEn ?? '-',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: mainColor
                        ),
                  ),

                  const SizedBox(height: 8),

                  if (model.isTopService == true) ...[
                    Text(
                      "Top Services:",
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: const Color(0xFF0D6E6E),
                          ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Oil Change • Detailing • AC Service",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: lightBlueColor,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],

                  const SizedBox(height: 8),

                  Text(
                    model.priceRange ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                       color: hintColor,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    model.city ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: hintColor,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
