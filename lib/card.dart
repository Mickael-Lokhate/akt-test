import 'package:akt_test/data.dart';
import 'package:flutter/material.dart';

class CryptoCard extends StatelessWidget {
  const CryptoCard(this.data, this.index, {Key? key}) : super(key: key);
  final List<Crypto> data;
  final int index;
  @override
  Widget build(BuildContext context) {
    Color percentColor = Colors.red;
    String sign = '-';
    if (data[index].up) {
      percentColor = Colors.green;
      sign = '+';
    }
    return Card(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                  color: data[index].color,
                  borderRadius: BorderRadius.circular(8)),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              data[index].name,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 6,
            ),
            Text("${data[index].price.toString()} €",
                style: const TextStyle(color: Colors.white)),
            const SizedBox(
              height: 6,
            ),
            Text("$sign ${data[index].percent.toString()}%",
                style: TextStyle(color: percentColor))
          ],
        ));
  }
}
