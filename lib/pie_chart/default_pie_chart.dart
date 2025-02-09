import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/chart_sample_data.dart';

class DefaultPieChart extends StatefulWidget {
  const DefaultPieChart({super.key});

  @override
  State<DefaultPieChart> createState() => _DefaultPieChartState();
}

class _DefaultPieChartState extends State<DefaultPieChart> {
  @override
  Widget build(BuildContext context) {
    return _buildDefaultPieChart();
  }

  /// Returns the circular  chart with pie series.
  SfCircularChart _buildDefaultPieChart() {
    return SfCircularChart(
      title: ChartTitle(text: 'Sales by sales person'),
      legend: Legend(isVisible: true),
      series: _getDefaultPieSeries(),
    );
  }

  /// Returns the pie series.
  List<PieSeries<ChartSampleData, String>> _getDefaultPieSeries() {
    return <PieSeries<ChartSampleData, String>>[
      PieSeries<ChartSampleData, String>(
          explode: true,
          explodeIndex: 0,
          dataSource: <ChartSampleData>[
            ChartSampleData(x: 'David', y: 13, text: 'David \n 13%'),
            ChartSampleData(x: 'Steve', y: 24, text: 'Steve \n 24%'),
            ChartSampleData(x: 'Jack', y: 25, text: 'Jack \n 25%'),
            ChartSampleData(x: 'Others', y: 38, text: 'Others \n 38%'),
          ],
          xValueMapper: (ChartSampleData data, _) => data.x as String,
          yValueMapper: (ChartSampleData data, _) => data.y,
          dataLabelMapper: (ChartSampleData data, _) => data.text,
          startAngle: 90,
          endAngle: 90,
          dataLabelSettings: const DataLabelSettings(isVisible: true)),
    ];
  }
}
