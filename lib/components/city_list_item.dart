import "package:flutter/material.dart";
import "package:mozc_flutter_bootcamp_23_showcase/models/weather.dart";
import "package:mozc_flutter_bootcamp_23_showcase/utils/units.dart";

class CityListItem extends StatelessWidget {
  final String location;
  final double temperature;
  final WeatherStatus status;
  final String iconId;

  final String cityIdentifier;
  final String preferredCityIdentifier;
  final void Function(String?) onPress;

  const CityListItem({
    super.key,
    required this.location,
    required this.temperature,
    required this.status,
    required this.iconId,
    required this.cityIdentifier,
    required this.preferredCityIdentifier,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    final temperature = convertKelvinToCelsius(this.temperature);

    return ListTile(
      title: Text(location),
      subtitle: Text("${temperature.toStringAsFixed(1)}°C - ${status.asHumanReadable()}"),
      leading: Image(
        image: AssetImage("assets/icons/$iconId.png"),
        width: 48,
        height: 48,
        filterQuality: FilterQuality.high,
      ),
      trailing: Radio(
        value: cityIdentifier,
        groupValue: preferredCityIdentifier,
        onChanged: onPress,
      ),
      onTap: () => onPress.call(cityIdentifier),
    );
  }
}
