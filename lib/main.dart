import 'dart:math';

import 'package:akt_test/data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue, scaffoldBackgroundColor: Colors.black),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

Widget _buildSliverRow(int i) {
  List<Crypto> data = data2;
  String title = "Cryptos";

  if (i.isEven) {
    data = data1;
    title = "Tokens";
  }
  return SizedBox(
      height: 250.0,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: 20,),
        Text(title, style: const TextStyle(color: Colors.grey)),
        SizedBox(
          height: 200.0,
          child: ListView.builder(
              itemCount: data.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                IconData percentIcon = Icons.arrow_right_sharp;
                Color percentColor = Colors.red;
                String sign = '-';
                if (data[index].up) {
                  percentColor = Colors.green;
                  percentIcon = Icons.arrow_drop_up_sharp;
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
                        Text("${sign} ${data[index].percent.toString()}%",
                            style: TextStyle(color: percentColor))
                      ],
                    ));
              })),
        )
      ]));
}

Widget _buildSliverList() {
  return SliverList(
      delegate: SliverChildBuilderDelegate(((context, index) {
    return _buildSliverRow(index);
  }), childCount: 4));
}

class _MyHomePageState extends State<MyHomePage> {
  late ScrollController _scrollController;
  late Color _bgColor;

  @override
  void initState() {
    super.initState();
    _bgColor = Colors.transparent;
    _scrollController = ScrollController()
      ..addListener(() {
        _isSliverExtanded
            ? setState(() {
                _bgColor = Colors.black;
              })
            : setState(() {
                _bgColor = Colors.transparent;
              });
      });
  }

  bool get _isSliverExtanded {
    return _scrollController.hasClients &&
        _scrollController.offset > (435 - kToolbarHeight);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            backgroundColor: _bgColor,
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: 497.0,
            title: const Text('Investments'),
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: !_isSliverExtanded
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                       const Text(
                        'AKT Token',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                       const SizedBox(height: 6),
                       const Text(
                        'Purchase our exclusive token with 25% bonus\n& get your lifetime Elite membership now',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                          onPressed: () {},
                          child: SizedBox(width: 100, child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text('Learn more'),
                              Icon(Icons.arrow_forward_rounded,
                                    size: 16, color: Colors.white,)
                            ]
                          )),
                        )
                    ])
                  : null,
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/akt.png',
                    fit: BoxFit.cover,
                  )
                ],
              ),
            ),
          ),
          _buildSliverList()
        ],
      ),
    );
  }
}
