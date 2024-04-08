import 'package:flutter/material.dart';
import 'package:graphs/radial%20bar/customized_radial_chart.dart';
import 'package:graphs/radial%20bar/default_radial.dart';
import 'package:graphs/radial%20bar/gradient_fill_radial.dart';
import 'package:graphs/radial%20bar/legend_radial.dart';
import 'package:graphs/radial%20bar/overfilled_radial.dart';

class RadialBarChart extends StatelessWidget {
  const RadialBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Radial Bar Chart"),
            bottom: const TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.center,
                tabs: [
                  Tab(
                    text: "Default",
                  ),
                  Tab(
                    text: "Legend",
                  ),
                  Tab(
                    text: "Customized Radial Bar Chart",
                  ),
                  Tab(
                    text: "Gradient fill",
                  ),
                  Tab(
                    text: "Overfilled Radial Bar",
                  ),
                ]),
          ),
          body: const Padding(
            padding: EdgeInsets.symmetric(vertical: 100.0),
            child: TabBarView(
              children: [
                DefaultRadialBarChart(),
                LegendRadialChart(),
                CustomizedRadialChart(),
                GradientFillRadial(),
                OverfilledRadialBar()
              ],
            ),
          ),
        ));
  }
}
