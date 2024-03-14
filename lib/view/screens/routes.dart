import 'package:flutter/material.dart';
import 'package:next_pe_task/view/screens/details/details_page.dart';
import 'package:next_pe_task/view/screens/listing/listing_page.dart';
import 'package:next_pe_task/view/screens/routes_name.dart';

class Routes{

  static Route<dynamic> generateRoute(RouteSettings settings){

    switch(settings.name){

      case RoutesName.listing:
        return MaterialPageRoute(builder: (BuildContext context) => const ListingPage());

      case RoutesName.details:
        return MaterialPageRoute(builder: (BuildContext context) => const DetailsPage());

      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
                child: Text("No Route Defined"),
              ),
          );
        });

    }

  } 

}