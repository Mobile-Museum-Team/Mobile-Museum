import 'package:mobile_museum/art.dart';
import 'package:mobile_museum/logic/api/http_service.dart';
import 'package:test/test.dart';

void main() {
  test(
    'get object by it\'s ID test',
    () async {
      var art = await HttpService.getObj(437056);
      expect(
          "Tommaso di Folco Portinari (1428–1501); Maria Portinari (Maria Maddalena Baroncelli, born 1456)",
          art.title);
    },
  );
}
