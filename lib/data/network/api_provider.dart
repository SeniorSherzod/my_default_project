import 'package:flutter/cupertino.dart';
import 'package:graphql/client.dart';
import '../../quiery/countries_quiery.dart';
import '../models/country_model.dart';
import '../models/network_responce.dart';

class ApiClient {
  ApiClient({required this.graphQLClient});

  factory ApiClient.create() {
    final _httpLink = HttpLink('https://countries.trevorblades.com');
    final link = Link.from([_httpLink]);
    return ApiClient(
      graphQLClient: GraphQLClient(
        link: link,
        cache: GraphQLCache(),
      ),
    );
  }

  final GraphQLClient graphQLClient;

  Future<NetworkResponse> getCountries() async {
    try {
      var result = await graphQLClient.query(
        QueryOptions(document: gql(countriesQuery)),
      );

      if (result.hasException) {
        return NetworkResponse(
            errorText: extractErrorDetails(result.exception! as GraphQLError)); // Extract specific error details
      } else {
        final countries = (result.data?['countries'] as List?)
            ?.map((dynamic e) => CountryModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
            [];
        debugPrint("LIST LENGTH: ${countries.length}");
        return NetworkResponse(data: countries);
      }
    } catch (error) {
      debugPrint("ERROR: $error");
      return NetworkResponse(); // Or provide a default error response with more context
    }
  }

  Future<NetworkResponse> getCountriesByContinent(String continentCode) async {
    try {
      var result = await graphQLClient.query(
        QueryOptions(document: gql(getCountryQueryByContinent(continentCode))),
      );

      if (result.hasException) {
        return NetworkResponse(
            errorText: extractErrorDetails(result.exception! as GraphQLError)); // Extract specific error details
      } else {
        final countries = (result.data?['countries'] as List?)
            ?.map((dynamic e) => CountryModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
            [];
        debugPrint("LIST LENGTH: ${countries.length}");
        return NetworkResponse(data: countries);
      }
    } catch (error) {
      debugPrint("ERROR: $error");
      return NetworkResponse(); // Or provide a default error response with more context
    }
  }

  // Function to extract specific error details from GraphQL exceptions (optional)
  String extractErrorDetails(GraphQLError exception) {
    // Implement logic to extract specific error messages or codes from the exception
    // For example: return exception.graphqlErrors.first.message;
    return "An error occurred"; // Placeholder until specific details are extracted
  }
}
