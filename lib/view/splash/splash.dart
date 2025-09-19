import 'package:caxita/view/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.3),
              BlendMode.darken,
            ),
            child: Image.asset("assets/splash.png", fit: BoxFit.cover),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.12),

              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "Fl",
                        style: GoogleFonts.nunito(
                          color: const Color(0xFFF7941E),
                          fontSize: width * 0.15,
                          fontWeight: FontWeight.w900,
                        ),
                        children: [
                          TextSpan(
                            text: 'y',
                            style: GoogleFonts.nunito(
                              color: const Color(0xFFF7941E),
                              fontSize: width * 0.15,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          TextSpan(
                            text: 'WT',
                            style: GoogleFonts.nunito(
                              color: Colors.blueAccent,
                              fontSize: width * 0.15,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: height * 0.01,
                      right: width * 0.28,
                      child: Text(
                        ".com",
                        style: TextStyle(
                          color: const Color(0xFFF7941E),
                          fontSize: width * 0.03,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(), 

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "DISCOVER THE WORLD WITH THE BEST FLIGHTS",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: width * 0.065,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              SizedBox(height: height * 0.03),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF7941E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(vertical: height * 0.02),
                      ),
                      child: Text(
                        "Continue",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: width * 0.05,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
