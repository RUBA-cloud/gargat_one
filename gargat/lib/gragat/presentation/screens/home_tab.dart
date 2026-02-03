import 'package:flutter/material.dart';
import 'package:gragat/core/colors.dart';
import 'package:gragat/core/styles.dart';
import 'package:gragat/gragat/presentation/widgets/custom_text_filled.dart';
import 'package:gragat/gragat/presentation/widgets/service_widget.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle subTextStyle = setTextStyle(
      color: iconColor,
      fontSize: 12,
      fontWight: FontWeight.w600,
    );

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        //const AppBarWidget(),

        Container(
          margin: const EdgeInsets.all(10),
          child: CustomTextFilled(
            controller: TextEditingController(),
            hintText: "Search for services or grage",
            suffixIcon: Container(
              width: 30,
              height: 30,
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: setBoxDecorstion(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                borderColor: lightBlueColor,
              ),
              child: const Center(
                child: Icon(Icons.search, size: 22, color: Colors.white),
              ),
            ),
          ),
        ),

        const SizedBox(height: 10),
        const ServicesWidget(),
        const SizedBox(height: 10),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text("Offers", style: subTextStyle),
        ),

        const SizedBox(height: 10),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text("Grages", style: subTextStyle),
              const SizedBox(width: 6),
              Text(
                "Avaliable Now",
                style: setTextStyle(
                  fontWight: FontWeight.w600,
                  color: mainColor,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }
  
}
