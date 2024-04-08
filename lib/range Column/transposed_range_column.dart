import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/chart_sample_data.dart';

class TransposedRangeColumn extends StatefulWidget {
  const TransposedRangeColumn({super.key});

  @override
  State<TransposedRangeColumn> createState() => _TransposedRangeColumnState();
}

class _TransposedRangeColumnState extends State<TransposedRangeColumn> {
  List<ChartSampleData>? chartData;

  @override
  void initState() {
    chartData = <ChartSampleData>[
      ChartSampleData(
          x: 'Jul',
          y: 46,
          yValue: 63,
          secondSeriesYValue: 43,
          thirdSeriesYValue: 57),
      ChartSampleData(
          x: 'Aug',
          y: 48,
          yValue: 64,
          secondSeriesYValue: 45,
          thirdSeriesYValue: 59),
      ChartSampleData(
          x: 'Sep',
          y: 54,
          yValue: 68,
          secondSeriesYValue: 48,
          thirdSeriesYValue: 63),
      ChartSampleData(
          x: 'Oct',
          y: 57,
          yValue: 72,
          secondSeriesYValue: 50,
          thirdSeriesYValue: 68),
      ChartSampleData(
          x: 'Nov',
          y: 61,
          yValue: 75,
          secondSeriesYValue: 54,
          thirdSeriesYValue: 72),
      ChartSampleData(
          x: 'Dec',
          y: 64,
          yValue: 79,
          secondSeriesYValue: 57,
          thirdSeriesYValue: 75),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildRangeBarChart();
  }

  /// Returns the vertical range column chart.
  SfCartesianChart _buildRangeBarChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 1,
      title: ChartTitle(text: 'Temperature variation – Sydney vs Melbourne'),
      primaryXAxis: const CategoryAxis(
        majorGridLines: MajorGridLines(width: 0),
      ),
      legend: Legend(isVisible: true),
      primaryYAxis: const NumericAxis(
          axisLine: AxisLine(width: 0),
          labelFormat: '{value}°F',
          minimum: 40,
          maximum: 80),
      series: _getVerticalRangeColumnSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),

      /// To enable this property we can get the vertical series.
      isTransposed: true,
    );
  }

  /// Returns the list of chart series
  /// which need to render on the vertical range column chart.
  List<RangeColumnSeries<ChartSampleData, String>>
      _getVerticalRangeColumnSeries() {
    return <RangeColumnSeries<ChartSampleData, String>>[
      RangeColumnSeries<ChartSampleData, String>(
          dataSource: chartData,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          lowValueMapper: (ChartSampleData sales, _) => sales.y,
          highValueMapper: (ChartSampleData sales, _) => sales.yValue,
          name: 'Sydney',
          dataLabelSettings: DataLabelSettings(
              isVisible: true, labelAlignment: ChartDataLabelAlignment.top)),
      RangeColumnSeries<ChartSampleData, String>(
          dataSource: chartData,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          lowValueMapper: (ChartSampleData sales, _) =>
              sales.secondSeriesYValue,
          highValueMapper: (ChartSampleData sales, _) =>
              sales.thirdSeriesYValue,
          name: 'Melbourne',
          dataLabelSettings: DataLabelSettings(
              isVisible: true, labelAlignment: ChartDataLabelAlignment.top))
    ];
  }

  @override
  void dispose() {
    chartData!.clear();
    super.dispose();
  }
}
