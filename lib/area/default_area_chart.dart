import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/chart_sample_data.dart';

class DefaultAreaChart extends StatefulWidget {
  const DefaultAreaChart({super.key});

  @override
  State<DefaultAreaChart> createState() => _DefaultAreaChartState();
}

class _DefaultAreaChartState extends State<DefaultAreaChart> {
  List<ChartSampleData>? chartData;

  @override
  void initState() {
    chartData = <ChartSampleData>[
      ChartSampleData(x: DateTime(2000), y: 4, secondSeriesYValue: 2.6),
      ChartSampleData(x: DateTime(2001), y: 3.0, secondSeriesYValue: 2.8),
      ChartSampleData(x: DateTime(2002), y: 3.8, secondSeriesYValue: 2.6),
      ChartSampleData(x: DateTime(2003), y: 3.4, secondSeriesYValue: 3),
      ChartSampleData(x: DateTime(2004), y: 3.2, secondSeriesYValue: 3.6),
      ChartSampleData(x: DateTime(2005), y: 3.9, secondSeriesYValue: 3),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildDefaultAreaChart();
  }

  /// Returns the default cartesian area chart.
  SfCartesianChart _buildDefaultAreaChart() {
    return SfCartesianChart(
      legend: Legend(isVisible: true, opacity: 0.7),
      title: ChartTitle(text: 'Average sales comparison'),
      plotAreaBorderWidth: 0,
      primaryXAxis: DateTimeAxis(
          dateFormat: DateFormat.y(),
          interval: 1,
          intervalType: DateTimeIntervalType.years,
          majorGridLines: const MajorGridLines(width: 0),
          edgeLabelPlacement: EdgeLabelPlacement.shift),
      primaryYAxis: NumericAxis(
          labelFormat: '{value}M',
          title: AxisTitle(text: 'Revenue in millions'),
          interval: 1,
          axisLine: const AxisLine(width: 0),
          majorTickLines: const MajorTickLines(size: 0)),
      series: _getDefaultAreaSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  /// Returns the list of Chart series
  /// which need to render on the default area chart.
  List<AreaSeries<ChartSampleData, DateTime>> _getDefaultAreaSeries() {
    return <AreaSeries<ChartSampleData, DateTime>>[
      AreaSeries<ChartSampleData, DateTime>(
        dataSource: chartData,
        opacity: 0.7,
        name: 'Product A',
        xValueMapper: (ChartSampleData sales, _) => sales.x as DateTime,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
      ),
      AreaSeries<ChartSampleData, DateTime>(
        dataSource: chartData,
        opacity: 0.7,
        name: 'Product B',
        xValueMapper: (ChartSampleData sales, _) => sales.x as DateTime,
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
