import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/chart_sample_data.dart';

class Programmatically extends StatefulWidget {
  const Programmatically({super.key});

  @override
  State<Programmatically> createState() => _ProgrammaticallyState();
}

class _ProgrammaticallyState extends State<Programmatically> {
  ChartSeriesController<ChartSampleData, num>? _chartSeriesController;

  /// List for storing the chart series data points.
  List<ChartSampleData>? chartData;
  late int count;

  /// Get the random value
  int _getRandomInt(int min, int max) {
    final Random random = Random();
    return min + random.nextInt(max - min);
  }

  /// Add the data point into the line series
  List<ChartSampleData> _addDataPoint() {
    chartData!.add(ChartSampleData(x: count, y: _getRandomInt(10, 100)));
    count = count + 1;
    return chartData!;
  }

  /// Remove the data point from the line series
  List<ChartSampleData> _removeDataPoint() {
    if (chartData != null && chartData!.isNotEmpty) {
      chartData!.removeAt(chartData!.length - 1);
    }
    count = count - 1;
    return chartData!;
  }

  @override
  void initState() {
    count = 11;
    chartData = <ChartSampleData>[
      ChartSampleData(x: 0, y: 10),
      ChartSampleData(x: 1, y: 13),
      ChartSampleData(x: 2, y: 80),
      ChartSampleData(x: 3, y: 30),
      ChartSampleData(x: 4, y: 72),
      ChartSampleData(x: 5, y: 19),
      ChartSampleData(x: 6, y: 30),
      ChartSampleData(x: 7, y: 92),
      ChartSampleData(x: 8, y: 48),
      ChartSampleData(x: 9, y: 20),
      ChartSampleData(x: 10, y: 51),
    ];

    if (chartData!.length > 11) {
      chartData!.removeRange(10, chartData!.length - 1);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const double bottomPadding = 40;
    return Scaffold(
        backgroundColor: Colors.white54,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, bottomPadding),
          child: Container(child: _buildAddRemovePointsChart()),
        ),
        floatingActionButton: Stack(
          children: <Widget>[
            Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 50, 0, 0),
                    child: SizedBox(
                        height: 45,
                        width: 110,
                        child: InkWell(
                            splashColor: Colors.transparent,
                            child: Row(children: <Widget>[
                              SizedBox(
                                width: 45,
                                height: 50,
                                child: IconButton(
                                  onPressed: () {
                                    chartData = _addDataPoint();
                                    _chartSeriesController?.updateDataSource(
                                      addedDataIndexes: <int>[
                                        chartData!.length - 1
                                      ],
                                    );
                                  },
                                  icon: Icon(Icons.add_circle,
                                      size: 50, color: Colors.blue),
                                ),
                              ),
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: SizedBox(
                                      width: 45,
                                      height: 50,
                                      child: IconButton(
                                          onPressed: () {
                                            if (chartData!.length > 1) {
                                              chartData = _removeDataPoint();
                                              _chartSeriesController
                                                  ?.updateDataSource(
                                                updatedDataIndexes: <int>[
                                                  chartData!.length - 1
                                                ],
                                                removedDataIndexes: <int>[
                                                  chartData!.length - 1
                                                ],
                                              );
                                            }
                                          },
                                          icon: Icon(
                                            Icons.remove_circle,
                                            size: 50,
                                            color: Colors.blue,
                                          ))))
                            ])))))
          ],
        ));
  }

  /// Returns the chart with add and remove points options.
  SfCartesianChart _buildAddRemovePointsChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      primaryXAxis: const NumericAxis(
          majorGridLines: MajorGridLines(width: 0),
          edgeLabelPlacement: EdgeLabelPlacement.shift),
      primaryYAxis: const NumericAxis(
          axisLine: AxisLine(width: 0),
          majorTickLines: MajorTickLines(size: 0)),
      series: _getAddRemovePointSeries(),
    );
  }

  /// Returns the list of chart series which need to render
  /// on the chart with add and remove points.
  List<LineSeries<ChartSampleData, num>> _getAddRemovePointSeries() {
    return <LineSeries<ChartSampleData, num>>[
      LineSeries<ChartSampleData, num>(
          onRendererCreated:
              (ChartSeriesController<ChartSampleData, num> controller) {
            _chartSeriesController = controller;
          },
          animationDuration: 0,
          dataSource: chartData,
          xValueMapper: (ChartSampleData sales, _) => sales.x as num,
          yValueMapper: (ChartSampleData sales, _) => sales.y),
    ];
  }

  @override
  void dispose() {
    chartData!.clear();
    _chartSeriesController = null;
    super.dispose();
  }
}
