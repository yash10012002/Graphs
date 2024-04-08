import 'package:flutter/material.dart';
import 'package:graphs/bar/bar_width_spacing.dart';
import 'package:graphs/bar/bar_with_rounded_corner.dart';
import 'package:graphs/bar/bar_with_track.dart';
import 'package:graphs/bar/default_bar_chart.dart';

class BarChart extends StatelessWidget {
  const BarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Bar Chart"),
            bottom: const TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.center,
                tabs: [
                  Tab(
                    text: "Default Bar Chart",
                  ),
                  Tab(
                    text: "Bar with Round Corner",
                  ),
                  Tab(
                    text: "Bar width and Spacing",
                  ),
                  Tab(
                    text: "Bar with Track",
                  ),
                ]),
          ),
          body: const Padding(
            padding: EdgeInsets.symmetric(vertical: 100.0),
            child: TabBarView(
              children: [
                DefaultBarChart(),
                BarWithRoundedCorer(),
                BarWidthAndSpacing(),
                BarWithTrack()
              ],
            ),
          ),
        ));
  }
}
