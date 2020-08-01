class AmazonASIN {
  static const String REGEX_MATCH =
      "(B[0-9]{2}[0-9A-Z]{7}|[0-9]{9}(?:X|[0-9]))";
  static const String URL_REGEX_MATCH =
      r"((https?:www\.)|(https?:\/\/)|(www\.))[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9]{1,6}(\/[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)?";

  static Map<String, dynamic> parse(String urlOrASIN) {
    if (urlOrASIN.length == 10 || urlOrASIN.length == 13) {
      return _result(urlOrASIN, null);
    }

    var result;
    var url;
    RegExp exp = RegExp(REGEX_MATCH);
    RegExp urlExp = RegExp(URL_REGEX_MATCH);

    if (urlExp.hasMatch(urlOrASIN)) {
      url = urlExp.stringMatch(urlOrASIN);
    } else {
      url = urlOrASIN;
    }

    if (exp.hasMatch(url)) {
      var asin = exp.stringMatch(url);
      result = _result(asin, url);
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

    return {"ASIN": ASIN, "url": url, "domain": domain};
  }
}
