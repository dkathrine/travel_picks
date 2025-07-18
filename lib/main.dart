import 'package:flutter/material.dart';
import 'package:travel_picks/widgets/title_widget.dart';
import 'package:travel_picks/widgets/country_list.dart';
import 'package:travel_picks/widgets/new_widget_hide_btn.dart';

void main() {
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Travel Picks")),
        body: const TravelHomePage(),
        bottomNavigationBar: NavigationBar(
          destinations: const <Widget>[
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(icon: Icon(Icons.search), label: "Suche"),
            NavigationDestination(icon: Icon(Icons.person), label: "Profil"),
          ],
        ),
      ),
    );
  }
}

//TravelHomePage
class TravelHomePage extends StatefulWidget {
  const TravelHomePage({super.key});

  @override
  State<TravelHomePage> createState() => _TravelHomePageState();
}

class _TravelHomePageState extends State<TravelHomePage> {
  final List<String> _selectedCountries = [];
  bool _euListVisible = true;
  bool _saListVisible = true;

  void _addCountry(String countryName) {
    if (!_selectedCountries.contains(countryName)) {
      setState(() {
        _selectedCountries.add(countryName);
      });
    }
  }

  void _toggleEUListVisibility() {
    setState(() {
      _euListVisible = !_euListVisible;
    });
  }

  void _toggleSAListVisibility() {
    setState(() {
      _saListVisible = !_saListVisible;
    });
  }

  static final List<Map<String, String>> europeCountries = [
    {"emoji": "🇮🇹", "name": "Italien"},
    {"emoji": "🇪🇸", "name": "Spanien"},
    {"emoji": "🇩🇪", "name": "Deutschland"},
    {"emoji": "🇫🇷", "name": "Frankreich"},
    {"emoji": "🇳🇴", "name": "Norwegen"},
  ];

  static final List<Map<String, String>> southAmericaCountries = [
    {"emoji": "🇧🇷", "name": "Brasilien"},
    {"emoji": "🇦🇷", "name": "Argentinien"},
    {"emoji": "🇨🇱", "name": "Chile"},
    {"emoji": "🇵🇪", "name": "Peru"},
    {"emoji": "🇨🇴", "name": "Kolumbien"},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 4,
            color: Colors.lightBlueAccent,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                "🌎 Willkommen zu deinen Reiseinspirationen",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
          Row(
            children: [
              TitleWidget(title: 'Europa'),
              HideShowButton(
                isVisible: _euListVisible,
                onToggle: _toggleEUListVisibility,
              ),
            ],
          ),
          if (_euListVisible) ...{
            CountryList(
              countryList: europeCountries,
              onAddCountry: _addCountry,
            ),
          },
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TitleWidget(title: 'Südamerika'),
              HideShowButton(
                isVisible: _saListVisible,
                onToggle: _toggleSAListVisibility,
              ),
            ],
          ),
          if (_saListVisible) ...{
            CountryList(
              countryList: southAmericaCountries,
              onAddCountry: _addCountry,
            ),
          },
          TitleWidget(title: 'Favoriten'),
          Wrap(
            spacing: 8,
            children: _selectedCountries
                .map((name) => Chip(label: Text(name)))
                .toList(),
          ),
        ],
      ),
    );
  }
}
