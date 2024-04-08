import 'package:flutter/material.dart';
import 'package:graphs/pie_chart/data_labbel.dart';
import 'package:graphs/pie_chart/default_pie_chart.dart';
import 'package:graphs/pie_chart/gradient_fill.dart';
import 'package:graphs/pie_chart/grouping.dart';
import 'package:graphs/pie_chart/image_fill.dart';
import 'package:graphs/pie_chart/pie_with_various_radius.dart';
import 'package:graphs/pie_chart/point_render_mode.dart';
import 'package:graphs/pie_chart/semi_pie_chart.dart';
import 'package:graphs/pie_chart/smart_data_label.dart';

class PieChart extends StatelessWidget {
  const PieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 9,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Pie Chart"),
            bottom: const TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.center,
                tabs: [
                  Tab(
                    text: "Default Pie Chart",
                  ),
                  Tab(
                    text: "Pie with Various radius",
                  ),
                  Tab(
                    text: "Semi pie chart",
                  ),
                  Tab(
                    text: "Grouping",
                  ),
                  Tab(
                    text: "Data Label",
                  ),
                  Tab(
                    text: "Smart data label",
                  ),
                  Tab(
                    text: "gradient fill",
                  ),
                  Tab(
                    text: "image fill",
                  ),
                  Tab(
                    text: "Point render mode",
                  ),
                ]),
          ),
          body: const Padding(
            padding: EdgeInsets.symmetric(vertical: 100.0),
            child: TabBarView(
              children: [
                DefaultPieChart(),
                PieWithVariousRadius(),
                SemiPieChart(),
                Grouping(),
                DataLabel(),
                SmartDataLabel(),
                GradientFill(),
                ImageFill(),
                PiePointRenderMode()
              ],
            ),
          ),
        ));
  }
}
