import 'package:flutter/material.dart';

import '../../../../../utils/navigation.dart';

class ThemeSheet extends StatelessWidget {
  const ThemeSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SizedBox(
      height: 350,
      child: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () {
                navigatePop(context: context);
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white,width: 3)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Dark",style: theme.textTheme.labelLarge,),
                    const Icon(Icons.check_rounded,color: Colors.white,size: 25,)
                  ],
                ),
              ),
            ),

            const SizedBox(height: 50,),
            GestureDetector(
                onTap: () {
                  navigatePop(context: context);
                },
                child: Text("Light",style: theme.textTheme.labelLarge))
          ],
        ),
      ),
    );
  }
}
