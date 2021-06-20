class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "https://jupiter.d.greeninvoice.co.il/api/v1";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;

  // booking endpoints
  static const String loginUser = baseUrl + "/account/login";
}