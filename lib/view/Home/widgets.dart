
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlightRouteWidget extends StatelessWidget {
  const FlightRouteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40, 
        width: double.infinity,
        color: Colors.transparent, 
        child: CustomPaint(
          painter: DashedLinePainter(),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: MediaQuery.of(context).size.width * 0.2, 
                child: const Icon(
                  Icons.flight,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2.0;

    const dashWidth = 10.0;
    const dashSpace = 5.0;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height / 2),
        Offset(startX + dashWidth, size.height / 2),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class Filter extends StatelessWidget {
  const Filter({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> airlines = [
      "Jazeera Airways",
      "Kuwait Airways",
      "Fly Dubai",
      "Saudi Arabian Airlines",
      "Qatar Airways",
      "Emirates Airlines",
      "Royal Jordanian",
      "Gulf Air Company",
      "Turkish Airlines",
      "Egyptair",
      "Etihad Airways",
      "Middle East Airlines",
    ];

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Filter Your Search",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Airlines",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1D1D1D),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                    },
                    child: Text(
                      "Clear",
                      style: GoogleFonts.poppins(
                        color: Colors.blue,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: airlines.length,
                  itemBuilder: (context, index) {
                    return AirlineOptionRow(
                      airlineName: airlines[index],
                      isSelected: false, 
                      onChanged: (val) {
                      },
                    );
                  },
                ),
              ),

              const SizedBox(height: 10),

              const ActionButtonsRow(
                resetText: "Reset",
                doneText: "Done",
                buttonColor: Color(0xFFFFA726),
              ),
            ],
          ),
        );
      },
    );
  }
}

class AirlineOptionRow extends StatelessWidget {
  final String airlineName;
  final bool isSelected;
  final ValueChanged<bool?>? onChanged;

  const AirlineOptionRow({
    super.key,
    required this.airlineName,
    required this.isSelected,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            airlineName,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black87,
            ),
          ),
        ),
        Checkbox(
          value: isSelected,
          onChanged: onChanged,
          activeColor: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ],
    );
  }
}

class ActionButtonsRow extends StatelessWidget {
  final String resetText;
  final String doneText;
  final Color buttonColor;

  const ActionButtonsRow({
    super.key,
    required this.resetText,
    required this.doneText,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              // Reset logic
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
            child: Text(
              resetText,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              // Done logic
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
            child: Text(
              doneText,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Sort extends StatelessWidget {
  const Sort({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> sortOptions = ["Airline", "Duration", "Price"];

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
          
              // Title
              Text(
                "Sort Flight By",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1D1D1D),
                ),
              ),
              const SizedBox(height: 15),

              // Sort options list
              Expanded(
                child: ListView.separated(
                  controller: scrollController,
                  itemCount: sortOptions.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    return SortOptionRow(
                      optionName: sortOptions[index],
                      onAscending: () {
                        // Ascending sort logic
                      },
                      onDescending: () {
                        // Descending sort logic
                      },
                    );
                  },
                ),
              ),

              const SizedBox(height: 10),

              // Buttons
              const ActionButtonsRow(
                resetText: "Reset",
                doneText: "Done",
                buttonColor: Color(0xFFFFA726),
              ),
            ],
          ),
        );
      },
    );
  }
}

class SortOptionRow extends StatelessWidget {
  final String optionName;
  final VoidCallback onAscending;
  final VoidCallback onDescending;

  const SortOptionRow({
    super.key,
    required this.optionName,
    required this.onAscending,
    required this.onDescending,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          optionName,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: onAscending,
              icon: const Icon(Icons.arrow_upward, color: Color(0xFF444A59)),
            ),
            IconButton(
              onPressed: onDescending,
              icon: const Icon(Icons.arrow_downward, color: Color(0xFF444A59)),
            ),
          ],
        )
      ],
    );
  }
}



