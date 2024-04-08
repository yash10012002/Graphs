import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/chart_sample_data.dart';

class DefaultDoughnutChart extends StatefulWidget {
  const DefaultDoughnutChart({super.key});

  @override
  State<DefaultDoughnutChart> createState() => _DefaultDoughnutChartState();
}

class _DefaultDoughnutChartState extends State<DefaultDoughnutChart> {
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    _tooltip = TooltipBehavior(enable: true, format: 'point.x : point.y%');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildDefaultDoughnutChart();
  }

  /// Return the circular chart with default doughnut series.
  SfCircularChart _buildDefaultDoughnutChart() {
    return SfCircularChart(
      title: ChartTitle(text: 'Composition of ocean water'),
      legend:
          Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
      series: _getDefaultDoughnutSeries(),
      tooltipBehavior: _tooltip,
    );
  }

  /// Returns the doughnut series which need to be render.
  List<DoughnutSeries<ChartSampleData, String>> _getDefaultDoughnutSeries() {
    return <DoughnutSeries<ChartSampleData, String>>[
      DoughnutSeries<ChartSampleData, String>(
          explode: true,
          dataSource: <ChartSampleData>[
            ChartSampleData(x: 'Chlorine', y: 55, text: '55%'),
            ChartSampleData(x: 'Sodium', y: 31, text: '31%'),
            ChartSampleData(x: 'Magnesium', y: 7.7, text: '7.7%'),
            ChartSampleData(x: 'Sulfur', y: 3.7, text: '3.7%'),
            ChartSampleData(x: 'Calcium', y: 1.2, text: '1.2%'),
            ChartSampleData(x: 'Others', y: 1.4, text: '1.4%'),
          ],
          xValueMapper: (ChartSampleData data, _) => data.x as String,
          yValueMapper: (ChartSampleData data, _) => data.y,
          dataLabelMapper: (ChartSampleData data, _) => data.text,
          dataLabelSettings: const DataLabelSettings(isVisible: true))
    ];
  }
}
