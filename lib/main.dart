import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TipCalculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TipCalculatorActivity(),
    );
  }
}
class TipCalculatorActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TipCalculatorActivityState();
}

class TipCalculatorActivityState extends State<TipCalculatorActivity> {

  int fifteenPercentTipValue = 0;
  int twentyPercentTipValue = 0;
  int twentyfivePercentTipValue = 0;
  int fifteenPercentTotalValue = 0;
  int twentyPercentTotalValue = 0;
  int twentyfivePercentTotalValue = 0;
  int personCost = 0;


  TextEditingController checkAmountValue = TextEditingController();


  TextEditingController partySizeValue = TextEditingController();

  FocusNode blankNode = FocusNode();

  void calculate() {

    //print(int.parse(checkAmountValue.text));
    setState(() {
      if (int.parse(checkAmountValue.text) > 0 && int.parse(partySizeValue.text) > 0) {
        personCost = (int.parse(checkAmountValue.text)/ int.parse(partySizeValue.text)).round();
      }
      fifteenPercentTipValue = (personCost * 0.15).round();
      fifteenPercentTotalValue = personCost + fifteenPercentTipValue;
      print(checkAmountValue);
      print(partySizeValue);

      twentyPercentTipValue = (personCost * 0.20).round();
      twentyPercentTotalValue = personCost + twentyPercentTipValue;

      twentyfivePercentTipValue = (personCost * 0.25).round();
      twentyfivePercentTotalValue = personCost + twentyfivePercentTipValue;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TipCalculator'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: checkAmountValue,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              labelText: 'Check amount: ',
            ),
            autofocus: true,
          ),
          TextField(
            controller: partySizeValue,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              labelText: 'Party size: ',
            ),
          ),
          SizedBox(
            height: 30,
          ),

          GestureDetector(
            onTap: (){_compute();
            FocusScope.of(context).requestFocus(blankNode);
            },


            child: Container(
              padding: EdgeInsets.symmetric(vertical: 18, horizontal: 24),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(24)),
              child: Text(
                "COMPUTER TIP",
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text("Tips and totals (per person)",
              style: TextStyle(
                fontSize: 28,
              )),
          SizedBox(
            height: 30,
          ),
          Text("Tip:          15%    $fifteenPercentTipValue"
              "      20%  $twentyPercentTipValue"
              "      25%  $twentyfivePercentTipValue",
              style: TextStyle(
                  fontSize: 22
              )),
          SizedBox(
            height: 20,
          ),
          Text("Total:       15%    $fifteenPercentTotalValue"
              "     20%  $twentyPercentTotalValue"
              "    25%  $twentyfivePercentTotalValue",
              style: TextStyle(
                  fontSize: 22
              )),

        ],
      ),
    );
  }

  void _compute() {

    if (int.parse(checkAmountValue.text) <= 0 ||
        int.parse(partySizeValue.text) <= 0 ||
        checkAmountValue.text == null ||
        partySizeValue.text == null) {
      showToast();
      onTextClear();
    } else {
      calculate();
    }
  }

  void showToast() {
    Fluttertoast.showToast(
        msg: 'Empty or incorrent value(s)!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white
    );
  }

  void onTextClear() {
    setState(() {
      checkAmountValue.clear();
      partySizeValue.clear();
      fifteenPercentTipValue = 0;
      fifteenPercentTotalValue = 0;
      twentyfivePercentTipValue = 0;
      twentyfivePercentTotalValue = 0;
      twentyPercentTipValue = 0;
      twentyPercentTotalValue = 0;
    });
  }


}