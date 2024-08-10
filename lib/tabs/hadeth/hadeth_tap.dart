import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_new_test/tabs/hadeth/hadeth.dart';
import 'package:flutter_new_test/tabs/hadeth/hadeth_details_screen.dart';

class HadethTap extends StatefulWidget {
  static const String routeName = "HadethTap";

  @override
  State<HadethTap> createState() => _HadethTapState();
}

class _HadethTapState extends State<HadethTap> {
  List<Hadeth> ahadeth = [];
  @override
  Widget build(BuildContext context) {
    if (ahadeth.isEmpty) {
      loadAhadethFile();
    }
    return Column(
      children: [
        Image.asset(
          "assets/images/hadeth_logo.png",
          height: MediaQuery.of(context).size.height * 0.25,
        ),
        SizedBox(
          height: 12,
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (_, index) => GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(
                HadethDetailsScreen.routeName,
                arguments: ahadeth[index],
              ),
              child: Text(
                ahadeth[index].title,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
            ),
            separatorBuilder: (_, __) => SizedBox(
              height: 12,
            ),
            itemCount: ahadeth.length,
          ),
        )
      ],
    );
  }

  Future<void> loadAhadethFile() async {
    String ahadethFileContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> ahadethText = ahadethFileContent.split('#');
    ahadeth = ahadethText.map((hadethText) {
      List<String> hadethLines = hadethText.trim().split("\n");
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      List<String> content = hadethLines;
      return Hadeth(title: title, content: content);
    }).toList();
    setState(() {
      
    });
  }
}
