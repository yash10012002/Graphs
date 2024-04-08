import 'package:flutter/material.dart';
import 'package:graphs/financial%20chart/candle_chart.dart';
import 'package:graphs/financial%20chart/high_low_chart.dart';
import 'package:graphs/financial%20chart/open_high_low_close_chart.dart';

class FinancialChart extends StatelessWidget {
  const FinancialChart({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Financial Chart"),
            bottom: const TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.center,
                tabs: [
                  Tab(
                    text: "High Low Chart",
                  ),
                  Tab(
                    text: "Open High Low Close Chart",
                  ),
                  Tab(
                    text: "Candle chart",
                  ),
                ]),
          ),
          body: const Padding(
            padding: EdgeInsets.symmetric(vertical: 100.0),
            child: TabBarView(
              children: [
                HighLowChart(),
                OpenHighLowCloseChart(),
                CandleChart(),
              ],
            ),
          ),
        ));
  }
}
