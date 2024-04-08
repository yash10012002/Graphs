import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/chart_sample_data.dart';

class CenterElevationDoughnut extends StatefulWidget {
  const CenterElevationDoughnut({super.key});

  @override
  State<CenterElevationDoughnut> createState() =>
      _CenterElevationDoughnutState();
}

class _CenterElevationDoughnutState extends State<CenterElevationDoughnut> {
  @override
  Widget build(BuildContext context) {
    return _buildElevationDoughnutChart();
  }

  /// Returns the circular charts with center elevation dughnut series.
  SfCircularChart _buildElevationDoughnutChart() {
    return SfCircularChart(
      /// It used to set the annotation on circular chart.
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
            height: '100%',
            width: '100%',
            widget: PhysicalModel(
              shape: BoxShape.circle,
              elevation: 10,
              color: const Color.fromRGBO(230, 230, 230, 1),
              child: Container(),
            )),
        const CircularChartAnnotation(
            widget: Text('62%',
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.5), fontSize: 25)))
      ],
      title: ChartTitle(
          text: 'Progress of a task', textStyle: const TextStyle(fontSize: 20)),
      series: _getElevationDoughnutSeries(),
    );
  }

  /// Returns the doughnut series which need to be center elevation.
  List<DoughnutSeries<ChartSampleData, String>> _getElevationDoughnutSeries() {
    return <DoughnutSeries<ChartSampleData, String>>[
      DoughnutSeries<ChartSampleData, String>(
          dataSource: <ChartSampleData>[
            ChartSampleData(
                x: 'A',
                y: 62,
                pointColor: const Color.fromRGBO(0, 220, 252, 1)),
            ChartSampleData(
                x: 'B',
                y: 38,
                pointColor: const Color.fromRGBO(230, 230, 230, 1))
          ],
          animationDuration: 0,
          xValueMapper: (ChartSampleData data, _) => data.x as String,
          yValueMapper: (ChartSampleData data, _) => data.y,
          pointColorMapper: (ChartSampleData data, _) => data.pointColor)
    ];
  }
}
