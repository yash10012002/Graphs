import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/chart_sample_data.dart';

class ScatterWithShapes extends StatefulWidget {
  const ScatterWithShapes({super.key});

  @override
  State<ScatterWithShapes> createState() => _ScatterWithShapesState();
}

class _ScatterWithShapesState extends State<ScatterWithShapes> {
  List<ChartSampleData>? chartData;
  TooltipBehavior? _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior =
        TooltipBehavior(enable: true, header: '', canShowMarker: false);
    chartData = <ChartSampleData>[
      ChartSampleData(
          x: 1950, y: 0.8, secondSeriesYValue: 1.4, thirdSeriesYValue: 2),
      ChartSampleData(
          x: 1955, y: 1.2, secondSeriesYValue: 1.7, thirdSeriesYValue: 2.4),
      ChartSampleData(
          x: 1960, y: 0.9, secondSeriesYValue: 1.5, thirdSeriesYValue: 2.2),
      ChartSampleData(
          x: 1965, y: 1, secondSeriesYValue: 1.6, thirdSeriesYValue: 2.5),
      ChartSampleData(
          x: 1970, y: 0.8, secondSeriesYValue: 1.4, thirdSeriesYValue: 2.2),
      ChartSampleData(
          x: 1975, y: 1, secondSeriesYValue: 1.8, thirdSeriesYValue: 2.4),
      ChartSampleData(
          x: 1980, y: 1, secondSeriesYValue: 1.7, thirdSeriesYValue: 2),
      ChartSampleData(
          x: 1985, y: 1.2, secondSeriesYValue: 1.9, thirdSeriesYValue: 2.3),
      ChartSampleData(
          x: 1990, y: 1.1, secondSeriesYValue: 1.4, thirdSeriesYValue: 2),
      ChartSampleData(
          x: 1995, y: 1.2, secondSeriesYValue: 1.8, thirdSeriesYValue: 2.2),
      ChartSampleData(
          x: 2000, y: 1.4, secondSeriesYValue: 2, thirdSeriesYValue: 2.4),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildShapesScatterChart();
  }

  /// Returns the scatter chart with various shapes.
  SfCartesianChart _buildShapesScatterChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: 'Inflation Analysis'),
      primaryXAxis: NumericAxis(
        minimum: 1945,
        maximum: 2005,
        title: AxisTitle(text: 'Year'),
        labelIntersectAction: AxisLabelIntersectAction.multipleRows,
        majorGridLines: const MajorGridLines(width: 0),
      ),
      legend: Legend(isVisible: true),
      primaryYAxis: NumericAxis(
          title: AxisTitle(text: 'Inflation Rate(%)'),
          labelFormat: '{value}%',
          axisLine: const AxisLine(width: 0),
          majorTickLines: const MajorTickLines(size: 0)),
      tooltipBehavior: _tooltipBehavior,
      series: _getScatterShapesSeries(),
    );
  }

  /// Returns the list of chart series with various marker shapes which need to
  /// render on the scatter chart.
  List<ScatterSeries<ChartSampleData, num>> _getScatterShapesSeries() {
    return <ScatterSeries<ChartSampleData, num>>[
      ScatterSeries<ChartSampleData, num>(
          dataSource: chartData,
          xValueMapper: (ChartSampleData sales, _) => sales.x as num,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          markerSettings: const MarkerSettings(
              width: 15, height: 15, shape: DataMarkerType.diamond),
          name: 'India'),
      ScatterSeries<ChartSampleData, num>(
          dataSource: chartData,
          xValueMapper: (ChartSampleData sales, _) => sales.x as num,
          yValueMapper: (ChartSampleData sales, _) => sales.secondSeriesYValue,
          markerSettings: const MarkerSettings(
              width: 15, height: 15, shape: DataMarkerType.triangle),
          name: 'China'),
      ScatterSeries<ChartSampleData, num>(
          dataSource: chartData,
          xValueMapper: (ChartSampleData sales, _) => sales.x as num,
          yValueMapper: (ChartSampleData sales, _) => sales.thirdSeriesYValue,
          markerSettings: const MarkerSettings(
              width: 15, height: 15, shape: DataMarkerType.pentagon),
          name: 'Japan')
    ];
  }

  @override
  void dispose() {
    chartData!.clear();
    super.dispose();
  }
}
