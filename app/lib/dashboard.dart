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
      backgroundColor: AppTheme.colorGreyLight,
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
                  padding: const EdgeInsets.only(top: 300),
                  child: Center(
                    child: SizedBox(
                      width: 130,
                      child: TextButton(
                          style: buttonStyle(
                            backgroundColor: AppTheme.colorGreen,
                            foregroundColor: AppTheme.black,
                          ),
                          onPressed: () {},
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
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
                        const SizedBox(
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
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
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

            const SizedBox(
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
                    const SizedBox(
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
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
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
            const SizedBox(
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
                    const SizedBox(
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
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
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

            const SizedBox(
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
                    const SizedBox(
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
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
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
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "POPULAR",
              style: TextStyle(
                  color: AppTheme.colorGreen,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),

            const Text(
              "DESTINATIONS",
              style: TextStyle(
                  color: AppTheme.colorGreen,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "BROWSE BY ACTIVITIES",
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 20,
            ),

            Container(
                height: 5,
                width: 120,
                decoration: BoxDecoration(color: Colors.orange)),
            SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).width / 2,
                      child: Image.asset(
                        'assets/images/girl.png',
                        fit: BoxFit.cover,
                      ))),
            ),
            SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                      width: double.infinity,
                      child: Image.asset(
                        'assets/images/boy.png',
                        fit: BoxFit.cover,
                      ))),
            ),
            SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                      width: double.infinity,
                      child: Image.asset(
                        'assets/images/lalsaree.png',
                        fit: BoxFit.cover,
                      ))),
            ),

            SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                      width: double.infinity,
                      child: Image.asset(
                        'assets/images/boysTajmahal.png',
                        fit: BoxFit.cover,
                      ))),
            ),

            SizedBox(
              height: 20,
            ),

            // Black container
            Container(
              decoration: BoxDecoration(
                color: AppTheme.black,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "OUR TOUR PACKAGES",
                    style: TextStyle(
                        fontSize: 24,
                        color: AppTheme.colorGreen,
                        fontWeight: FontWeight.bold),
                  ),

                  SizedBox(
                    height: 15,
                  ),

                  Text(
                    "THE BEST RECOMMEDATION",
                    style: TextStyle(
                        color: AppTheme.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Container(
                      height: 5,
                      width: 120,
                      decoration: BoxDecoration(color: Colors.orange)),

                  SizedBox(
                    height: 38,
                  ),

                  // Separate Container
                  Container(
                    decoration: BoxDecoration(
                        color: AppTheme.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: SizedBox(
                                width: double.infinity,
                                child: Image.asset(
                                  'assets/images/car1.png',
                                  fit: BoxFit.cover,
                                ))),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "DELHI TO AGRA MATHURA",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              color: Colors.orange),
                        ),
                        Text(
                          "VRINDAVAN TOUR DZIRE",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              color: Colors.orange),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Icon(
                          Icons.lock_clock,
                          size: 35,
                          color: AppTheme.colorGreen,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "1 Days",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Explore Agra, Mathura, Vrindavan in comfort \n with Swift Dzire. Discover heritage,\n devotion, and beauty on a seamless \n journey.",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 45,
                        ),
                        Text(
                          "Start From",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "₹ 6,500",
                          style: TextStyle(
                              fontSize: 30,
                              color: AppTheme.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextButton(
                            style: buttonStyle(
                                backgroundColor: AppTheme.colorGreen,
                                foregroundColor: AppTheme.white,
                                paddingHorizontal: 25),
                            onPressed: () {},
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                "Book Now",
                                style: TextStyle(
                                    color: AppTheme.white, fontSize: 20),
                              ),
                            )),
                        SizedBox(
                          height: 45,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppTheme.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: SizedBox(
                                width: double.infinity,
                                child: Image.asset(
                                  'assets/images/car2.png',
                                  fit: BoxFit.cover,
                                ))),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Delhi Agra Mathura Vrindavan Journey by Ertiga",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              color: Colors.orange),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Icon(
                          Icons.lock_clock,
                          size: 35,
                          color: AppTheme.colorGreen,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "1 Days",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Embark on a serene Delhi-Agra-Mathura-Vrindavan\n journeyin an Ertiga, blending heritage, devotion, and comfort seamlessly.",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 45,
                        ),
                        Text(
                          "Start From",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "₹ 7,500",
                          style: TextStyle(
                              fontSize: 30,
                              color: AppTheme.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextButton(
                            style: buttonStyle(
                                backgroundColor: AppTheme.colorGreen,
                                foregroundColor: AppTheme.white,
                                paddingHorizontal: 25),
                            onPressed: () {},
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                "Book Now",
                                style: TextStyle(
                                    color: AppTheme.white, fontSize: 20),
                              ),
                            )),
                        SizedBox(
                          height: 45,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppTheme.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: SizedBox(
                                width: double.infinity,
                                child: Image.asset(
                                  'assets/images/car3.png',
                                  fit: BoxFit.cover,
                                ))),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Explore Delhi, Agra, Mathura, Vrindavan in",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              color: Colors.orange),
                        ),
                        Text(
                          " Style with Innova Crysta",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              color: Colors.orange),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Icon(
                          Icons.lock_clock,
                          size: 35,
                          color: AppTheme.colorGreen,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "1 Days",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Explore Delhi, Agra, Mathura, and Vrindavan in style with \nInnova Crysta – luxury, comfort, and unforgettable \nmemories await!",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 45,
                        ),
                        Text(
                          "Start From",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "₹ 11,500",
                          style: TextStyle(
                              fontSize: 30,
                              color: AppTheme.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextButton(
                            style: buttonStyle(
                                backgroundColor: AppTheme.colorGreen,
                                foregroundColor: AppTheme.white,
                                paddingHorizontal: 25),
                            onPressed: () {},
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                "Book Now",
                                style: TextStyle(
                                    color: AppTheme.white, fontSize: 20),
                              ),
                            )),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppTheme.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: SizedBox(
                                width: double.infinity,
                                child: Image.asset(
                                  'assets/images/car4.png',
                                  fit: BoxFit.cover,
                                ))),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Journey Through Delhi to Vrindavan in Tempo Traveller",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Colors.orange,
                          ),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Icon(
                          Icons.lock_clock,
                          size: 35,
                          color: AppTheme.colorGreen,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "1 Days",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Journey from Delhi to Agra and Vrindavan in a spacious Tempo Traveller – comfort, camaraderie, and memorable sights await!",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 45,
                        ),
                        Text(
                          "Start From",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "₹ 11,500",
                          style: TextStyle(
                              fontSize: 30,
                              color: AppTheme.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextButton(
                            style: buttonStyle(
                                backgroundColor: AppTheme.colorGreen,
                                foregroundColor: AppTheme.white,
                                paddingHorizontal: 25),
                            onPressed: () {},
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                "Book Now",
                                style: TextStyle(
                                    color: AppTheme.white, fontSize: 20),
                              ),
                            )),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "One-Day Delhi to Agra, Mathura, and Vrindavan Tour with IndiaTaxi Online",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Since 2012, IndiaTaxi Online has been your trusted travel partner, offering seamless and memorable journeys. Our specially curated Delhi to Agra, Mathura, and Vrindavan 1-Day Tour ensures you experience the perfect blend of history, spirituality, and comfort",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Tour Itinerary and Highlights",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Departure Time: 6:30 AM",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    "Pickup Point: Anywhere in Delhi",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    "Departure Time: 6:30 AM",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Detailed Schedule",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Morning Journey from Delhi to Agra",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                      "• Departure: Start your day early, departing from Delhi at\n  6:30 AM."),
                  Text(
                      "• Breakfast Stop: Enjoy breakfast at the scenic Yamuna\n  Expressway from 9:00 to 9:30 AM."),
                  Text(
                      "• Vrindavan: Continue your journey to Vrindavan, renowned for its vibrant spiritual energy. Pay homage at the Sri Banke Bihari Ji Temple and marvel at the exquisite beauty of Prem Mandir."),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Agra Tour",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "• Agra Fort: Arrive in Agra and explore the historic Agra\n  Fort, a UNESCO World Heritage Site."),
                  Text(
                      "• Shopping & Lunch Break: Take a short shopping break\n  followed by a delicious lunch from 1:00 PM to 2:00 PM."),
                  Text(
                      "• Taj Mahal & Sikandra: Post-lunch, visit the stunning\n  Taj Mahal, a symbol of love and architectural brilliance.\n  Then proceed to Sikandra, the resting place of Emperor\n  Akbar, known for its beautiful Mughal architecture."),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Drive to Mathura and Vrindavan",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "• Mathura: From Sikandra, head to Mathura, the birthplace\n  of Lord Krishna. Visit the Shri Krishna Janmabhoomi\n Temple, a sacred site revered by devotees."),
                  Text(
                      "• Vrindavan: Continue your journey to Vrindavan,\n  renowned for its vibrant spiritual energy. Pay homage at\n  the Sri Banke Bihari Ji Temple and marvel at the\n  exquisite beauty of Prem Mandir."),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Return Journey to Delhi",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "• After exploring Vrindavan, begin your return journey to\n  Delhi."),
                  Text(
                      "• Arrive in Delhi late evening, where we drop you off at\n  your hotel, home, or airport, bringing your day tour to a\n delightful close."),
                  SizedBox(
                    height: 35,
                  ),
                ],
              ),
            ),
            Text(
              "Places to Visit",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.colorGreen),
            ),

            Text(
              "Agra, Mathura , Vrindavan",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                height: 5,
                width: 120,
                decoration: BoxDecoration(color: Colors.orange)),
            SizedBox(
              height: 30,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 1, color: AppTheme.colorGrey)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox(
                            width: double.infinity,
                            child: Image.asset(
                              'assets/images/lalsadigirl.png',
                              fit: BoxFit.cover,
                            ))),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "The Taj Mahal",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "The Taj Mahal, an iconic white marble mausoleum, stands gracefully on the southern bank of the Yamuna River in Agra, India, symbolizing timeless beauty and love.",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
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
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 1, color: AppTheme.colorGrey)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox(
                            width: double.infinity,
                            child: Image.asset(
                              'assets/images/mathura.png',
                              fit: BoxFit.cover,
                            ))),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Agra Fort",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Agra Fort, a UNESCO World Heritage Site, is situated in Agra, Uttar Pradesh, just 2.5 km northwest of the iconic Taj Mahal. This magnificent fort showcases the grandeur of Mughal architecture and history.",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
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
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 1, color: AppTheme.colorGrey)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox(
                            width: double.infinity,
                            child: Image.asset(
                              'assets/images/dwarkaVillage.jpeg',
                              fit: BoxFit.cover,
                            ))),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Vrindavan",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Vrindavan, steeped in ancient history and deeply rooted in Hindu traditions, is a significant pilgrimage destination. According to the Mahabharata, it is the sacred place where Lord Krishna spent his enchanting childhood days, making it a revered site for devotees.",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),

            
          ],
        ),
      ),
    );
  }
}
