import 'package:flutter/material.dart';

class DestinationLabels {
  static LabelData home = LabelData('Home', 0);
  static LabelData news = LabelData('News', 1);
  static LabelData quote = LabelData('Quote', 2);
}

class LabelData {
  String name;
  int index;

  LabelData(this.name, this.index);
}

const String appName = 'Flutter Experiment #2';

class FunImage extends StatelessWidget {
  const FunImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
      ),
      child: Image.network(
        'https://picsum.photos/500',
      ),
    );
  }
}

class FunText extends StatelessWidget {
  const FunText({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 500,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(mainPageText),
      ),
    );
  }
}

const String mainPageText =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam pharetra maximus tellus, a lobortis elit. Aenean sit amet nisi in nisl aliquam feugiat id vel odio. ';
