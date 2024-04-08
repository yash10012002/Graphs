import 'package:flutter/material.dart';
import 'package:graphs/area/area_with_empty_points.dart';
import 'package:graphs/area/area_zone.dart';
import 'package:graphs/area/default_area_chart.dart';
import 'package:graphs/area/vertical_area_chart.dart';

import 'modified_are_axis_base.dart';

class AreaChart extends StatelessWidget {
  const AreaChart({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Area Chart"),
            bottom: const TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.center,
                tabs: [
                  Tab(
                    text: "Default Area Chart",
                  ),
                  Tab(
                    text: "Vertical Area chart",
                  ),
                  Tab(
                    text: "Area zone",
                  ),
                  Tab(
                    text: "Modified Axis base",
                  ),
                  Tab(
                    text: "Area with empty points",
                  ),
                ]),
          ),
          body: const Padding(
            padding: EdgeInsets.symmetric(vertical: 100.0),
            child: TabBarView(
              children: [
                DefaultAreaChart(),
                VerticalAreaChart(),
                AreaZone(),
                ModifiedAreaAxisBase(),
                AreaWithEmptyPoints()
              ],
            ),
          ),
        ));
  }
}
