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
          //income in percent
          double fraction = (value.expense / value.income);
          double percent = (fraction * 100);

          return SingleChildScrollView(
            child: SafeArea(
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
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),

                    // PieChart for the income and expenses

                    SizedBox(
                      height: 200,
                      child: value.value.isNotEmpty
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                    height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.grey.shade100),
                                    child: PieChart(
                                      swapAnimationDuration: const Duration(
                                          milliseconds: 150), // Optional
                                      swapAnimationCurve: Curves.linear,
                                      PieChartData(
                                          centerSpaceRadius: 30,
                                          sections: [
                                            PieChartSectionData(
                                              showTitle: false,
                                              color: Colors.green,
                                              value: value.income.toDouble(),
                                              radius: 50,
                                            ),
                                            PieChartSectionData(
                                              color: Colors.red,
                                              value: value.expense.toDouble(),
                                              showTitle: false,
                                              radius: 50,
                                            ),
                                            PieChartSectionData(
                                              showTitle: false,
                                              color: Colors.yellow,
                                              value: value.amount.toDouble(),
                                              radius: 50,
                                            ),
                                          ]),
                                    )),
                                Container(
                                  height: 200,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.grey.shade100),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.green),
                                          ),
                                          Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.red),
                                          ),
                                          Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.yellow),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Income",
                                            style: GoogleFonts.poppins(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            "Expense",
                                            style: GoogleFonts.poppins(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            "Total",
                                            style: GoogleFonts.poppins(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          : Center(
                              child: Text(
                                "No Income and expenses!",
                                style: GoogleFonts.poppins(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Transaction",
                      style: GoogleFonts.poppins(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    // list of the transaction of the icome and expenses

                    SizedBox(
                      height: 300,
                      child: Consumer<AddtransactionProvider>(
                        builder: (context, value, child) {
                          return value.value.isNotEmpty
                              ? ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: value.value.length,
                                  itemBuilder: (context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.08,
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.9,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.white),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: ListTile(
                                            leading: CircleAvatar(
                                              radius: 12,
                                              backgroundColor:
                                                  value.value[index].iconback,
                                              child: Icon(
                                                value.value[index].icon,
                                                size: 15,
                                                color: value.value[index].color,
                                              ),
                                            ),
                                            title: Text(
                                              value.value[index].type
                                                  .toString(),
                                              style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            trailing: Column(
                                              children: [
                                                Text(
                                                  "Rs.${value.value[index].addsub}${value.value[index].enteramount.toString()}",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 10,
                                                      color: value
                                                          .value[index].color,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Text(
                                                  "Rs.${value.value[index].totalamount.toString()}",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                )
                              : Center(
                                  child: Text(
                                    "No Trasaction!",
                                    style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
