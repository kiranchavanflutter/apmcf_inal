import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final String apiKey =
      'YOUR_OPENWEATHERMAP_API_KEY'; // Replace with your API key
  String location = '';
  double latitude = 0.0;
  double longitude = 0.0;
  Map<String, dynamic>? weatherData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    /*try {
     /*Positioned position = await Geolocator.switch (expression) {
       pattern => valu
     } getCurrentPosition(
      desiredAccuracy:LocationAccuracy.high);
      setState(() {
        latitude = position.latitude;
        longitude = position.longitude;
        location ='(${latitude.toStringAsFixed(2)}, ${longitude.toStringAsFixed(2)})';
      */});
      _getWeatherData();
    } catch (e) {
      //print('Error getting location: $e');
      setState(() {
        isLoading = false;
      });
    }*/
  }

  Future<void> _getWeatherData() async {
    try {
      final response = await http.get(
          'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric'
              as Uri);
      if (response.statusCode == 200) {
        setState(() {
          weatherData = Map<String, dynamic>.from(response.body as Map);
        });
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      //print('Error getting weather data: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : weatherData != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Location: $location',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Temperature: ${weatherData!['main']['temp']}°C',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Description: ${weatherData!['weather'][0]['description']}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Humidity: ${weatherData!['main']['humidity']}%',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Wind Speed: ${weatherData!['wind']['speed']} m/s',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                      _buildWeatherIcon(weatherData!['weather'][0]['icon']),
                    ],
                  )
                : const Center(
                    child: Text('Failed to fetch weather data.'),
                  ),
      ),
    );
  }

  Widget _buildWeatherIcon(String iconCode) {
    return Image.network(
      'https://openweathermap.org/img/wn/$iconCode.png',
      width: 100,
      height: 100,
    );
  }
}

mixin latitude {}

class Geolocator {}
