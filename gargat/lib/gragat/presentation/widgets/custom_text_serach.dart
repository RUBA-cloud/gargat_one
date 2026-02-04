

import 'package:gragat/core/shared_packages.dart' ;

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

      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      
  
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
              child:  Icon(
                Icons.search_rounded,
                color:whiteColor,
                size: 22,
              ),
            
            
            ),
          ),
          
      )));
  }
}
