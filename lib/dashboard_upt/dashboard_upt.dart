import 'package:flutter/material.dart';

class DashboardUPTPage extends StatefulWidget {
  const DashboardUPTPage({super.key});

  @override
  State<DashboardUPTPage> createState() => _DashboardUPTPageState();
}

class _DashboardUPTPageState extends State<DashboardUPTPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 300.0,
                floating: false,
                pinned: true,
                stretch: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    collapseMode: CollapseMode.parallax,
                    title: const Text("Collapsing Appbar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        )),
                    background: Image.network(
                      "https://images.pexels.com/photos/417173/pexels-photo-417173.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                      fit: BoxFit.cover,
                    )),
              ),
            ];
          },
          body: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  title: Text("Item $index", textAlign: TextAlign.center));
            },
          ),
        ),
      ),
    );
  }
}
