import 'package:expensetracking/provider/homescreen_provider/home_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transaction"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Consumer<AddtransactionProvider>(
          builder: ((context, value, child) {
            return Column(
              children: [
                SizedBox(
                  height: 70,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: value.choice.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            value.change(index);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: value.select == value.choice[index]
                                    ? Colors.blue
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            width: 100,
                            margin: const EdgeInsets.all(8),
                            child: Center(
                              child: Text(
                                value.choice[index],
                                style: TextStyle(
                                    color: value.select == value.choice[index]
                                        ? Colors.white
                                        : Colors.blue),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                TextField(
                  cursorColor: Colors.lightBlue.shade400,
                  controller: value.digitcontroller,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                      labelText: "Transaction amount",
                      labelStyle: TextStyle(color: Colors.lightBlue.shade400),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Colors.lightBlue.shade400,
                          width: 2.0,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(5),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  cursorColor: Colors.lightBlue.shade400,
                  controller: value.namecontroller,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      labelText: "Category",
                      labelStyle: TextStyle(color: Colors.lightBlue.shade400),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Colors.lightBlue.shade400,
                          width: 2.0,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(5),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  minWidth: 150,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  color: Colors.blue,
                  onPressed: () {
                    if (value.select == value.choice[0]) {
                      IconData icon = Icons.arrow_upward_rounded;
                      Color color = Colors.green;
                      Color iconback = Colors.green.shade100;
                      value.addamount(int.parse(value.digitcontroller.text));
                      value.totalamount(int.parse(value.digitcontroller.text));
                      value.enter(int.parse(value.digitcontroller.text),
                          value.namecontroller.text, icon, color, iconback);
                    } else {
                      IconData icon = Icons.arrow_downward_rounded;
                      Color color = Colors.red;
                      Color iconback = Colors.red.shade100;
                      value.decreaseamount(
                          int.parse(value.digitcontroller.text));
                      value.enter(int.parse(value.digitcontroller.text),
                          value.namecontroller.text, icon, color, iconback);
                    }

                    Navigator.pop(context);
                    value.namecontroller.clear();
                    value.digitcontroller.clear();
                  },
                  child: Text(
                    "Add",
                    style:
                        GoogleFonts.poppins(fontSize: 15, color: Colors.white),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
