import 'package:flutter/material.dart';
import 'package:graphs/spline/customized_spline_chart.dart';
import 'package:graphs/spline/spline_with_dash.dart';
import 'package:graphs/spline/vertical_spline_chart.dart';

import 'default_spline_chart.dart';

class SplineChart extends StatelessWidget {
  const SplineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Spline Chart"),
            bottom: const TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.center,
                tabs: [
                  Tab(
                    text: "Default Spline Chart",
                  ),
                  Tab(
                    text: "Spline with Dash",
                  ),
                  Tab(
                    text: "Vertical spline chart",
                  ),
                  Tab(
                    text: "Customized spline chart",
                  ),
                ]),
          ),
          body: const Padding(
            padding: EdgeInsets.symmetric(vertical: 100.0),
            child: TabBarView(
              children: [
                DefaultSplineChart(),
                SplineWithDash(),
                VerticalSplineChart(),
                CustomizedSplineChart()
              ],
            ),
          ),
        ));
  }
}
