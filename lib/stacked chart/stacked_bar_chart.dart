import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/chart_sample_data.dart';

class StackedBarChart extends StatefulWidget {
  const StackedBarChart({super.key});

  @override
  State<StackedBarChart> createState() => _StackedBarChartState();
}

class _StackedBarChartState extends State<StackedBarChart> {
  List<ChartSampleData>? chartData;

  TooltipBehavior? _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior =
        TooltipBehavior(enable: true, header: '', canShowMarker: false);
    chartData = <ChartSampleData>[
      ChartSampleData(x: 'Jan', y: 6, yValue: 6, secondSeriesYValue: -1),
      ChartSampleData(x: 'Feb', y: 8, yValue: 8, secondSeriesYValue: -1.5),
      ChartSampleData(x: 'Mar', y: 12, yValue: 11, secondSeriesYValue: -2),
      ChartSampleData(x: 'Apr', y: 15.5, yValue: 16, secondSeriesYValue: -2.5),
      ChartSampleData(x: 'May', y: 20, yValue: 21, secondSeriesYValue: -3),
      ChartSampleData(x: 'June', y: 24, yValue: 25, secondSeriesYValue: -3.5),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildStackedBarChart();
  }

  /// Reutrns the cartesian stacked bar chart.
  SfCartesianChart _buildStackedBarChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 1,
      title: ChartTitle(text: 'Sales comparison of fruits'),
      legend: Legend(isVisible: true),
      primaryXAxis: const CategoryAxis(
        majorGridLines: MajorGridLines(width: 0),
      ),
      primaryYAxis: const NumericAxis(
          axisLine: AxisLine(width: 0),
          labelFormat: '{value}%',
          majorTickLines: MajorTickLines(size: 0)),
      series: _getStackedBarSeries(),
      tooltipBehavior: _tooltipBehavior,
    );
  }

  /// Returns the list of chart series which need to render
  /// on the stacked bar chart.
  List<StackedBarSeries<ChartSampleData, String>> _getStackedBarSeries() {
    return <StackedBarSeries<ChartSampleData, String>>[
      StackedBarSeries<ChartSampleData, String>(
          dataSource: chartData,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          name: 'Apple'),
      StackedBarSeries<ChartSampleData, String>(
          dataSource: chartData,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.yValue,
          name: 'Orange'),
      StackedBarSeries<ChartSampleData, String>(
          dataSource: chartData,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.secondSeriesYValue,
          name: 'Wastage')
    ];
  }

  @override
  void dispose() {
    chartData!.clear();
    super.dispose();
  }
}
