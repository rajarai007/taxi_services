import 'dart:async';
import 'package:app/utils/app_theme.dart';
import 'package:app/utils/base_class.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends BaseClass<DashboardPage> {
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
      setState(() {
        if (_currentPage < backgroundImages.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
      });

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // App header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/Taxi-Logo.png",
                    width: 150,
                  ),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(17, 152, 100, 1)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Text(
                        'BOOK NOW',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),

            // Image carousel
            Stack(
              children: [
                SizedBox(
                  height: 450,
                  child: PageView.builder(
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
                ),
                // Text overlay on scrolling images
                Positioned(
                  left: 20,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Delhi To Agra',
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Mathura',
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Vrindavan',
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
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
                ),
                // Book Now button

                Padding(
                  padding: const EdgeInsets.only(top: 340),
                  child: Center(
                    child: SizedBox(
                      width: 130,
                      child: TextButton(
                          style: buttonStyle(
                            backgroundColor: AppTheme.colorGreen,
                            foregroundColor: AppTheme.black,
                          ),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Book Now",
                                  style: TextStyle(color: AppTheme.white),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: AppTheme.white,
                                )
                              ],
                            ),
                          )),
                    ),
                  ),
                ),

                // Center(
                //     child: Padding(
                //         padding: const EdgeInsets.only(top: 300),
                //         child: SizedBox(
                //           width: 140,
                //           child: TextButton(
                //             style: ButtonStyle(
                //               backgroundColor: MaterialStateProperty.all(
                //                   const Color.fromRGBO(17, 152, 100, 1)),
                //               shape: MaterialStateProperty.all(
                //                 RoundedRectangleBorder(
                //                   borderRadius: BorderRadius.circular(12),
                //                 ),
                //               ),
                //             ),
                //             onPressed: () {},
                //             child:
                //           )
                //         ))),
                // The rest of the content (more cards),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppTheme.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.only(top: 380),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Image.asset(
                          "assets/images/travel.png",
                          width: 120,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'AMAZING DESTINATIONS',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Discover Amazing Destinations Filled with Wonder and Beauty!',
                            style: TextStyle(fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: const BoxDecoration(
                              color: AppTheme.colorGreen,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12))),
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      "assets/images/hasslefree.png",
                      width: 120,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Hassle Free Trips',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Enjoy Hassle-Free Trips with Comfort and Ease!',
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: const BoxDecoration(
                          color: AppTheme.colorGreen,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12))),
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      "assets/images/calendert.png",
                      width: 120,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Super Fast Booking',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Super Fast Booking: Call or WhatsApp Instantly Now!',
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: const BoxDecoration(
                          color: AppTheme.colorGreen,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12))),
                      height: 10,
                    )
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      "assets/images/suitcase.png",
                      width: 120,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Friendly tour guide',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Explore with a Knowledgeable and Friendly Tour Guide!',
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: const BoxDecoration(
                          color: AppTheme.colorGreen,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12))),
                      height: 10,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
