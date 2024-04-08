import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/chart_sample_data.dart';

class ModifiedAreaAxisBase extends StatefulWidget {
  const ModifiedAreaAxisBase({super.key});

  @override
  State<ModifiedAreaAxisBase> createState() => _ModifiedAreaAxisBaseState();
}

class _ModifiedAreaAxisBaseState extends State<ModifiedAreaAxisBase> {
  List<String>? _axis;

  //ignore: unused_field
  late String _selectedAxisType;
  late String _selectedAxis;
  late double _crossAt;
  TooltipBehavior? _tooltipBehavior;

  @override
  void initState() {
    _selectedAxisType = '-2 (modified)';
    _selectedAxis = '-2 (modified)';
    _crossAt = -2;
    _axis = <String>['-2 (modified)', '0 (default)'].toList();
    _tooltipBehavior =
        TooltipBehavior(enable: true, header: '', canShowMarker: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildSettings(context),
        Expanded(child: _buildAxisCrossingBaseValueSample()),
      ],
    );
  }

  @override
  Widget buildSettings(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter stateSetter) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Axis base value ',
              style: TextStyle(fontSize: 16.0, color: Colors.blue)),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            height: 50,
            alignment: Alignment.bottomLeft,
            child: DropdownButton<String>(
                focusColor: Colors.transparent,
                underline: Container(color: const Color(0xFFBDBDBD), height: 1),
                value: _selectedAxis,
                items: _axis!.map((String value) {
                  return DropdownMenuItem<String>(
                      value: (value != null) ? value : '-2 (modified)',
                      child: Text(value,
                          style: TextStyle(color: Colors.blueAccent)));
                }).toList(),
                onChanged: (dynamic value) {
                  _onAxisTypeChange(value.toString());
                  stateSetter(() {});
                }),
          ),
        ],
      );
    });
  }

  /// Returns the spline chart with axis crossing at provided axis value.
  SfCartesianChart _buildAxisCrossingBaseValueSample() {
    return SfCartesianChart(
      margin: const EdgeInsets.fromLTRB(10, 10, 15, 10),
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: 'Population growth rate of countries'),
      primaryXAxis: CategoryAxis(
          labelPlacement: LabelPlacement.onTicks,
          majorGridLines: const MajorGridLines(width: 0),
          edgeLabelPlacement: EdgeLabelPlacement.none,
          labelIntersectAction: AxisLabelIntersectAction.wrap,
          crossesAt: _crossAt,
          placeLabelsNearAxisLine: false),
      primaryYAxis: const NumericAxis(
          axisLine: AxisLine(width: 0),
          minimum: -2,
          maximum: 3,
          majorTickLines: MajorTickLines(size: 0)),
      series: _getSeries(),
      tooltipBehavior: _tooltipBehavior,
    );
  }

  /// Returns the list of chart series which need to render on
  /// the bar or column chart with axis crossing.

  List<CartesianSeries<ChartSampleData, String>> _getSeries() {
    return <CartesianSeries<ChartSampleData, String>>[
      AreaSeries<ChartSampleData, String>(
          color: const Color.fromRGBO(75, 135, 185, 0.6),
          borderColor: const Color.fromRGBO(75, 135, 185, 1),
          dataSource: <ChartSampleData>[
            ChartSampleData(x: 'Iceland', y: 1.13),
            ChartSampleData(x: 'Algeria', y: 1.7),
            ChartSampleData(x: 'Singapore', y: 1.82),
            ChartSampleData(x: 'Malaysia', y: 1.37),
            ChartSampleData(x: 'Moldova', y: -1.05),
            ChartSampleData(x: 'American Samoa', y: -1.3),
            ChartSampleData(x: 'Latvia', y: -1.1)
          ],
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          markerSettings: const MarkerSettings(isVisible: true)),
    ];
  }

  /// Method for updating the axis type on change.
  void _onAxisTypeChange(String item) {
    _selectedAxis = item;
    if (_selectedAxis == '-2 (modified)') {
      _selectedAxisType = '-2 (modified)';
      _crossAt = -2;
    } else if (_selectedAxis == '0 (default)') {
      _selectedAxisType = '0 (default)';
      _crossAt = 0;
    }
    setState(() {
      /// update the axis type changes
    });
  }

  @override
  void dispose() {
    _axis!.clear();
    super.dispose();
  }
}
