import 'package:flutter/material.dart';
import 'package:yourseatgraduationproject/utils/navigation.dart';

class LanguageSheet extends StatelessWidget {
  const LanguageSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return  SizedBox(
      height: 350,
      child: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white,width: 3)
              ),
              child: InkWell(
                onTap: (){
                  navigatePop(context: context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("English",style: theme.textTheme.labelLarge,),
                    const Icon(Icons.check_rounded,color: Colors.white,size: 25,)
                  ],
                ),
              ),
            ),

            const SizedBox(height: 50,),
            GestureDetector(
                onTap: (){
                  navigatePop(context: context);
                },
                child: Text("العربية",style: theme.textTheme.labelLarge))
          ],
        ),
      ),
    );
  }
}
