import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String _location = 'Pune';
  double _temperature = 0.0;
  String _description = '';
  int _humidity = 0;
  double _windSpeed = 0.0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchWeatherData();
  }

  Future<void> _fetchWeatherData() async {
    try {
      Position position = await _getLocation();
      final response = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=YOUR_API_KEY&units=metric'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _location = data['name'];
          _temperature = data['main']['temp'];
          _description = data['weather'][0]['description'];
          _humidity = data['main']['humidity'];
          _windSpeed = data['wind']['speed'];
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      print('Error getting weather data: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<Position> _getLocation() async {
    try {
      return await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    } catch (e) {
      print('Error getting location: $e');
      throw Exception('Failed to get location');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Location: $_location',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Temperature: $_temperature°C',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Description: $_description',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Humidity: $_humidity%',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Wind Speed: $_windSpeed m/s',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
    );
  }
}
