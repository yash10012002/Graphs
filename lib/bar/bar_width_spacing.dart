import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../Column_chart/cusom_directional_button.dart';
import '../model/chart_sample_data.dart';

class BarWidthAndSpacing extends StatefulWidget {
  const BarWidthAndSpacing({super.key});

  @override
  State<BarWidthAndSpacing> createState() => _BarWidthAndSpacingState();
}

class _BarWidthAndSpacingState extends State<BarWidthAndSpacing> {
  late double columnWidth;
  late double columnSpacing;
  List<ChartSampleData>? chartData;

  @override
  void initState() {
    columnWidth = 0.8;
    columnSpacing = 0.2;
    chartData = <ChartSampleData>[
      ChartSampleData(x: 2006, y: 16.219, secondSeriesYValue: 10.655),
      ChartSampleData(x: 2007, y: 16.461, secondSeriesYValue: 11.498),
      ChartSampleData(x: 2008, y: 17.427, secondSeriesYValue: 12.514),
      ChartSampleData(x: 2009, y: 13.754, secondSeriesYValue: 11.012),
      ChartSampleData(x: 2010, y: 15.743, secondSeriesYValue: 12.315),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildSpacingBarChart();
  }

  @override
  Widget buildSettings(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text('Width  ', style: TextStyle(color: Colors.blue)),
            Container(
              padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
              child: CustomDirectionalButtons(
                maxValue: 1,
                initialValue: columnWidth,
                onChanged: (double val) => setState(() {
                  columnWidth = val;
                }),
                step: 0.1,
                loop: true,
                iconColor: Colors.blue,
                style: TextStyle(fontSize: 16.0, color: Colors.blue),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: Text('Spacing  ', style: TextStyle(color: Colors.blue)),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
              child: CustomDirectionalButtons(
                maxValue: 1,
                initialValue: columnSpacing,
                onChanged: (double val) => setState(() {
                  columnSpacing = val;
                }),
                step: 0.1,
                loop: true,
                padding: 5.0,
                iconColor: Colors.blue,
                style: TextStyle(fontSize: 16.0, color: Colors.blue),
              ),
            )
          ],
        ),
      ],
    );
  }

  SfCartesianChart _buildSpacingBarChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: 'Exports & Imports of US'),
      legend: Legend(isVisible: true),
      primaryXAxis: const NumericAxis(
          minimum: 2005,
          maximum: 2011,
          interval: 1,
          majorGridLines: MajorGridLines(width: 0)),
      primaryYAxis: NumericAxis(
        labelFormat: '{value}%',
        title: AxisTitle(text: 'Goods and services (% of GDP)'),
      ),
      series: _getSpacingBarSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  List<BarSeries<ChartSampleData, num>> _getSpacingBarSeries() {
    return <BarSeries<ChartSampleData, num>>[
      BarSeries<ChartSampleData, num>(

          /// To apply the bar series width here.
          width: columnWidth,

          /// To apply the spacing betweeen to bars here.
          spacing: columnSpacing,
          dataSource: chartData,
          xValueMapper: (ChartSampleData sales, _) => sales.x as num,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          name: 'Import'),
      BarSeries<ChartSampleData, num>(
          width: columnWidth,
          spacing: columnSpacing,
          dataSource: chartData,
          xValueMapper: (ChartSampleData sales, _) => sales.x as num,
          yValueMapper: (ChartSampleData sales, _) => sales.secondSeriesYValue,
          name: 'Export')
    ];
  }

  @override
  void dispose() {
    chartData!.clear();
    super.dispose();
  }
}
