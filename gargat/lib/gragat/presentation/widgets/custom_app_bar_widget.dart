import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gragat/core/colors.dart';
import 'package:gragat/gragat/presentation/widgets/icons_widget.dart';

class CustomAppBarWidget extends ConsumerWidget {
  const CustomAppBarWidget({
    super.key,
    required this.title,
    this.onBack,
  });

  final String title;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: kToolbarHeight, // نفس ارتفاع AppBar
      child: _appBarWidget(context),
    );
  }

  Widget _appBarWidget(BuildContext context) => Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButtonWidget(
              icon: Icons.arrow_back,
              onTap: onBack ?? () => Navigator.of(context).pop(),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: mainColor, // تأكدي mainColor موجود عندك
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      );
}
