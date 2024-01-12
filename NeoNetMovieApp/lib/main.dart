import 'package:flutter/material.dart';
import 'package:neonetmovieapp/view/pages/homepage.dart';
import 'package:provider/provider.dart';

class CategoryNotifier with ChangeNotifier {
  String _selectedCategory = '';

  String get selectedCategory => _selectedCategory;

  void setCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }
}

class SizeNotifier with ChangeNotifier {
  double _globalDeviceHeight = 0;
  double _globalDeviceWidth = 0;
  double _globalDeviceRatio = 0;

  double get globalDeviceHeight => _globalDeviceHeight;

  double get globalDeviceWidth => _globalDeviceWidth;

  double get globalDeviceRatio => _globalDeviceRatio;

  void setDeviceHeight(double dHeight) {
    _globalDeviceHeight = dHeight;
    notifyListeners();
  }

  void setDeviceWidth(double dWidth) {
    _globalDeviceWidth = dWidth;
    notifyListeners();
  }

  void setDeviceRatio(double dRatio) {
    _globalDeviceRatio = dRatio;
    notifyListeners();
  }
}

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CategoryNotifier()),
        ChangeNotifierProvider(create: (_) => SizeNotifier()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final globalDSizes = Provider.of<SizeNotifier>(context, listen: false);
      final deviceHeight = MediaQuery.of(context).size.height;
      final deviceWidth = MediaQuery.of(context).size.width;
      final deviceRatio = MediaQuery.of(context).size.aspectRatio;
      globalDSizes.setDeviceHeight(deviceHeight);
      globalDSizes.setDeviceWidth(deviceWidth);
      globalDSizes.setDeviceRatio(deviceRatio);
    });
    // TODO: implement initState

    super.initState();
  }

  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
