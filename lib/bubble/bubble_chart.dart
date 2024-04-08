import 'package:flutter/material.dart';
import 'package:graphs/bubble/bubble_gradient.dart';
import 'package:graphs/bubble/bubble_with_multiple_series.dart';
import 'package:graphs/bubble/bubble_with_various_colors.dart';
import 'package:graphs/bubble/default_bubble_chart.dart';
import 'package:graphs/bubble/scatter_with_shapes.dart';

class BubbleChart extends StatelessWidget {
  const BubbleChart({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Bubble Chart"),
            bottom: const TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.center,
                tabs: [
                  Tab(
                    text: "Default Bubble Chart",
                  ),
                  Tab(
                    text: "Bubble with Multiple Color",
                  ),
                  Tab(
                    text: "Bubble with Gradient ",
                  ),
                  Tab(
                    text: "Bubble with Multiple Series",
                  ),
                  Tab(
                    text: "Scatter with various shapes",
                  ),
                ]),
          ),
          body: const Padding(
            padding: EdgeInsets.symmetric(vertical: 100.0),
            child: TabBarView(
              children: [
                DefaultBubbleChart(),
                BubbleWithMultipleColors(),
                BubbleWithGradient(),
                BubbleWithMultipleSeries(),
                ScatterWithShapes(),
              ],
            ),
          ),
        ));
  }
}
