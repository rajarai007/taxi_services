import 'dart:async';
import 'package:app/utils/app_theme.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
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
                      backgroundColor: MaterialStateProperty.all(Colors.green),
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
            SizedBox(
              height: 450, // Increased height to allow space for the card
              child: Stack(
                children: [
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
                  // Text overlay on scrolling images
                  Positioned(
                    left: 20,
                    right: 20,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Delhi To Agra\nMathura\nVrindavan',
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
                  Center(
                      child: Padding(
                          padding: const EdgeInsets.only(top: 240),
                          child: SizedBox(
                            width: 140,
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.green),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'BOOK NOW',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ))),
                  // Footer Section: Amazing Destinations (Half Card)
                ],
              ),
            ),
            // The rest of the content (more cards)

            Card(
              margin: EdgeInsets.zero, // Remove margin
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Icon(Icons.public, size: 50, color: Colors.green),
                    SizedBox(height: 10),
                    Text(
                      'AMAZING DESTINATIONS',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Discover Amazing Destinations Filled with Wonder and Beauty!',
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.zero, // Remove margin
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Icon(Icons.public, size: 50, color: Colors.green),
                    SizedBox(height: 10),
                    Text(
                      'AMAZING DESTINATIONS',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Discover Amazing Destinations Filled with Wonder and Beauty!',
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
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



// class _DashboardPageState extends State<DashboardPage> {
//   final PageController _pageController = PageController();
//   int _currentPage = 0;
//   Timer? _timer;

//   final List<String> backgroundImages = [
//     'assets/images/women.png',
//     'assets/images/girl.png',
//     'assets/images/redwomen.png',
//     'assets/images/mathura.png',
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _startAutoScroll();
//   }

//   void _startAutoScroll() {
//     _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
//       setState(() {
//         if (_currentPage < backgroundImages.length - 1) {
//           _currentPage++;
//         } else {
//           _currentPage = 0;
//         }
//       });

//       _pageController.animateToPage(
//         _currentPage,
//         duration: const Duration(milliseconds: 800),
//         curve: Curves.easeInOut,
//       );
//     });
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // App header
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//               color: Colors.black,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Image.asset(
//                     "assets/images/Taxi-Logo.png",
//                     width: 150,
//                   ),
//                   TextButton(
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all(Colors.green),
//                       shape: MaterialStateProperty.all(
//                         RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                     ),
//                     onPressed: () {},
//                     child: const Padding(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                       child: Text(
//                         'BOOK NOW',
//                         style: TextStyle(fontSize: 12, color: Colors.white),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),

//             // Image carousel
//             SizedBox(
//               height: 400,
//               child: Stack(
//                 children: [
//                   PageView.builder(
//                     controller: _pageController,
//                     itemCount: backgroundImages.length,
//                     onPageChanged: (int page) {
//                       setState(() {
//                         _currentPage = page;
//                       });
//                     },
//                     itemBuilder: (context, index) {
//                       return Image.asset(
//                         backgroundImages[index],
//                         fit: BoxFit.cover,
//                       );
//                     },
//                   ),
//                   // Text overlay on scrolling images
//                   Positioned(
//                     left: 20,
//                     right: 20,
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 20, vertical: 20),
//                       child: const Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text(
//                             'Delhi To Agra\nMathura\nVrindavan',
//                             style: TextStyle(
//                               fontSize: 50,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                           Text(
//                             'Book Agra tour now! Starting at ₹6000 for unforgettable memories',
//                             style: TextStyle(
//                               fontSize: 18,
//                               color: Colors.white,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   // Book Now button
//                   Center(
//                       child: Padding(
//                           padding: const EdgeInsets.only(top: 240),
//                           child: SizedBox(
//                             width: 140,
//                             child: TextButton(
//                               style: ButtonStyle(
//                                 backgroundColor:
//                                     MaterialStateProperty.all(Colors.green),
//                                 shape: MaterialStateProperty.all(
//                                   RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(12),
//                                   ),
//                                 ),
//                               ),
//                               onPressed: () {},
//                               child: const Padding(
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 5, vertical: 5),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       'BOOK NOW',
//                                       style: TextStyle(
//                                           fontSize: 15, color: Colors.white),
//                                     ),
//                                     Icon(
//                                       Icons.arrow_forward_ios_outlined,
//                                       color: AppTheme.white,
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ))),
//                   // Footer Section: Amazing Destinations
//                 ],
//               ),
//             ),
//             const Card(
//               margin: EdgeInsets.all(16),
//               child: Padding(
//                 padding: EdgeInsets.all(16),
//                 child: Column(
//                   children: [
//                     Icon(Icons.public, size: 50, color: Colors.green),
//                     SizedBox(height: 10),
//                     Text(
//                       'AMAZING DESTINATIONS',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       'Discover Amazing Destinations Filled with Wonder and Beauty!',
//                       style: TextStyle(fontSize: 14),
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const Card(
//               margin: EdgeInsets.all(16),
//               child: Padding(
//                 padding: EdgeInsets.all(16),
//                 child: Column(
//                   children: [
//                     Icon(Icons.public, size: 50, color: Colors.green),
//                     SizedBox(height: 10),
//                     Text(
//                       'AMAZING DESTINATIONS',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       'Discover Amazing Destinations Filled with Wonder and Beauty!',
//                       style: TextStyle(fontSize: 14),
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const Card(
//               margin: EdgeInsets.all(16),
//               child: Padding(
//                 padding: EdgeInsets.all(16),
//                 child: Column(
//                   children: [
//                     Icon(Icons.public, size: 50, color: Colors.green),
//                     SizedBox(height: 10),
//                     Text(
//                       'AMAZING DESTINATIONS',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       'Discover Amazing Destinations Filled with Wonder and Beauty!',
//                       style: TextStyle(fontSize: 14),
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
