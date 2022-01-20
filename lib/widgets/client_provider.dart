import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/material.dart';

ValueNotifier<GraphQLClient> clientFor({
  required String uri,
  String? authenticationToken,
  String? subscriptionUri,
}) {
  Link link = HttpLink(uri);
  if (subscriptionUri != null) {
    final WebSocketLink websocketLink = WebSocketLink(
      subscriptionUri,
    );

    link = Link.split((request) => request.isSubscription, websocketLink, link);
  }

  print(
      "RESULT IF ${authenticationToken != null && !authenticationToken.isEmpty}");

  if (authenticationToken != null && !authenticationToken.isEmpty) {
    print('Auth TOKEN: ${authenticationToken}');
    link = HttpLink(uri, defaultHeaders: <String, String>{
      'Authorization': 'JWT ${authenticationToken}',
    });
  }

  return ValueNotifier<GraphQLClient>(
    GraphQLClient(
      cache: GraphQLCache(store: HiveStore()),
      link: link,
    ),
  );
}

/// Wraps the root application with the `graphql_flutter` client.
/// We use the cache for all state management.
class ClientProvider extends StatelessWidget {
  ClientProvider({
    Key? key,
    required this.child,
    required String uri,
    String? authenticationToken,
    String? subscriptionUri,
  })  : client = clientFor(
          uri: uri,
          authenticationToken: authenticationToken,
          subscriptionUri: subscriptionUri,
        ),
        super(key: key);

  final Widget child;
  final ValueNotifier<GraphQLClient> client;

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: child,
    );
  }
}
