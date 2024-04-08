import 'package:flutter/material.dart';
import 'package:graphs/pyramid/datalabel_pyramid.dart';
import 'package:graphs/pyramid/default_pyramid.dart';

class PyramidChart extends StatelessWidget {
  const PyramidChart({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Pyramid Chart"),
            bottom: const TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.center,
                tabs: [
                  Tab(
                    text: "Default Pyramid Chart",
                  ),
                  Tab(
                    text: "Data label",
                  ),
                ]),
          ),
          body: const Padding(
            padding: EdgeInsets.symmetric(vertical: 100.0),
            child: TabBarView(
              children: [
                DefaultPyramid(),
                DataLabelPyramid(),
              ],
            ),
          ),
        ));
  }
}
