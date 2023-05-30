import 'package:flutter/material.dart';

import 'main.utils.dart';
import 'news/news.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(title: appName),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required String title});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;

    if (_selectedIndex == DestinationLabels.home.index) {
      page = const MainPage();
    } else if (_selectedIndex == DestinationLabels.news.index) {
      page = const NewsPage();
    } else if (_selectedIndex == DestinationLabels.quote.index) {
      page = const Placeholder();
    } else {
      throw UnimplementedError('no widget for $_selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                minExtendedWidth: 150,
                extended: constraints.maxWidth >= 600,
                destinations: [
                  NavigationRailDestination(
                    icon: const Icon(Icons.home_outlined),
                    label: Text(DestinationLabels.home.name),
                    selectedIcon: const Icon(Icons.home_sharp),
                  ),
                  NavigationRailDestination(
                    icon: const Icon(Icons.feed_outlined),
                    label: Text(DestinationLabels.news.name),
                    selectedIcon: const Icon(Icons.feed_sharp),
                  ),
                  NavigationRailDestination(
                    icon: const Icon(Icons.format_quote_outlined),
                    label: Text(DestinationLabels.quote.name),
                    selectedIcon: const Icon(Icons.format_quote_sharp),
                  ),
                ],
                selectedIndex: _selectedIndex,
                onDestinationSelected: (value) => {
                  setState(() {
                    _selectedIndex = value;
                  })
                },
              ),
            ),
            const VerticalDivider(
              thickness: 1,
              width: 1,
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            )
          ],
        ),
      );
    });
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Card(
        child: Column(
          children: [
            FunImage(),
            FunText(),
          ],
        ),
      ),
    );
  }
}
