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
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transaction"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Consumer<AddtransactionProvider>(
          builder: ((context, value, child) {
            return Column(
              children: [
                TextField(
                  controller: controller,
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
                    String numberstring = controller.toString();
                    int? number = int.parse(
                        numberstring.replaceAll(RegExp(r'[^0-9]'), ''));
                    value.addamount(number);
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
