import 'package:flutter/material.dart';
import 'package:graphs/stacked%20chart/stacked_area_chart.dart';
import 'package:graphs/stacked%20chart/stacked_bar_chart.dart';
import 'package:graphs/stacked%20chart/stacked_column_chart.dart';
import 'package:graphs/stacked%20chart/stacked_line_chart.dart';

class StackedChart extends StatelessWidget {
  const StackedChart({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Stacked Chart"),
            bottom: const TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.center,
                tabs: [
                  Tab(
                    text: "Stacked line Chart",
                  ),
                  Tab(
                    text: "Stacked Column Chart",
                  ),
                  Tab(
                    text: "Stacked Area Chart",
                  ),
                  Tab(
                    text: "Stacked Bar Chart",
                  ),
                ]),
          ),
          body: const Padding(
            padding: EdgeInsets.symmetric(vertical: 100.0),
            child: TabBarView(
              children: [
                StackedLineChart(),
                StackedColumnChart(),
                StackedAreaChart(),
                StackedBarChart()
              ],
            ),
          ),
        ));
  }
}
