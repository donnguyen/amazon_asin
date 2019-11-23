import 'package:amazon_asin/amazon_asin.dart';
import 'package:test/test.dart';

void main() {
  test('ASIN, rul, tld', () {
    var asin = AmazonASIN.parse("https://www.amazon.com/gp/product/B01IG0E1F0/ref=s9u_nwrsa_gw_i3?ie=UTF8&fpl=fresh&pd_rd_i=B01IG0E1F0&pd_rd_r=HX877ZSJ45VZ39AN59A1&pd_rd_w=6aVbp&pd_rd_wg=Yyiuk&pf_rd_m=ATVPDKIKX0DER&pf_rd_s=&pf_rd_r=K1JQVYXFAG8F4WKVT3N0&pf_rd_t=36701&pf_rd_p=b15e70a0-40cd-4167-b336-ff44ea910cf2&pf_rd_i=desktop");

    expect(asin, {
      "ASIN": "B01IG0E1F0",
      "url": "https://www.amazon.com/gp/product/B01IG0E1F0/ref=s9u_nwrsa_gw_i3?ie=UTF8&fpl=fresh&pd_rd_i=B01IG0E1F0&pd_rd_r=HX877ZSJ45VZ39AN59A1&pd_rd_w=6aVbp&pd_rd_wg=Yyiuk&pf_rd_m=ATVPDKIKX0DER&pf_rd_s=&pf_rd_r=K1JQVYXFAG8F4WKVT3N0&pf_rd_t=36701&pf_rd_p=b15e70a0-40cd-4167-b336-ff44ea910cf2&pf_rd_i=desktop",
      "urlTld": "com"
    });
  });

  test('ASIN, rul, tld for different Tld', () {
    var asin = AmazonASIN.parse("https://www.amazon.co.uk/d/Hair-Gel/Eco-Styler-Olive-Oil-Styling/B003E7UNE4");

    expect(asin, {
      "ASIN": "B003E7UNE4",
      "url": "https://www.amazon.co.uk/d/Hair-Gel/Eco-Styler-Olive-Oil-Styling/B003E7UNE4",
      "urlTld": "co.uk"
    });
  });

  test('ASIN only', () {
    var asin = AmazonASIN.parse("B01IG0E1F0");

    expect(asin, {
      "ASIN": "B01IG0E1F0",
      "url": null,
      "urlTld": null
    });
  });

  test('Not valid ASIN found', () {
    var asin = AmazonASIN.parse("https://www.google.com");

    expect(asin, {
      "ASIN": null,
      "url": null,
      "urlTld": null
    });
  });
}
