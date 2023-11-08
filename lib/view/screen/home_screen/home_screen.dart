import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "welcome",
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                      Text(
                        "Puskottam Pandey",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications,
                          color: Colors.lightBlue.shade500,
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.sizeOf(context).height * 0.25,
                width: MediaQuery.sizeOf(context).width * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.lightBlue.shade500),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Total Balanced",
                            style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          Text(
                            "Rs.17,20,000.00",
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.1,
                            width: MediaQuery.sizeOf(context).width * 0.4,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.arrow_upward,
                                  size: 20,
                                  color: Colors.green,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("Income",
                                        style: GoogleFonts.poppins(
                                            fontSize: 12, color: Colors.white)),
                                    Text("2,00,000",
                                        style: GoogleFonts.poppins(
                                            fontSize: 15, color: Colors.white)),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.1,
                            width: MediaQuery.sizeOf(context).width * 0.4,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Icon(
                                  Icons.arrow_downward,
                                  size: 20,
                                  color: Colors.red,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("Expenses",
                                        style: GoogleFonts.poppins(
                                            fontSize: 12, color: Colors.white)),
                                    Text("20,000,000",
                                        style: GoogleFonts.poppins(
                                            fontSize: 15, color: Colors.white)),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Transactions",
                    style: GoogleFonts.poppins(fontSize: 20),
                  ),
                  Text(
                    "View All",
                    style: GoogleFonts.poppins(fontSize: 15),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
