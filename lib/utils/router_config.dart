import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:next_pe_task/utils/routes_name.dart';
import 'package:next_pe_task/view/screens/details/details_page.dart';
import 'package:next_pe_task/view/screens/listing/listing_page.dart';

class GoRouterConfig {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: RoutesName.listing,
        path: '/',
        pageBuilder: (context, state) {
          return const MaterialPage(child: ListingPage());
        },
        routes: [GoRoute(
        name: RoutesName.details,
        path: 'details/:id',
        pageBuilder: (context, state) {
          final id = state.pathParameters['id'];
          return MaterialPage(child: DetailsPage(id: id!));
        },
      ),]
      ),
    ],
  );
}