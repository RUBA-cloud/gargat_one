import 'package:gragat/core/shared_packages.dart';
import 'package:gragat/gragat/data/model/gragat_model.dart';

class GargatList extends StatelessWidget {
  final List<GarageModel> garageList;

  const GargatList({
    super.key,
    required this.garageList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: garageList.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final g = garageList[index];
        return _garageCard(context, g);
      },
    );
  }

  Widget _garageCard(BuildContext context, GarageModel model) {
    final theme = Theme.of(context);

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: setBoxDecoration(
          color: lightBlue,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ Image + Fav
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(
                    (model.image?.isNotEmpty ?? false)
                        ? model.image!
                        : 'assets/images/garage_1.jpg',
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
                    decoration: setBoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.favorite_border_rounded,
                      size: 18,
                      color: mainColor,
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
                      Icon(Icons.star_rounded, size: 18, color: yellowColor),
                      const SizedBox(width: 4),
                      Text(
                        (model.reviewStarsCount ?? 0).toString(),
                        style: theme.textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: darkGray,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '(${model.reviewCount ?? 0} reviews)',
                        style: theme.textTheme.labelSmall?.copyWith(
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
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: mainColor,
                    ),
                  ),

                  const SizedBox(height: 8),

                  if (model.isTopService == true) ...[
                    Text(
                      "Top Services:",
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: mainColor,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Oil Change • Detailing • AC Service",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall?.copyWith(
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
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: hintColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    model.city ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall?.copyWith(
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
