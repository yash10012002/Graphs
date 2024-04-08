import 'package:flutter/material.dart';
import 'package:graphs/Add%20Data%20Point/add_points.dart';
import 'package:graphs/Column_chart/column_chart.dart';
import 'package:graphs/area/area_chart.dart';
import 'package:graphs/bar/bar_chart.dart';
import 'package:graphs/box%20and%20whisker/box_and_whisker.dart';
import 'package:graphs/bubble/bubble_chart.dart';
import 'package:graphs/doughnut/doughnut_chart.dart';
import 'package:graphs/financial%20chart/financial_chart.dart';
import 'package:graphs/funnel/funnel_chart.dart';
import 'package:graphs/histogram/histodram.dart';
import 'package:graphs/line_chart/line_chart.dart';
import 'package:graphs/live%20update/live_update.dart';
import 'package:graphs/pie_chart/pie_chart.dart';
import 'package:graphs/pyramid/pyramid_chart.dart';
import 'package:graphs/radial%20bar/radial_chart.dart';
import 'package:graphs/range%20Column/range_column_chart.dart';
import 'package:graphs/range%20area/range_area.dart';
import 'package:graphs/real%20time/add_remove_series.dart';
import 'package:graphs/real%20time/update_data_source.dart';
import 'package:graphs/spline%20area%20Chart/spline_area_chart.dart';
import 'package:graphs/spline%20range%20area/spline_range_area.dart';
import 'package:graphs/spline/spline_chart.dart';
import 'package:graphs/stacked%20chart/stacked_chart.dart';
import 'package:graphs/step%20area/step_area.dart';
import 'package:graphs/step%20line/step_line_chart.dart';
import 'package:graphs/waterfall/waterfall_chart.dart';

