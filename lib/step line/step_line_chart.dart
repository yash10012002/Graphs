import 'package:flutter/material.dart';
import 'package:graphs/step%20line/default_step_line.dart';
import 'package:graphs/step%20line/step_line_with_dash.dart';
import 'package:graphs/step%20line/vertical_step_line.dart';

class StepLineChart extends StatelessWidget {
  const StepLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Step Line Chart"),
            bottom: const TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.center,
                tabs: [
                  Tab(
                    text: "Default Step line Chart",
                  ),
                  Tab(
                    text: "Step line with Dash",
                  ),
                  Tab(
                    text: "Vertical step line chart",
                  ),
                ]),
          ),
          body: const Padding(
            padding: EdgeInsets.symmetric(vertical: 100.0),
            child: TabBarView(
              children: [
                DefaultStepLine(),
                StepLineWithDash(),
                VerticalStepLine(),
              ],
            ),
          ),
        ));
  }
}
