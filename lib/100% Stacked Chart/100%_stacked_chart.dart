import 'package:flutter/material.dart';
import 'package:graphs/100%25%20Stacked%20Chart/100%25_Stacked_bar_chart.dart';
import 'package:graphs/100%25%20Stacked%20Chart/100%25_stacked_area_chart.dart';
import 'package:graphs/100%25%20Stacked%20Chart/100%25_stacked_column_chart.dart';
import 'package:graphs/100%25%20Stacked%20Chart/100%25_stacked_line_chart.dart';

class FullStackedChart extends StatelessWidget {
  const FullStackedChart({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("100% Stacked Chart"),
            bottom: const TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.center,
                tabs: [
                  Tab(
                    text: "100% Stacked line Chart",
                  ),
                  Tab(
                    text: "100% Stacked Area Chart",
                  ),
                  Tab(
                    text: "100% Stacked Column Chart",
                  ),
                  Tab(
                    text: "100% Stacked Bar Chart",
                  ),
                ]),
          ),
          body: const Padding(
            padding: EdgeInsets.symmetric(vertical: 100.0),
            child: TabBarView(
              children: [
                FullStackedLineChart(),
                FullStackedAreaChart(),
                FullStackedColumnChart(),
                FullStackedBarChart()
              ],
            ),
          ),
        ));
  }
}
