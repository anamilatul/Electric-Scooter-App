import 'package:electric_scooter_app/screen/history/history_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widget/card_history.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<HistoryViewModel>(context, listen: false).getPref();
  }

  @override
  Widget build(BuildContext context) {
    final modelHistory = Provider.of<HistoryViewModel>(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 25,
          ),
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                'History Order',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.amber,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            modelHistory.listHistory.length == 0
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 80,
                        ),
                        Image.asset(
                          "assets/images/nothing_history_order.png",
                          height: 330,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Oops! There are no history order',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: modelHistory.listHistory.length,
                    itemBuilder: (context, i) {
                      final y = modelHistory.listHistory[i];
                      return CardHistory(
                          invoice: y.invoice,
                          dateTime: y.orderAt,
                          status: y.status == "1"
                              ? "Pesanan sedang diproses"
                              : "Pesanan gagal");
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
