
import 'dart:math';

import 'package:flutter/material.dart';

class Crypto {
  String  name;
  double  price;
  double  percent;
  bool    up;
  Color   color;

  Crypto(this.name, this.price, this.percent, this.up, this.color);
}

final data1 = [
  Crypto('BTC', 29830.30, 2.680, false,Colors.primaries[Random().nextInt(Colors.primaries.length)]),
  Crypto('ETH', 2028.30, 3.051, false,Colors.primaries[Random().nextInt(Colors.primaries.length)]),
  Crypto('USDT', 0.99, 0.002, true,Colors.primaries[Random().nextInt(Colors.primaries.length)]),
  Crypto('USDC', 1.00, 0.026, false,Colors.primaries[Random().nextInt(Colors.primaries.length)]),
  Crypto('BNB', 300.70, 2.373, false,Colors.primaries[Random().nextInt(Colors.primaries.length)]),
  Crypto('XRP', 0.42, 1.194, false,Colors.primaries[Random().nextInt(Colors.primaries.length)]),
  Crypto('ADA', 0.55, 4.819, false,Colors.primaries[Random().nextInt(Colors.primaries.length)]),
  Crypto('SOL', 54.27, 4.454, false,Colors.primaries[Random().nextInt(Colors.primaries.length)]),
  Crypto('BUSD', 1.00, 0.049, false,Colors.primaries[Random().nextInt(Colors.primaries.length)]),
  Crypto('DOGE', 0.08, 1.875, false,Colors.primaries[Random().nextInt(Colors.primaries.length)]),
];

final data2 = [
  Crypto('DENT', 0.001, 0.170, false,Colors.primaries[Random().nextInt(Colors.primaries.length)]),
  Crypto('ANT', 1.719, 10.490, true,Colors.primaries[Random().nextInt(Colors.primaries.length)]),
  Crypto('ADA', 0.532, 4.450, false,Colors.primaries[Random().nextInt(Colors.primaries.length)]),
  Crypto('AVAX', 31.485,4.410, false,Colors.primaries[Random().nextInt(Colors.primaries.length)]),
  Crypto('ATOM', 10.399, 6.610, false,Colors.primaries[Random().nextInt(Colors.primaries.length)]),
  Crypto('AMP', 0.013, 0.110, true,Colors.primaries[Random().nextInt(Colors.primaries.length)]),
  Crypto('ANKR', 0.037, 0.440, true,Colors.primaries[Random().nextInt(Colors.primaries.length)]),
  Crypto('CHR', 0.213, 4.470, false,Colors.primaries[Random().nextInt(Colors.primaries.length)]),
  Crypto('CELO', 1.317, 6.650, false,Colors.primaries[Random().nextInt(Colors.primaries.length)]),
  Crypto('CLV', 0.147, 2.270, false,Colors.primaries[Random().nextInt(Colors.primaries.length)]),
];