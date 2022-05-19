import 'package:akt_test/data.dart';
import 'package:flutter/material.dart';

import 'card.dart';

class RowCards extends StatelessWidget {
  const RowCards(this.i, {Key? key}) : super(key: key);
  final int i;
  @override
  Widget build(BuildContext context) {
    List<Crypto> data = data2;
    String title = "Cryptos";

    if (i.isEven) {
      data = data1;
      title = "Tokens";
    }
    return SizedBox(
        height: 250.0,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 20,
          ),
          Text(title, style: const TextStyle(color: Colors.grey)),
          SizedBox(
            height: 200.0,
            child: ListView.builder(
                itemCount: data.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return CryptoCard(data, index);
                })),
          )
        ]));
  }
}
