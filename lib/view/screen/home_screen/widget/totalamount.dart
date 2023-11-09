import 'package:expensetracking/provider/homescreen_provider/home_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TotalAmount extends StatefulWidget {
  const TotalAmount({super.key});

  @override
  State<TotalAmount> createState() => _TotalAmountState();
}

class _TotalAmountState extends State<TotalAmount> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AddtransactionProvider>(
      builder: ((context, value, child) {
        return Container(
          height: MediaQuery.sizeOf(context).height * 0.25,
          width: MediaQuery.sizeOf(context).width * 0.9,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.white),
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
                      ),
                    ),
                    Text(
                      "RS.${value.amount.toString()}",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
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
                                    fontSize: 12,
                                  )),
                              Text("Rs.${value.income}",
                                  style: GoogleFonts.poppins(
                                      fontSize: 15, color: Colors.green)),
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
                                    fontSize: 12,
                                  )),
                              Text("Rs.${value.expense}",
                                  style: GoogleFonts.poppins(
                                      fontSize: 15, color: Colors.red)),
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
        );
      }),
    );
  }
}
