class AmazonASIN {
  static const String REGEX_MATCH =
      "(B[0-9]{2}[0-9A-Z]{7}|[0-9]{9}(?:X|[0-9]))";

  static Map<String, dynamic> parse(String urlOrASIN) {
    if (urlOrASIN.length == 10 || urlOrASIN.length == 13) {
      return _result(urlOrASIN, null);
    }

    var result;
    RegExp exp = RegExp(REGEX_MATCH);

    if (exp.hasMatch(urlOrASIN)) {
      var asin = exp.stringMatch(urlOrASIN);
      result = _result(asin, urlOrASIN);
    } else {
      result = _result(null, null);
    }

    return result;
  }

  static Map<String, dynamic> _result(String ASIN, String url) {
    var domain;

    if (url != null) {
      domain = Uri.parse(url)?.host;
    }

    return {
      "ASIN": ASIN,
      "url": url,
      "domain": domain
    };
  }
}
