import 'package:flutter/material.dart';
import 'package:next_pe_task/presentation/ui/details/details_page.dart';
import 'package:next_pe_task/presentation/ui/listing/listing_page.dart';
import 'package:next_pe_task/presentation/ui/routes_name.dart';

class Routes{

  static Route<dynamic> generateRoute(RouteSettings settings){

    switch(settings.name){

      case RoutesName.listing:
        return MaterialPageRoute(builder: (BuildContext context) => const ListingPage());

      case RoutesName.details:
        return MaterialPageRoute(builder: (BuildContext context) => const DetailsPage());

    }

  } 

}