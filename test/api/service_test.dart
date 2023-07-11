import 'package:fifete/api/api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('service ...', (tester) async {
    var service = ServiceApi();
    service.getSingIn(email: 'SALI@', mdp: "ok", context: tester);
  });
}
