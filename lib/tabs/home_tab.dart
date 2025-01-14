import 'package:flutter/material.dart';
import 'retail_tab.dart';
import 'wholesale_tab.dart';
import 'manufacture_tab.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to AK Jilani Garments!'),
          bottom: const TabBar(
            indicatorColor: Colors.yellow,
            indicatorWeight: 4.0,
            labelColor: Colors.yellow,
            unselectedLabelColor: Colors.white70,
            labelStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            tabs: [
              Tab(text: 'Retail'),
              Tab(text: 'Wholesale'),
              Tab(text: 'Manufacture for me'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            RetailTab(),
            WholesaleTab(),
            ManufactureTab(),
          ],
        ),
      ),
    );
  }
}