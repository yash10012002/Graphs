import 'package:flutter/material.dart';
import 'package:graphs/Column_chart/cusom_directional_button.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/chart_sample_data.dart';

class ColumnWidthAndSpace extends StatefulWidget {
  const ColumnWidthAndSpace({super.key});

  @override
  State<ColumnWidthAndSpace> createState() => _ColumnWidthAndSpaceState();
}

class _ColumnWidthAndSpaceState extends State<ColumnWidthAndSpace> {
  late double _columnWidth;
  late double _columnSpacing;
  List<ChartSampleData>? chartData;
  TooltipBehavior? _tooltipBehavior;

  @override
  void initState() {
    _columnWidth = 0.8;
    _columnSpacing = 0.2;
    _tooltipBehavior = TooltipBehavior(enable: true);
    chartData = <ChartSampleData>[
      ChartSampleData(
          x: 'Norway', y: 16, secondSeriesYValue: 8, thirdSeriesYValue: 13),
      ChartSampleData(
          x: 'USA', y: 8, secondSeriesYValue: 10, thirdSeriesYValue: 7),
      ChartSampleData(
          x: 'Germany', y: 12, secondSeriesYValue: 10, thirdSeriesYValue: 5),
      ChartSampleData(
          x: 'Canada', y: 4, secondSeriesYValue: 8, thirdSeriesYValue: 14),
      ChartSampleData(
          x: 'Netherlands', y: 8, secondSeriesYValue: 5, thirdSeriesYValue: 4),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildSettings(context),
        _buildSpacingColumnChart(),
      ],
    );
  }

  @override
  Widget buildSettings(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Width  ', style: TextStyle(color: Colors.blue)),
            Container(
              padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
              child: CustomDirectionalButtons(
                maxValue: 1,
                initialValue: _columnWidth,
                onChanged: (double val) {
                  setState(() {
                    _columnWidth = val;
                  });
                },
                step: 0.1,
                loop: true,
                iconColor: Colors.blue,
                style: TextStyle(fontSize: 16.0, color: Colors.blue),
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
              child: Text('Spacing  ', style: TextStyle(color: Colors.blue)),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
              child: CustomDirectionalButtons(
                maxValue: 1,
                initialValue: _columnSpacing,
                onChanged: (double val) {
                  setState(() {
                    _columnSpacing = val;
                  });
                },
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

  ///Get the cartesian chart widget
  SfCartesianChart _buildSpacingColumnChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: 'Winter olympic medals count - 2022'),
      primaryXAxis: const CategoryAxis(
        majorGridLines: MajorGridLines(width: 0),
      ),
      primaryYAxis: const NumericAxis(
          maximum: 20,
          minimum: 0,
          interval: 4,
          axisLine: AxisLine(width: 0),
          majorTickLines: MajorTickLines(size: 0)),
      series: _getDefaultColumn(),
      legend: Legend(isVisible: true),
      tooltipBehavior: _tooltipBehavior,
    );
  }

  ///Get the column series
  List<ColumnSeries<ChartSampleData, String>> _getDefaultColumn() {
    return <ColumnSeries<ChartSampleData, String>>[
      ColumnSeries<ChartSampleData, String>(

          /// To apply the column width here.
          width: _columnWidth,

          /// To apply the spacing betweeen to two columns here.
          spacing: _columnSpacing,
          dataSource: chartData,
          color: const Color.fromRGBO(251, 193, 55, 1),
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          name: 'Gold'),
      ColumnSeries<ChartSampleData, String>(
          dataSource: chartData,
          width: _columnWidth,
          spacing: _columnSpacing,
          color: const Color.fromRGBO(177, 183, 188, 1),
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.secondSeriesYValue,
          name: 'Silver'),
      ColumnSeries<ChartSampleData, String>(
          dataSource: chartData,
          width: _columnWidth,
          spacing: _columnSpacing,
          color: const Color.fromRGBO(140, 92, 69, 1),
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.thirdSeriesYValue,
          name: 'Bronze')
    ];
  }

  @override
  void dispose() {
    chartData!.clear();
    super.dispose();
  }
}
