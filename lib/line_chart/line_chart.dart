import 'package:flutter/material.dart';
import 'package:graphs/line_chart/LineMultiColor.dart';
import 'package:graphs/line_chart/animation_line_chart.dart';
import 'package:graphs/line_chart/default_line_chart.dart';
import 'package:graphs/line_chart/line_dased.dart';
import 'package:graphs/line_chart/line_zone.dart';

class LineChart extends StatelessWidget {
  const LineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Line Chart"),
          bottom: const TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.center,
              tabs: [
                Tab(
                  text: "Default Line",
                ),
                Tab(
                  text: "Line with Dashs",
                ),
                Tab(
                  text: "Multi-colored Line",
                ),
                Tab(
                  text: "Line zone",
                ),
                Tab(
                  text: "Dynamic Update Animation",
                ),
              ]),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100.0),
          child: TabBarView(
            children: [
              DefaultLineChart(),
              LineDashed(),
              LineMultiColor(),
              LineZone(),
              AnimationLineChart()
            ],
          ),
        ),
      ),
    );
  }
}
