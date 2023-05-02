import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: SearchFieldSample(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SearchFieldSample extends StatefulWidget {
  const SearchFieldSample({Key? key}) : super(key: key);

  @override
  State<SearchFieldSample> createState() => _SearchFieldSampleState();
}

class _SearchFieldSampleState extends State<SearchFieldSample> {
  List<String> suggestions = [
    'United States',
    'Germany',
    'Washington',
    'Paris',
    'Jakarta',
    'Australia',
    'India',
    'Czech Republic',
    'Lorem Ipsum',
  ];
  int suggestionsCount = 2;
  final focus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dynamic sample Demo'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              suggestionsCount++;
              suggestions.add('suggestion $suggestionsCount');
            });
          },
          child: Icon(Icons.add),
        ),
        body: Center(
          child: SearchField(
            key: const Key('searchfield'),
            hint: 'Search by country name',
            suggestions:
                suggestions.map((e) => SearchFieldListItem<String>(e)).toList(),
            focusNode: focus,
            suggestionState: Suggestion.expand,
            onSuggestionTap: (SearchFieldListItem<String> x) {
              focus.unfocus();
            },
          ),
        ));
  }
}
