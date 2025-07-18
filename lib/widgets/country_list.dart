import 'package:flutter/material.dart';
import 'package:travel_picks/widgets/country_card.dart';

class CountryList extends StatelessWidget {
  final List<Map<String, String>> countryList;
  final void Function(String) onAddCountry;

  const CountryList({
    super.key,
    required this.countryList,
    required this.onAddCountry,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: countryList
            .map(
              (country) => CountryCard(
                emoji: country["emoji"]!,
                name: country["name"]!,
                onTap: () => onAddCountry(country["name"]!),
              ),
            )
            .toList(),
      ),
    );
  }
}
