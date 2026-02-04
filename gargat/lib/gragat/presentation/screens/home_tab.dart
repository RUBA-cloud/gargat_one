
import 'package:gragat/gragat/presentation/screens/app_bar_widget.dart';
import 'package:gragat/gragat/presentation/widgets/custom_text_serach.dart';
import 'package:gragat/gragat/presentation/widgets/offer_widget.dart';
import 'package:gragat/gragat/presentation/widgets/service_widget.dart';

import '../../../core/shared_packages.dart' ;

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle subTextStyle = setTextStyle(
      color: iconColor,
      fontSize: 18,
      fontWight: FontWeight.w600,
    );

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const AppBarWidget(),

        
        CustomSearchBar(controller: TextEditingController(),),

        const SizedBox(height: 10),
        const ServicesWidget(),
        const SizedBox(height: 20),
        OffersWidget(),

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
                  fontSize: 13,
                ),
              ),
              Icon(Icons.next_plan_rounded,color: Colors.red,)
            ],
          ),
        ),
        Row(children: [

          Text("Fliter")
        ],),

        const SizedBox(height: 20),
      ],
    );
  }
  
}
