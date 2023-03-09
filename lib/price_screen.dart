import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'exchangeRate.dart';
import 'dart:async';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  var dropDownValue;
  List<String> allRatesList=['1 BTC = ? AUD','1 ETH = ? AUD','1 LTC = ? AUD'];
  exchangeRate eRate = exchangeRate();
  // List<DropdownMenuItem> getItems() {
  //   List<DropdownMenuItem> dropDownItems = [];
  //   for (int i = 0; i < currenciesList.length; i++) {
  //     dropDownItems.add(
  //       DropdownMenuItem(
  //         child: Text(currenciesList[i]),
  //         value: currenciesList[i],
  //       ),
  //     );
  //   }
  //   return dropDownItems;
  // }
  void updateRates(int index)
  async{
    List<String> rates=[];
    for(int i=0;i<cryptoList.length;i++)
    {
      var tempRate;
      Timer(Duration(milliseconds: 10), () async{
      tempRate = await eRate.FetchData(bCoinName: cryptoList[i], currName: currenciesList[index]);});
      String tempString='1 ${cryptoList[i]} ' + '= ${tempRate.toString()} ' + currenciesList[index].toString();
      rates.add(tempString);
    }
    allRatesList=rates;
  }
  List<Widget> getItems() {
    List<Widget> dropDownItems = [];
    for (int i = 0; i < currenciesList.length; i++) {
      dropDownItems.add(
        Text(currenciesList[i]),
      );
    }
    return dropDownItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  allRatesList[0],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  allRatesList[1],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  allRatesList[2],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: CupertinoPicker(
              itemExtent: 32.0,
              onSelectedItemChanged: (value) {
                  setState(() {
                    updateRates(value);
                  });
              },
              children: getItems(),
              backgroundColor: Colors.lightBlue,
            ),
            // child: DropdownButton(
            //   value: dropDownValue,
            //   items: getItems(),
            //   onChanged: (value){
            //     print(value);
            //   },
            // ),
          ),
        ],
      ),
    );
  }
}
