import 'package:flutter/material.dart';
import 'package:graphs/Add%20Data%20Point/interaction_chart.dart';
import 'package:graphs/Add%20Data%20Point/programatical_chart.dart';

class AddPoints extends StatelessWidget {
  const AddPoints({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Add Points Chart"),
            bottom: const TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.center,
                tabs: [
                  Tab(
                    text: "Programmatically",
                  ),
                  Tab(
                    text: "interactions",
                  ),
                ]),
          ),
          body: const Padding(
            padding: EdgeInsets.symmetric(vertical: 100.0),
            child: TabBarView(
              children: [
                Programmatically(),
                Interactions(),
              ],
            ),
          ),
        ));
  }
}
