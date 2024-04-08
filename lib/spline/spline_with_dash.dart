import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/chart_sample_data.dart';

class SplineWithDash extends StatefulWidget {
  const SplineWithDash({super.key});

  @override
  State<SplineWithDash> createState() => _SplineWithDashState();
}

class _SplineWithDashState extends State<SplineWithDash> {
  List<ChartSampleData>? chartData;

  @override
  void initState() {
    chartData = <ChartSampleData>[
      ChartSampleData(
          x: 1997,
          y: 17.79,
          secondSeriesYValue: 20.32,
          thirdSeriesYValue: 22.44),
      ChartSampleData(
          x: 1998,
          y: 18.20,
          secondSeriesYValue: 21.46,
          thirdSeriesYValue: 25.18),
      ChartSampleData(
          x: 1999,
          y: 17.44,
          secondSeriesYValue: 21.72,
          thirdSeriesYValue: 24.15),
      ChartSampleData(
          x: 2000, y: 19, secondSeriesYValue: 22.86, thirdSeriesYValue: 25.83),
      ChartSampleData(
          x: 2001,
          y: 18.93,
          secondSeriesYValue: 22.87,
          thirdSeriesYValue: 25.69),
      ChartSampleData(
          x: 2002,
          y: 17.58,
          secondSeriesYValue: 21.87,
          thirdSeriesYValue: 24.75),
      ChartSampleData(
          x: 2003,
          y: 16.83,
          secondSeriesYValue: 21.67,
          thirdSeriesYValue: 27.38),
      ChartSampleData(
          x: 2004,
          y: 17.93,
          secondSeriesYValue: 21.65,
          thirdSeriesYValue: 25.31)
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildDashedSplineChart();
  }

  /// Returns the dashed spline chart.
  SfCartesianChart _buildDashedSplineChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: 'Total investment (% of GDP)'),
      legend: Legend(isVisible: true),
      primaryXAxis: const NumericAxis(
        majorGridLines: MajorGridLines(width: 0),
        interval: 1,
      ),
      primaryYAxis: const NumericAxis(
        minimum: 16,
        maximum: 28,
        interval: 4,
        labelFormat: '{value}%',
        axisLine: AxisLine(width: 0),
      ),
      series: _getDashedSplineSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  /// Returns the list of chart series
  /// which need to render on the dashed spline chart.
  List<SplineSeries<ChartSampleData, num>> _getDashedSplineSeries() {
    return <SplineSeries<ChartSampleData, num>>[
      SplineSeries<ChartSampleData, num>(
          dataSource: chartData,
          xValueMapper: (ChartSampleData sales, _) => sales.x as num,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          name: 'Brazil',

          /// To apply the dashes line for spline.
          dashArray: const <double>[12, 3, 3, 3],
          markerSettings: const MarkerSettings(isVisible: true)),
      SplineSeries<ChartSampleData, num>(
          dataSource: chartData,
          name: 'Sweden',
          dashArray: const <double>[3, 3, 3, 3],
          xValueMapper: (ChartSampleData sales, _) => sales.x as num,
          yValueMapper: (ChartSampleData sales, _) => sales.secondSeriesYValue,
          markerSettings: const MarkerSettings(isVisible: true)),
      SplineSeries<ChartSampleData, num>(
          dataSource: chartData,
          dashArray: const <double>[20, 3, 5, 10],
          name: 'Greece',
          xValueMapper: (ChartSampleData sales, _) => sales.x as num,
          yValueMapper: (ChartSampleData sales, _) => sales.thirdSeriesYValue,
          markerSettings: const MarkerSettings(isVisible: true))
    ];
  }

  @override
  void dispose() {
    chartData!.clear();
    super.dispose();
  }
}
