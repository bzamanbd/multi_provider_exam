import 'package:flutter/material.dart';
import 'package:multi_provider_exam/providers/counter_provider_model.dart';
import 'package:multi_provider_exam/widgets/slider_widget.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as dev;

import '../providers/slider_provider_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle newStyle = Theme.of(context)
        .textTheme
        .titleMedium!
        .copyWith(fontSize: 25.0, fontWeight: FontWeight.bold);
    final dataOfCounterProviderModel =
        Provider.of<CounterProviderModel>(context, listen: false);
    dev.log('build');
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<SliderProviderModel>(
              builder: (_, dataOfProviderModel, child) {
            return SliderWidget(
                val: dataOfProviderModel.val,
                onChanged: (v) {
                  dataOfProviderModel.setNewValue(v);
                });
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Consumer<SliderProviderModel>(
                  builder: (_, dataOfProviderModel, child) {
                return Expanded(
                  child: Container(
                    height: 60,
                    color: Colors.pink.withOpacity(dataOfProviderModel.val),
                  ),
                );
              }),
              Consumer<SliderProviderModel>(
                  builder: (_, dataFromProviderModel, child) {
                return Expanded(
                  child: Container(
                    height: 60,
                    color: Colors.orange.withOpacity(dataFromProviderModel.val),
                  ),
                );
              }),
            ],
          ),
          const SizedBox(height: 30),
          Consumer<CounterProviderModel>(builder: (_, counterData, child) {
            return Text(
              counterData.number.toString(),
              style: newStyle,
              textScaleFactor: 2,
            );
          })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dataOfCounterProviderModel.incrementNum();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
