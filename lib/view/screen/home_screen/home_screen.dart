import 'package:expensetracking/provider/homescreen_provider/home_screen_provider.dart';
import 'package:expensetracking/view/screen/addtransaction/addtransaction_screen.dart';
import 'package:expensetracking/view/screen/home_screen/widget/totalamount.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddTransaction()));
          },
          child: const Icon(Icons.add, color: Colors.white)),
      backgroundColor: Colors.grey.shade100,
      body: Consumer<AddtransactionProvider>(
        builder: (context, value, child) {
          return SafeArea(
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
                  // totalamount widget
                  const TotalAmount(),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Chart",
                    style: GoogleFonts.poppins(fontSize: 20),
                  ),
                  Flexible(
                    child: PieChart(
                      swapAnimationDuration:
                          const Duration(milliseconds: 150), // Optional
                      swapAnimationCurve: Curves.linear,
                      PieChartData(centerSpaceRadius: 0, sections: [
                        PieChartSectionData(
                          color: Colors.green,
                          value: value.income.toDouble(),
                          title: "Income",
                          radius: 100,
                        ),
                        PieChartSectionData(
                          color: Colors.red,
                          value: value.expense.toDouble(),
                          title: "Expenses",
                          radius: 100,
                        )
                      ]),
                    ),
                  ),
                  Flexible(
                    child: Consumer<AddtransactionProvider>(
                      builder: (context, value, child) {
                        return ListView.builder(
                            itemCount: value.value.length,
                            itemBuilder: (context, int index) {
                              return Column(
                                children: [
                                  Text(value.amount.toString()),
                                ],
                              );
                            });
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
