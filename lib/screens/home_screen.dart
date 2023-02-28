

import 'package:baguer/providers/items_providers.dart';

import 'package:baguer/widgets/auth_backgroud.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/people_list.dart';




class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {

    final resultsProviders = Provider.of<ItemProvider>(context);

    return Scaffold(
      body: AuthBackground(
        
        child:
         PeopleList(results: resultsProviders.onDisplayCharacter
        )
        ),

   );
  }
}