import 'package:flutter/material.dart';
import 'package:multi_provider_exam/providers/counter_provider_model.dart';
import 'package:multi_provider_exam/providers/slider_provider_model.dart';
import 'package:multi_provider_exam/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<SliderProviderModel>(
              create: (_) => SliderProviderModel()),
          ChangeNotifierProvider<CounterProviderModel>(
              create: (_) => CounterProviderModel()),
        ],
        child: const MaterialApp(
          title: 'appTitle',
          home: HomeScreen(),
        ),
      ),
    );
