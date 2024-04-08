import 'package:flutter/material.dart';
import 'package:graphs/doughnut/RoundedCornerDoughnut.dart';
import 'package:graphs/doughnut/center_elevation_doughnut.dart';
import 'package:graphs/doughnut/color_mapping_doughnut.dart';
import 'package:graphs/doughnut/default_doughnut_chart.dart';
import 'package:graphs/doughnut/gradient_fill.dart';
import 'package:graphs/doughnut/semi_doughnut.dart';

class DoughnutChart extends StatelessWidget {
  const DoughnutChart({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Doughnut Chart"),
            bottom: const TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.center,
                tabs: [
                  Tab(
                    text: "Default",
                  ),
                  Tab(
                    text: "Center Elevation",
                  ),
                  Tab(
                    text: "Rounded Corners",
                  ),
                  Tab(
                    text: "Color Mapping",
                  ),
                  Tab(
                    text: "Semi-Doughnut Chart",
                  ),
                  Tab(
                    text: "Gradient fill",
                  ),
                ]),
          ),
          body: const Padding(
            padding: EdgeInsets.symmetric(vertical: 100.0),
            child: TabBarView(
              children: [
                DefaultDoughnutChart(),
                CenterElevationDoughnut(),
                RoundedCornerDoughnut(),
                ColorMappingDoughnut(),
                SemiDoughnut(),
                GradientFillDoughnut()
              ],
            ),
          ),
        ));
  }
}
