import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/chart_sample_data.dart';

class UpdateDataSource extends StatefulWidget {
  const UpdateDataSource({super.key});

  @override
  State<UpdateDataSource> createState() => _UpdateDataSourceState();
}

class _UpdateDataSourceState extends State<UpdateDataSource> {
  List<ChartSampleData>? chartData;
  late int count;
  Random? random;

  @override
  void initState() {
    count = 11;
    chartData = <ChartSampleData>[
      ChartSampleData(x: 1, y: 30),
      ChartSampleData(x: 3, y: 13),
      ChartSampleData(x: 5, y: 80),
      ChartSampleData(x: 7, y: 30),
      ChartSampleData(x: 9, y: 72)
    ];
    random = Random();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const double bottomPadding = 60;
    return Scaffold(
        appBar: AppBar(
          title: Text("Update Data Series"),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100),
          child: Container(child: _buildUpdateDataSourceChart()),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() {
            chartData = <ChartSampleData>[];
            chartData = _getChartData();
          }),
          backgroundColor: Colors.blueAccent,
          child: const Icon(Icons.refresh, color: Colors.white),
        ));
  }

  /// Returns the update data source cartesian chart.
  SfCartesianChart _buildUpdateDataSourceChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      primaryXAxis: const NumericAxis(
          minimum: 0, interval: 1, majorGridLines: MajorGridLines(width: 0)),
      primaryYAxis: const NumericAxis(
          rangePadding: ChartRangePadding.additional,
          axisLine: AxisLine(width: 0),
          majorTickLines: MajorTickLines(size: 0),
          minorGridLines: MinorGridLines(width: 0)),
      series: _getUpdateDataSourceSeries(),
    );
  }

  /// Returns the list of chart series which need to render
  /// on the update data source chart.
  List<ColumnSeries<ChartSampleData, num>> _getUpdateDataSourceSeries() {
    return <ColumnSeries<ChartSampleData, num>>[
      ColumnSeries<ChartSampleData, num>(
          dataSource: chartData,
          xValueMapper: (ChartSampleData sales, _) => sales.x as num,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          dataLabelSettings: const DataLabelSettings(isVisible: true)),
    ];
  }

  ///Get the random value
  int _getRandomInt(int min, int max) {
    return min + random!.nextInt(max - min);
  }

  List<ChartSampleData> _getChartData() {
    chartData!.add(ChartSampleData(x: 1, y: _getRandomInt(10, 100)));
    chartData!.add(ChartSampleData(x: 3, y: _getRandomInt(10, 100)));
    chartData!.add(ChartSampleData(x: 5, y: _getRandomInt(10, 100)));
    chartData!.add(ChartSampleData(x: 7, y: _getRandomInt(10, 100)));
    chartData!.add(ChartSampleData(x: 9, y: _getRandomInt(10, 100)));
    return chartData!;
  }

  @override
  void dispose() {
    chartData!.clear();
    super.dispose();
  }
}
