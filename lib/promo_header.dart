import 'package:flutter/material.dart';

class PromoHeader extends StatelessWidget {
  const PromoHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      const Text(
        'AKT Token',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 6),
      const Text(
        'Purchase our exclusive token with 25% bonus\n& get your lifetime Elite membership now',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 11, color: Colors.grey),
      ),
      const SizedBox(height: 10),
      ElevatedButton(
        onPressed: () {},
        child: SizedBox(
            width: 80,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    'Learn more',
                    style: TextStyle(fontSize: 12),
                  ),
                  Icon(
                    Icons.arrow_forward_rounded,
                    size: 14,
                    color: Colors.white,
                  )
                ])),
      )
    ]);
  }
}
