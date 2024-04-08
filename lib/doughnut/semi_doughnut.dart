import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../Column_chart/cusom_directional_button.dart';
import '../model/chart_sample_data.dart';

class SemiDoughnut extends StatefulWidget {
  const SemiDoughnut({super.key});

  @override
  State<SemiDoughnut> createState() => _SemiDoughnutState();
}

class _SemiDoughnutState extends State<SemiDoughnut> {
  late int startAngle;
  late int endAngle;

  @override
  void initState() {
    startAngle = 270;
    endAngle = 90;
    super.initState();
  }

  @override
  Widget buildSettings(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Start angle  ',
                style: TextStyle(
                  fontSize: 16.0,
                )),
            Container(
              padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
              child: CustomDirectionalButtons(
                minValue: 90,
                maxValue: 270,
                initialValue: startAngle.toDouble(),
                onChanged: (double val) => setState(() {
                  startAngle = val.toInt();
                }),
                step: 10,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: Text('End angle ',
                  style: TextStyle(
                    fontSize: 16.0,
                  )),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
              child: CustomDirectionalButtons(
                minValue: 90,
                maxValue: 270,
                initialValue: endAngle.toDouble(),
                onChanged: (double val) => setState(() {
                  endAngle = val.toInt();
                }),
                step: 10,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSemiDoughnutChart(),
        buildSettings(context),
      ],
    );
  }

  /// Returns the circular series with semi doughunut series.
  SfCircularChart _buildSemiDoughnutChart() {
    return SfCircularChart(
      title: ChartTitle(text: 'Sales by sales person'),
      legend: Legend(isVisible: true),
      centerY: '60%',
      series: _getSemiDoughnutSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  /// Returns  semi doughnut series.
  List<DoughnutSeries<ChartSampleData, String>> _getSemiDoughnutSeries() {
    return <DoughnutSeries<ChartSampleData, String>>[
      DoughnutSeries<ChartSampleData, String>(
          dataSource: <ChartSampleData>[
            ChartSampleData(x: 'David', y: 45, text: 'David 45%'),
            ChartSampleData(x: 'Steve', y: 15, text: 'Steve 15%'),
            ChartSampleData(x: 'Jack', y: 21, text: 'Jack 21%'),
            ChartSampleData(x: 'Others', y: 19, text: 'Others 19%')
          ],
          innerRadius: '70%',
          radius: '59%',
          startAngle: startAngle,
          endAngle: endAngle,
          xValueMapper: (ChartSampleData data, _) => data.x as String,
          yValueMapper: (ChartSampleData data, _) => data.y,
          dataLabelMapper: (ChartSampleData data, _) => data.text,
          dataLabelSettings: const DataLabelSettings(
              isVisible: true, labelPosition: ChartDataLabelPosition.outside))
    ];
  }
}
