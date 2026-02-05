

import 'package:gragat/core/shared_packages.dart' ;
import 'package:svg_image/svg_image.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.controller,
    this.hintText = "Search for the service or the garage",
    this.onChanged,
    this.onTapSearch,
  });

  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTapSearch;

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      
  
      child:     Expanded(
            child: CustomTextFilled(
                 controller: controller,
              hintText: hintText,
              onChanged: onChanged,
              suffixIcon: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: onTapSearch,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
              width: 40,
              height: 40,
              decoration: setBoxDecoration(
                color: lightBlueColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                child: SvgImage("assets/images/search.svg", type: PathType.assets, width: 30,height: 30,
                            
                ),
              ),
            
            
            ),
          ),
          
      )));
  }
}
