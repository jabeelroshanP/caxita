import 'package:caxita/controller/flight_provider.dart';
import 'package:caxita/view/Home/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      appBar: PreferredSize(  
        preferredSize: Size.fromHeight(height * 0.15),
        child: AppBar(
          backgroundColor: const Color(0xFF0862A4),
          flexibleSpace: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: width * 0.07,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "NYZ",
                            style: TextStyle(
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: width * 0.5,
                            height: height * 0.1,
                            child: const FlightRouteWidget(),
                          ),
                          Text(
                            "CAI",
                            style: TextStyle(
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.menu,
                        size: width * 0.07,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                Text(
                  "17 October | 2 Travellers | 25 Flights",
                  style: TextStyle(
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return const FlightCard();
          },
        ),
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: const BoxDecoration(
          color: Color(0xFFF7941E),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => const Sort(),
                );
              },
              child: const Text("Sort", style: TextStyle(color: Colors.white)),
            ),
            const Text("|", style: TextStyle(color: Colors.white, fontSize: 18)),
            TextButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => const Filter(),
                );
              },
              child:
                  const Text("Filter", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

class FlightCard extends StatelessWidget {
  const FlightCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const FlightTripRow(
              logo: Icons.photo,
              departureLabel: "Departure",
              departureTime: "21:30",
              departureAirport: "DXB",
              duration: "06H:00M",
              arrivalLabel: "Arrival",
              arrivalTime: "08:30",
              arrivalAirport: "CAI",
            ),
            const SizedBox(height: 12),
            const FlightTripRow(
              logo: Icons.photo,
              departureLabel: "Departure",
              departureTime: "21:30",
              departureAirport: "CAI",
              duration: "06H:00M",
              arrivalLabel: "Arrival",
              arrivalTime: "08:30",
              arrivalAirport: "DXB",
            ),
            const Divider(thickness: 1, color: Colors.grey),
            const FlightStatusRow(
              status: "Non Refundable",
              statusColor: Colors.red,
              price: "EGP 596.230",
            ),
          ],
        ),
      ),
    );
  }
}

class FlightTripRow extends StatelessWidget {
  final IconData logo;
  final String departureLabel;
  final String departureTime;
  final String departureAirport;
  final String duration;
  final String arrivalLabel;
  final String arrivalTime;
  final String arrivalAirport;

  const FlightTripRow({
    super.key,
    required this.logo,
    required this.departureLabel,
    required this.departureTime,
    required this.departureAirport,
    required this.duration,
    required this.arrivalLabel,
    required this.arrivalTime,
    required this.arrivalAirport,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(logo, size: 40, color: Colors.blue),
        const SizedBox(width: 10),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(departureLabel,
                      style: GoogleFonts.poppins(
                          fontSize: 12, color: Colors.grey)),
                  Text(departureTime,
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(departureAirport,
                      style: GoogleFonts.poppins(
                          fontSize: 12, fontWeight: FontWeight.w500)),
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.flight_takeoff, color: Colors.orange),
                  Text(duration,
                      style: GoogleFonts.poppins(
                          fontSize: 12, color: Colors.grey)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(arrivalLabel,
                      style: GoogleFonts.poppins(
                          fontSize: 12, color: Colors.grey)),
                  Text(arrivalTime,
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(arrivalAirport,
                      style: GoogleFonts.poppins(
                          fontSize: 12, fontWeight: FontWeight.w500)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class FlightStatusRow extends StatelessWidget {
  final String status;
  final Color statusColor;
  final String price;

  const FlightStatusRow({
    super.key,
    required this.status,
    required this.statusColor,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(status,
            style: GoogleFonts.poppins(
                fontSize: 12, color: statusColor)),
        const Spacer(),
        Text(price,
            style: GoogleFonts.poppins(
                fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
