import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gragat/core/colors.dart';
import 'package:gragat/gragat/presentation/providers/HomeProvider/HomeProvider_notifier.dart';
import 'package:gragat/gragat/presentation/widgets/basic_services_widget.dart';


class ServicesWidget extends ConsumerWidget {
  const ServicesWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(HomeProvider);
    final notifier = ref.read(HomeProvider.notifier);

    if ((state.serviceList ).isEmpty) {
      Future.microtask(() => notifier.loadServices());
    }

    final services = state.serviceList ;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Services",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: iconColor,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
        const SizedBox(height: 10),
 Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AspectRatio(
            aspectRatio: 1.65, // عدّليها لو بدك أعلى/أقصر (مثلاً 1.4 أو 1.9)
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: services.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // ✅ صفّين
                crossAxisSpacing: 5,
                mainAxisSpacing: 4,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                final s = services[index];
                return BasicServicestDesign(
                  title: s.nameEn ?? s.nameAr ?? '-',
                  imagePath: s.image ?? '',
                  onTap: () {},
                );
              },
            ),
          ),
        ),
        // ✅ Horizontal scroll بدون height ثابت
        
      ],
    );
  }
}
