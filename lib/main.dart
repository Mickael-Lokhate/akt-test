import 'package:akt_test/promo_header.dart';
import 'package:akt_test/row.dart';
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

Widget _buildSliverList() {
  return SliverList(
      delegate: SliverChildBuilderDelegate(((context, index) {
    return RowCards(index);
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
              title: !_isSliverExtanded ? const PromoHeader() : null,
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
