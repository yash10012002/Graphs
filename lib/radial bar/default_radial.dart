import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/chart_sample_data.dart';

class DefaultRadialBarChart extends StatefulWidget {
  const DefaultRadialBarChart({super.key});

  @override
  State<DefaultRadialBarChart> createState() => _DefaultRadialBarChartState();
}

class _DefaultRadialBarChartState extends State<DefaultRadialBarChart> {
  TooltipBehavior? _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior =
        TooltipBehavior(enable: true, format: 'point.x : point.ym');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildDefaultRadialBarChart();
  }

  /// Returns the circular chart with radial series.
  SfCircularChart _buildDefaultRadialBarChart() {
    return SfCircularChart(
      key: GlobalKey(),
      title: ChartTitle(text: 'Shot put distance'),
      series: _getRadialBarDefaultSeries(),
      tooltipBehavior: _tooltipBehavior,
    );
  }

  /// Returns default radial series.
  List<RadialBarSeries<ChartSampleData, String>> _getRadialBarDefaultSeries() {
    return <RadialBarSeries<ChartSampleData, String>>[
      RadialBarSeries<ChartSampleData, String>(
          maximumValue: 15,
          dataLabelSettings: const DataLabelSettings(
              isVisible: true, textStyle: TextStyle(fontSize: 10.0)),
          dataSource: <ChartSampleData>[
            ChartSampleData(
                x: 'John',
                y: 10,
                text: '100%',
                pointColor: const Color.fromRGBO(248, 177, 149, 1.0)),
            ChartSampleData(
                x: 'Almaida',
                y: 11,
                text: '100%',
                pointColor: const Color.fromRGBO(246, 114, 128, 1.0)),
            ChartSampleData(
                x: 'Don',
                y: 12,
                text: '100%',
                pointColor: const Color.fromRGBO(61, 205, 171, 1.0)),
            ChartSampleData(
                x: 'Tom',
                y: 13,
                text: '100%',
                pointColor: const Color.fromRGBO(1, 174, 190, 1.0)),
          ],
          cornerStyle: CornerStyle.bothCurve,
          gap: '10%',
          radius: '90%',
          xValueMapper: (ChartSampleData data, _) => data.x as String,
          yValueMapper: (ChartSampleData data, _) => data.y,
          pointRadiusMapper: (ChartSampleData data, _) => data.text,
          pointColorMapper: (ChartSampleData data, _) => data.pointColor,
          dataLabelMapper: (ChartSampleData data, _) => data.x as String)
    ];
  }
}
