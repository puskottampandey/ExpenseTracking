import 'package:expensetracking/provider/homescreen_provider/home_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                  controller: value.controller,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                      labelText: "Transaction amount",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 2.0,
                        ),
                      )),
                ),
                MaterialButton(
                  color: Colors.blue,
                  onPressed: () {
                    value.addtransaction(int.parse(value.controller.text));

                    if (value.select == value.choice[0]) {
                      value.addamount(int.parse(value.controller.text));
                      value.totalamount(int.parse(value.controller.text));
                    } else {
                      value.decreaseamount(int.parse(value.controller.text));
                    }
                  },
                  child: const Text("add"),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
