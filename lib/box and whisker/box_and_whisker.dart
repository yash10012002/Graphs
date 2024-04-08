import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/chart_sample_data.dart';

class BoxAndWhiskerChart extends StatefulWidget {
  const BoxAndWhiskerChart({super.key});

  @override
  State<BoxAndWhiskerChart> createState() => _BoxAndWhiskerChartState();
}

class _BoxAndWhiskerChartState extends State<BoxAndWhiskerChart> {
  late String _selectMode;
  BoxPlotMode? _boxMode;
  late bool _mean;
  List<String>? _modeType;
  TooltipBehavior? _tooltipBehavior;

  Widget buildSettings(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter stateSetter) {
      return ListView(
        shrinkWrap: true,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Box plot mode ',
                  style: TextStyle(fontSize: 16.0, color: Colors.black)),
              Container(
                padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                child: DropdownButton<String>(
                    focusColor: Colors.transparent,
                    underline:
                        Container(color: const Color(0xFFBDBDBD), height: 1),
                    value: _selectMode,
                    items: _modeType!.map((String value) {
                      return DropdownMenuItem<String>(
                          value: (value != null) ? value : 'normal',
                          child: Text(value,
                              style: TextStyle(color: Colors.black)));
                    }).toList(),
                    onChanged: (dynamic value) {
                      _onModeChange(value.toString());
                      stateSetter(() {});
                    }),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Mean',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
                child: SizedBox(
                    width: 90,
                    child: CheckboxListTile(
                        activeColor: Colors.indigo,
                        value: _mean,
                        onChanged: (bool? value) {
                          setState(() {
                            _mean = value!;
                            stateSetter(() {});
                          });
                        })),
              ),
            ],
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("box and Whisker Chart"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 100),
        child: Column(
          children: [
            _buildDefaultWhiskerChart(),
            buildSettings(context),
          ],
        ),
      ),
    );
  }

  /// Get the cartesian chart with histogram series
  SfCartesianChart _buildDefaultWhiskerChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title:
          const ChartTitle(text: 'Employees age group in various departments'),
      primaryXAxis: const CategoryAxis(
          majorGridLines: MajorGridLines(width: 0),
          labelIntersectAction: AxisLabelIntersectAction.rotate45),
      primaryYAxis: const NumericAxis(
          name: 'Age',
          minimum: 10,
          maximum: 60,
          interval: 10,
          axisLine: AxisLine(width: 0),
          majorTickLines: MajorTickLines(size: 0)),
      series: _getBoxWhiskerSeries(),
      tooltipBehavior: _tooltipBehavior,
    );
  }

  ///Get the histogram series
  List<BoxAndWhiskerSeries<SalesData, dynamic>> _getBoxWhiskerSeries() {
    return <BoxAndWhiskerSeries<SalesData, dynamic>>[
      BoxAndWhiskerSeries<SalesData, dynamic>(
        name: 'Department',
        dataSource: <SalesData>[
          SalesData(
              'Development',
              <int>[
                22,
                22,
                23,
                25,
                25,
                25,
                26,
                27,
                27,
                28,
                28,
                29,
                30,
                32,
                34,
                32,
                34,
                36,
                35,
                38
              ],
              null,
              const Color.fromRGBO(75, 135, 185, 0.9)),
          SalesData(
              'HR',
              <int>[22, 24, 25, 30, 32, 34, 36, 38, 39, 41, 35, 36, 40, 56],
              null,
              const Color.fromRGBO(75, 135, 185, 0.9)),
          SalesData(
              'Finance  ',
              <int>[26, 27, 28, 30, 32, 34, 35, 37, 35, 37, 45],
              null,
              const Color.fromRGBO(75, 135, 185, 0.9)),
          SalesData(
              'Inventory',
              <int>[21, 23, 24, 25, 26, 27, 28, 30, 34, 36, 38],
              null,
              const Color.fromRGBO(75, 135, 185, 0.9)),
          SalesData('Sales', <int>[27, 26, 28, 29, 29, 29, 32, 35, 32, 38, 53],
              null, const Color.fromRGBO(75, 135, 185, 0.9)),
          SalesData(
              'R&D',
              <int>[26, 27, 29, 32, 34, 35, 36, 37, 38, 39, 41, 43, 58],
              null,
              const Color.fromRGBO(75, 135, 185, 0.9)),
          SalesData('Graphics', <int>[26, 28, 29, 30, 32, 33, 35, 36, 52], null,
              const Color.fromRGBO(75, 135, 185, 0.9)),
        ],
        showMean: _mean,
        boxPlotMode: _boxMode!,
        borderColor: Colors.black,
        xValueMapper: (SalesData sales, _) => sales.x,
        yValueMapper: (SalesData sales, _) => sales.y,
        pointColorMapper: (SalesData sales, _) => sales.color,
      )
    ];
  }

  @override
  void initState() {
    _selectMode = 'normal';
    _mean = true;
    _boxMode = BoxPlotMode.normal;
    _modeType = <String>['normal', 'exclusive', 'inclusive'].toList();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  void _onModeChange(String item) {
    setState(() {
      _selectMode = item;
      if (_selectMode == 'normal') {
        _boxMode = BoxPlotMode.normal;
      } else if (_selectMode == 'inclusive') {
        _boxMode = BoxPlotMode.inclusive;
      } else if (_selectMode == 'exclusive') {
        _boxMode = BoxPlotMode.exclusive;
      }
    });
  }

  @override
  void dispose() {
    _modeType!.clear();
    super.dispose();
  }
}