import '100% Stacked Chart/100%_stacked_chart.dart';
import 'model/model_graph.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ModelGraph> graphList = [
    ModelGraph(
      title: "Line",
      color: Colors.redAccent,
      image: "https://cdn-icons-png.freepik.com/512/1807/1807350.png",
      widget: LineChart(),
    ),
    ModelGraph(
      title: "Column",
      color: Colors.greenAccent,
      image: "https://cdn-icons-png.freepik.com/512/9387/9387641.png",
      widget: ColumnChart(),
    ),
    ModelGraph(
        title: "Spline",
        color: Colors.yellowAccent,
        image:
            "https://www.shutterstock.com/image-vector/modern-spline-graph-business-chart-260nw-1050100730.jpg",
        widget: SplineChart()),
    ModelGraph(
      title: "Area",
      color: Colors.blueAccent,
      image: "https://cdn-icons-png.flaticon.com/512/1853/1853407.png",
      widget: AreaChart(),
    ),
    ModelGraph(
      title: "Bar",
      color: Colors.orangeAccent,
      image:
          "https://www.iconbunny.com/icons/media/catalog/product/3/2/3293.10-horizontal-bar-graph-icon-iconbunny.jpg",
      widget: BarChart(),
    ),
    ModelGraph(
      title: "Bubble",
      color: Colors.lightGreenAccent,
      image: "https://www.statology.org/wp-content/uploads/2023/06/bcol7.png",
      widget: BubbleChart(),
    ),
    ModelGraph(
      title: "Step Line",
      color: Colors.purpleAccent,
      image:
          "https://datavizproject.com/wp-content/uploads/types/Stepped-Line-Graph.png",
      widget: StepLineChart(),
    ),
    ModelGraph(
      title: "Range Column",
      color: Colors.deepOrangeAccent,
      image:
          "https://ft.syncfusion.com/featuretour/flutter/images/chart/chart-types/flutter-range-column-chart-corner-radius.png",
      widget: RangeColumnChart(),
    ),
    ModelGraph(
      title: "Stacked Chart",
      color: Colors.teal,
      image: "https://i.stack.imgur.com/GdNBa.png",
      widget: StackedChart(),
    ),
    ModelGraph(
      title: "100% Stacked Chart",
      color: Colors.indigo.shade300,
      image:
          "https://static.anychart.com/images/gallery/v8/column-charts-100-percent-stacked-column-chart.png",
      widget: FullStackedChart(),
    ),
    ModelGraph(
      title: "Financial Chart",
      color: Colors.amber,
      image:
          "https://static.vecteezy.com/system/resources/thumbnails/001/782/087/small/forex-trade-candlesticks-free-vector.jpg",
      widget: FinancialChart(),
    ),
    ModelGraph(
      title: "Spline Area Chart",
      color: Colors.grey,
      image:
          "https://ft.syncfusion.com/featuretour/winui/images/chart/cartesian-chart/chart-types/winui-spline-area-charts.png",
      widget: SplineAreaChart(),
    ),
    ModelGraph(
      title: "Step Area Chart",
      color: Colors.deepOrange,
      image:
          "https://lf9-dp-fe-cms-tos.byteorg.com/obj/bit-cloud/vchart/preview/area-chart/step-area.png",
      widget: StepAreaChart(),
    ),
    ModelGraph(
      title: "Range Area Chart",
      color: Colors.lightGreen,
      image:
          "https://blazor.syncfusion.com/documentation/chart/images/chart-types-images/blazor-range-area-chart.png",
      widget: RangeAreaChart(),
    ),
    ModelGraph(
      title: "Spline Range Area",
      color: Colors.cyan,
      image:
          "https://www.syncfusion.com/blogs/wp-content/uploads/2023/02/Visualizing-Temperature-Variation-in-a-Year-Using-Blazor-Spline-Range-Area-Chart-1.png",
      widget: SplineRangeAreaChart(),
    ),
    ModelGraph(
      title: "Histogram Chart",
      color: Colors.brown,
      image:
          "https://storage.googleapis.com/fplsblog/1/2020/04/normal-distribution-histogram.png",
      widget: HistogramChart(),
    ),
    ModelGraph(
      title: "Box and Whisker",
      color: Colors.pinkAccent.shade100,
      image:
          "https://ft.syncfusion.com/featuretour/wpf/images/chart/wpf-chart-types/wpf-box-chart-customization.png",
      widget: BoxAndWhiskerChart(),
    ),
    ModelGraph(
      title: "Waterfall",
      color: Colors.deepOrange.shade100,
      image:
          "https://miro.medium.com/v2/resize:fit:1400/1*yzW7uFUtJlENRGCsdHK1LQ.png",
      widget: WaterfallChart(),
    ),
    ModelGraph(
      title: "Live Update",
      color: Colors.teal.shade100,
      image:
          "https://cdn.syncfusion.com/content/images/FTControl/spark_chart_marker_data_label.jpg",
      widget: LiveUpdateChart(),
    ),
    ModelGraph(
      title: "Add Data Point",
      color: Colors.redAccent.shade100,
      image:
          "https://canvasjs.com/wp-content/uploads/images/gallery/vuejs-charts/dynamic/vuejs-dynamic-live-line-chart.png",
      widget: AddPoints(),
    ),
    ModelGraph(
      title: "Add Remove Series",
      color: Colors.green.shade100,
      image:
          "https://cdn.ablebits.com/_img-blog/line-graph/line-graph-excel.png",
      widget: AddRemoveSeries(),
    ),
    ModelGraph(
      title: "Update Data Source",
      color: Colors.yellow.shade100,
      image:
          "https://www.thinkoutsidetheslide.com/wp-content/uploads/2019/09/50-gap-width.jpg",
      widget: UpdateDataSource(),
    ),
    ModelGraph(
      title: "Pie Chart",
      color: Colors.teal,
      image:
          "https://media.geeksforgeeks.org/wp-content/uploads/20220914112521/PieChart.png",
      widget: PieChart(),
    ),
    ModelGraph(
      title: "Doughnut Chart",
      color: Colors.blueAccent.shade100,
      image:
          "https://www.amcharts.com/wp-content/uploads/2013/11/demo_129_none-1.png",
      widget: DoughnutChart(),
    ),
    ModelGraph(
      title: "Radial Bar Chart",
      color: Colors.purple.shade400,
      image:
          "https://user-images.githubusercontent.com/17950663/57135013-9ce8d400-6dc5-11e9-9f37-78962908d2ba.png",
      widget: RadialBarChart(),
    ),ModelGraph(
      title: "Pyramid Chart",
      color: Colors.amberAccent.shade200,
      image:
          "https://cdn-icons-png.freepik.com/512/7604/7604510.png",
      widget: PyramidChart(),
    ),ModelGraph(
      title: "Funnel Chart",
      color: Colors.grey.shade400,
      image:
          "https://inforiver.com/wp-content/uploads/Image-6-1.png",
      widget: FunnelChart(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Graphs"),
      ),
      body: GridView.builder(
          padding: EdgeInsets.all(20),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
          itemCount: graphList.length,
          itemBuilder: (context, index) {
            ModelGraph model = graphList[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => model.widget));
              },
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(model.image),
                            fit: BoxFit.contain),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        border: const Border(
                          left: BorderSide(width: 2, color: Colors.black),
                          right: BorderSide(width: 2, color: Colors.black),
                          top: BorderSide(width: 2, color: Colors.black),
                        ),
                      ),
                      padding: EdgeInsets.all(20),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12)),
                      border: const Border(
                        left: BorderSide(width: 2, color: Colors.black),
                        right: BorderSide(width: 2, color: Colors.black),
                        bottom: BorderSide(width: 2, color: Colors.black),
                      ),
                      color: model.color,
                    ),
                    // margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.all(8),
                    width: double.infinity,
                    // color: Colors.transparent,
                    child: Text(
                      model.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
