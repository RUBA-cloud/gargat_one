import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gragat/core/colors.dart';
import 'package:gragat/gragat/presentation/providers/HomeProvider/HomeProvider_notifier.dart';

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
                  color: const Color(0xFFFF7A00),
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

              return _OfferBanner(
                title: o.nameEn ?? o.nameAr ?? "Promotion Title goes here",
                imagePath: o.image ?? "assets/images/service_1.jpg",
                onTap: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}

class _OfferBanner extends StatelessWidget {
  const _OfferBanner({
    required this.title,
    required this.imagePath,
    required this.onTap,
  });

  final String title;
  final String imagePath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            SizedBox(
              width: 300, // ✅ عرض الكرت مثل الصورة
              height: double.infinity,
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),

            // ✅ teal overlay مثل الصورة
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      blackColor,
                      mainColor,
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  height: 1.1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
