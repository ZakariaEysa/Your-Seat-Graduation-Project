import 'package:flutter/material.dart';

class PersonalInfoCard extends StatelessWidget {
  final String icon;
  final String title;
  final String info;

  const PersonalInfoCard({super.key,
    required this.icon,
    required this.title,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 15,right: 15),
      child: Row(
        children: [
          ImageIcon(AssetImage(icon,),size: 25,color: Colors.white,),
          const SizedBox(width: 18,),
          Text(title,style: theme.textTheme.titleLarge,),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(info,style: theme.textTheme.bodyMedium,overflow: TextOverflow.ellipsis,maxLines: 1,),
          )
        ],
      ),
    );
  }
}
