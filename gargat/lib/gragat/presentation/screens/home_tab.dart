
import 'package:gragat/gragat/presentation/screens/app_bar_widget.dart';
import 'package:gragat/gragat/presentation/widgets/custom_text_serach.dart';
import 'package:gragat/gragat/presentation/widgets/graget_widget.dart';
import 'package:gragat/gragat/presentation/widgets/offer_widget.dart';
import 'package:gragat/gragat/presentation/widgets/service_widget.dart';

import '../../../core/shared_packages.dart' ;

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
   

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

        GragetWidget(),
      ],
    );
  }
  
}
