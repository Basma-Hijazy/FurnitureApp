var this_year = DateTime.now().year.toString();

class AppConfig {
  static String copyright_text =
      "@ Designy " + this_year; //this shows in the splash screen
  static String app_name = "Designy"; //this shows in the splash screen

  //configure this
  static const bool HTTPS = true;

  //configure this
  //static const DOMAIN_PATH = "192.168.0.113/ecommerce_demo";
  static const DOMAIN_PATH = "ecommerce.webeetec.com";

  //do not configure these below
  static const String API_ENDPATH = "api";
  static const String PUBLIC_FOLDER = "public";
  static const String PROTOCOL = HTTPS ? "http://" : "http://";
  static const String RAW_BASE_URL = "${PROTOCOL}${DOMAIN_PATH}";
  static const String BASE_URL = "${RAW_BASE_URL}/${API_ENDPATH}";

  //configure this if you are using amazon s3 like services
  //give direct link to file like https://[[bucketname]].s3.ap-southeast-1.amazonaws.com/
  //otherwise do not change anythink
  static const String BASE_PATH = "${RAW_BASE_URL}/${PUBLIC_FOLDER}/";
}
