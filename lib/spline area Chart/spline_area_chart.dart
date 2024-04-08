import 'package:flutter/material.dart';
import 'package:graphs/spline%20area%20Chart/Spline_area_with_gradient.dart';
import 'package:graphs/spline%20area%20Chart/default_spline_chart.dart';

class SplineAreaChart extends StatelessWidget {
  const SplineAreaChart({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Spline Area Chart"),
            bottom: const TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.center,
                tabs: [
                  Tab(
                    text: "Default Spline Area Chart",
                  ),
                  Tab(
                    text: "Spline Area With Gradient",
                  ),
                ]),
          ),
          body: const Padding(
            padding: EdgeInsets.symmetric(vertical: 100.0),
            child: TabBarView(
              children: [
                DefaultSplineAreaChart(),
                SplineAreaWithGradient(),
              ],
            ),
          ),
        ));
  }
}
