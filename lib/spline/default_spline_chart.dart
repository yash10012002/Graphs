import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/chart_sample_data.dart';

class DefaultSplineChart extends StatefulWidget {
  const DefaultSplineChart({super.key});

  @override
  State<DefaultSplineChart> createState() => _DefaultSplineChartState();
}

class _DefaultSplineChartState extends State<DefaultSplineChart> {
  @override
  void initState() {
    chartData = <ChartSampleData>[
      ChartSampleData(
          x: 'Jan', y: 43, secondSeriesYValue: 37, thirdSeriesYValue: 41),
      ChartSampleData(
          x: 'Feb', y: 45, secondSeriesYValue: 37, thirdSeriesYValue: 45),
      ChartSampleData(
          x: 'Mar', y: 50, secondSeriesYValue: 39, thirdSeriesYValue: 48),
      ChartSampleData(
          x: 'Apr', y: 55, secondSeriesYValue: 43, thirdSeriesYValue: 52),
      ChartSampleData(
          x: 'May', y: 63, secondSeriesYValue: 48, thirdSeriesYValue: 57),
      ChartSampleData(
          x: 'Jun', y: 68, secondSeriesYValue: 54, thirdSeriesYValue: 61),
      ChartSampleData(
          x: 'Jul', y: 72, secondSeriesYValue: 57, thirdSeriesYValue: 66),
      ChartSampleData(
          x: 'Aug', y: 70, secondSeriesYValue: 57, thirdSeriesYValue: 66),
      ChartSampleData(
          x: 'Sep', y: 66, secondSeriesYValue: 54, thirdSeriesYValue: 63),
      ChartSampleData(
          x: 'Oct', y: 57, secondSeriesYValue: 48, thirdSeriesYValue: 55),
      ChartSampleData(
          x: 'Nov', y: 50, secondSeriesYValue: 43, thirdSeriesYValue: 50),
      ChartSampleData(
          x: 'Dec', y: 45, secondSeriesYValue: 37, thirdSeriesYValue: 45)
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildDefaultSplineChart();
  }

  List<ChartSampleData>? chartData;

  /// Returns the defaul spline chart.
  SfCartesianChart _buildDefaultSplineChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: 'Average high/low temperature of London'),
      legend: Legend(isVisible: true),
      primaryXAxis: const CategoryAxis(
          majorGridLines: MajorGridLines(width: 0),
          labelPlacement: LabelPlacement.onTicks),
      primaryYAxis: const NumericAxis(
          minimum: 30,
          maximum: 80,
          axisLine: AxisLine(width: 0),
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          labelFormat: '{value}°F',
          majorTickLines: MajorTickLines(size: 0)),
      series: _getDefaultSplineSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  /// Returns the list of chart series which need to render on the spline chart.
  List<SplineSeries<ChartSampleData, String>> _getDefaultSplineSeries() {
    return <SplineSeries<ChartSampleData, String>>[
      SplineSeries<ChartSampleData, String>(
        dataSource: chartData,
        xValueMapper: (ChartSampleData sales, _) => sales.x as String,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
        markerSettings: const MarkerSettings(isVisible: true),
        name: 'High',
      ),
      SplineSeries<ChartSampleData, String>(
        dataSource: chartData,
        name: 'Low',
        markerSettings: const MarkerSettings(isVisible: true),
        xValueMapper: (ChartSampleData sales, _) => sales.x as String,
        yValueMapper: (ChartSampleData sales, _) => sales.secondSeriesYValue,
      )
    ];
  }

  @override
  void dispose() {
    chartData!.clear();
    super.dispose();
  }
}
