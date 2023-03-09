import 'package:http/http.dart' as http;
import 'dart:convert';
class exchangeRate
{
  double rate;
  String bitCoinName;
  String currencyName;
  http.Response response;

  Future<double> FetchData({String bCoinName,String currName})
  async {
    bitCoinName=bCoinName;
    currencyName=currName;
    response=await http.get(Uri.parse('https://rest.coinapi.io/v1/exchangerate/$bitCoinName/$currencyName?apikey=89143E1C-3901-46C6-B43B-7462A623C6C4'));
    var json=jsonDecode(response.body);
    return json['rate'] != null ? json['rate'].round() :0;
  }
}