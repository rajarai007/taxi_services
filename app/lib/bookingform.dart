import 'package:app/utils/app_theme.dart';
import 'package:flutter/material.dart';

class BookingPopup extends StatefulWidget {
  final VoidCallback onClose;

  const BookingPopup({Key? key, required this.onClose}) : super(key: key);

  @override
  _BookingPopupState createState() => _BookingPopupState();
}

class _BookingPopupState extends State<BookingPopup> {
  final TextEditingController _dateController = TextEditingController();
  String? _selectedCar;
  final List<String> _carOptions = [
    'Swift Dzire',
    'Ertiga 7+1',
    'Innova Crysta',
    'Tempo'
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Booking Form',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: widget.onClose,
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Phone',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(
                labelText: 'Date',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                suffixIcon: const Icon(Icons.calendar_today),
              ),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  setState(() {
                    _dateController.text =
                        "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                  });
                }
              },
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Pickup Location',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Select Your Car',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              value: _selectedCar,
              items: _carOptions.map((String car) {
                return DropdownMenuItem<String>(
                  value: car,
                  child: Text(car),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCar = newValue;
                });
              },
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Number of Person',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              child: const Text(
                'BOOK NOW',
                style: TextStyle(color: AppTheme.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onPressed: () {
                // Handle booking logic here
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Example of how to show this popup
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Booking App')),
//       body: Center(
//         child: ElevatedButton(
//           child: Text('Open Booking Form'),
//           onPressed: () {
//             showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return BookingPopup(
//                   onClose: () => Navigator.of(context).pop(),
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
