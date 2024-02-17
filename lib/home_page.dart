import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import 'account_info.dart';
import 'card_info_layout.dart';
import 'credit_card.dart';
import 'details_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool infoCardVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: CardInfoLayout(
        padding: MediaQuery.of(context).padding,
        card: CreditCard(
          onPressed: () => setState(
            () {
              infoCardVisible = !infoCardVisible;
            },
          ),
        ),
        infoCard: const AccountInfo(),
        detailsCard: const DetailsCard(),
        infoCardVisible: infoCardVisible,
      ),
    );
  }
}

@UseCase(
  name: 'Home Page',
  type: HomePage,
)
Widget homePage(BuildContext context) => const HomePage();
