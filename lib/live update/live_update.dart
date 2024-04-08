import 'package:flutter/material.dart';
import 'package:graphs/live%20update/real_time_chart.dart';
import 'package:graphs/live%20update/real_time_spline_chart.dart';
import 'package:graphs/live%20update/vertical_live_chart.dart';

class LiveUpdateChart extends StatelessWidget {
  const LiveUpdateChart({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Live Update Chart"),
            bottom: const TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.center,
                tabs: [
                  Tab(
                    text: "Real time Spline Chart",
                  ),
                  Tab(
                    text: "Real time Chart",
                  ),
                  Tab(
                    text: "Vertical live chart",
                  ),
                ]),
          ),
          body: const Padding(
            padding: EdgeInsets.symmetric(vertical: 100.0),
            child: TabBarView(
              children: [
                RealTimeSplineChart(),
                RealTimeChart(),
                VerticalLiveChart()
              ],
            ),
          ),
        ));
  }
}
