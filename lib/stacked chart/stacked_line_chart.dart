import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/chart_sample_data.dart';

class StackedLineChart extends StatefulWidget {
  const StackedLineChart({super.key});

  @override
  State<StackedLineChart> createState() => _StackedLineChartState();
}

class _StackedLineChartState extends State<StackedLineChart> {
  List<ChartSampleData>? chartData;

  TrackballBehavior? _trackballBehavior;

  @override
  void initState() {
    _trackballBehavior = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);
    chartData = <ChartSampleData>[
      ChartSampleData(
          x: 'Food',
          y: 55,
          yValue: 40,
          secondSeriesYValue: 45,
          thirdSeriesYValue: 48),
      ChartSampleData(
          x: 'Transport',
          y: 33,
          yValue: 45,
          secondSeriesYValue: 54,
          thirdSeriesYValue: 28),
      ChartSampleData(
          x: 'Medical',
          y: 43,
          yValue: 23,
          secondSeriesYValue: 20,
          thirdSeriesYValue: 34),
      ChartSampleData(
          x: 'Clothes',
          y: 32,
          yValue: 54,
          secondSeriesYValue: 23,
          thirdSeriesYValue: 54),
      ChartSampleData(
          x: 'Books',
          y: 56,
          yValue: 18,
          secondSeriesYValue: 43,
          thirdSeriesYValue: 55),
      ChartSampleData(
          x: 'Others',
          y: 23,
          yValue: 54,
          secondSeriesYValue: 33,
          thirdSeriesYValue: 56),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildStackedLineChart();
  }

  /// Returns the cartesian stacked line chart.
  SfCartesianChart _buildStackedLineChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: 'Monthly expense of a family'),
      legend: Legend(isVisible: true),
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
        labelRotation: -45,
      ),
      primaryYAxis: const NumericAxis(
          maximum: 200,
          axisLine: AxisLine(width: 0),
          labelFormat: r'${value}',
          majorTickLines: MajorTickLines(size: 0)),
      series: _getStackedLineSeries(),
      trackballBehavior: _trackballBehavior,
    );
  }

  /// Returns the list of chart seris which need to render
  /// on the stacked line chart.
  List<StackedLineSeries<ChartSampleData, String>> _getStackedLineSeries() {
    return <StackedLineSeries<ChartSampleData, String>>[
      StackedLineSeries<ChartSampleData, String>(
          dataSource: chartData,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          name: 'Father',
          markerSettings: const MarkerSettings(isVisible: true)),
      StackedLineSeries<ChartSampleData, String>(
          dataSource: chartData,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.yValue,
          name: 'Mother',
          markerSettings: const MarkerSettings(isVisible: true)),
      StackedLineSeries<ChartSampleData, String>(
          dataSource: chartData,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.secondSeriesYValue,
          name: 'Son',
          markerSettings: const MarkerSettings(isVisible: true)),
      StackedLineSeries<ChartSampleData, String>(
          dataSource: chartData,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.thirdSeriesYValue,
          name: 'Daughter',
          markerSettings: const MarkerSettings(isVisible: true))
    ];
  }

  @override
  void dispose() {
    chartData!.clear();
    super.dispose();
  }
}
