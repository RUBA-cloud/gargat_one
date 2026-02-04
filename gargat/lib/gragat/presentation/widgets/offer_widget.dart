


import 'package:gragat/gragat/presentation/widgets/basic_services_widget.dart';

import '../../../core/shared_packages.dart' ;
import '../providers/HomeProvider/HomeProvider_notifier.dart';

class OffersWidget extends ConsumerWidget {
  const OffersWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(HomeProvider);
    final notifier = ref.read(HomeProvider.notifier);

    if ((state.offerList).isEmpty) {
      Future.microtask(() => notifier.loadOffers());
    }

    final offers = state.offerList;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Offers",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color:iconColor,
                  fontWeight: FontWeight.w800,
                ),
          ),
        ),
        const SizedBox(height: 10),

        SizedBox(
          height: 130, // ✅ نفس vibe الصورة
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: offers.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final o = offers[index];

              return BasicServicestDesign(
                
                title: o.nameEn ?? o.nameAr ?? "Promotion Title goes here",
                imagePath: o.image!,
                imageFillWidth: true,
                onTap: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}

