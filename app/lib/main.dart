import 'package:app/dashboard.dart';
import 'package:app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: DashboardPage()));
}

class TravelApp extends StatefulWidget {
  @override
  _TravelAppState createState() => _TravelAppState();
}

class _TravelAppState extends State<TravelApp> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  final List<String> backgroundImages = [
    'assets/images/women.png',
    'assets/images/girl.png',
    'assets/images/redwomen.png',
    'assets/images/mathura.png',
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < backgroundImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  // void _launchWhatsApp() async {
  //   final url = 'https://wa.me/your_number';
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   }
  // }

  // void _launchCall() async {
  //   final url = 'tel:your_number';
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: AppTheme.colorGreyDark,
      //   actions: [],
      // ),
      body: Stack(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            12), // Adjust the value as needed
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Text(
                      'BOOK NOW',
                      style: TextStyle(fontSize: 18, color: AppTheme.white),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Background PageView
          PageView.builder(
            controller: _pageController,
            itemCount: backgroundImages.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              return Image.asset(
                backgroundImages[index],
                fit: BoxFit.cover,
              );
            },
          ),

          // Main Content
          SingleChildScrollView(
            child: Column(
              children: [
                // Logo
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Image.asset(
                    'assets/logo.png',
                    height: 60,
                  ),
                ),

                // Main Title
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: const Column(
                    children: [
                      Text(
                        'Delhi To Agra\nMathura\nVrindavan',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Book Agra tour now! Starting at ₹6000 for unforgettable memories',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                // Book Now Button
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'BOOK NOW',
                    style: TextStyle(fontSize: 18),
                  ),
                ),

                // Amazing Destinations Section
                Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/globe_icon.png',
                        height: 80,
                      ),
                      const Text(
                        'AMAZING DESTINATIONS',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Discover Amazing Destinations Filled with Adventure',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Floating Buttons
          Positioned(
            right: 20,
            bottom: 100,
            child: Column(
              children: [
                // Instant Call Back Button
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ElevatedButton(
                    // onPressed: _launchCall,
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8B4513),
                      padding: const EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.phone),
                        SizedBox(width: 8),
                        Text('Instant Call Back'),
                      ],
                    ),
                  ),
                ),

                // WhatsApp Button
                FloatingActionButton(
                  // onPressed: _launchWhatsApp,
                  onPressed: () {},
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.whatshot_sharp),
                ),

                // Call Button
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: FloatingActionButton(
                    // onPressed: _launchCall,
                    onPressed: () {},
                    backgroundColor: Colors.green,
                    child: const Icon(Icons.phone),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
