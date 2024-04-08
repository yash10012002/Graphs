import 'package:flutter/material.dart';
import 'package:graphs/Column_chart/back_to_back_column_chart.dart';
import 'package:graphs/Column_chart/column_width_space.dart';
import 'package:graphs/Column_chart/column_with_track.dart';
import 'package:graphs/Column_chart/default_column_chart.dart';
import 'package:graphs/Column_chart/modified_axis_base.dart';

class ColumnChart extends StatelessWidget {
  const ColumnChart({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Column Chart"),
            bottom: const TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.center,
                tabs: [
                  Tab(
                    text: "Default Column Chart",
                  ),
                  Tab(
                    text: "Modified Axis base",
                  ),
                  Tab(
                    text: "back to back column",
                  ),
                  Tab(
                    text: "Column with track",
                  ),
                  Tab(
                    text: "Column Width and Spacing",
                  ),
                ]),
          ),
          body: const Padding(
            padding: EdgeInsets.symmetric(vertical: 100.0),
            child: TabBarView(
              children: [
                DefaultColumnChart(),
                ModifiedAxisBase(),
                BackToBackColumnChart(),
                ColumnWithTrack(),
                ColumnWidthAndSpace()
              ],
            ),
          ),
        ));
  }
}
