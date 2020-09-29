import 'package:fastnet/fastnet.dart';
import 'package:fastnet/src/model/result.dart';

void main() async {
  var fastnet = FastNet();
  var response = await fastnet.getSpeed();
  response.listen((Result result) {
    print(
        "Download: ${result.downloadSpeedValue} ${result.downloadSpeedUnit}\n Upload:  ${result.uploadSpeedValue} ${result.uploadSpeedUnit}");
  });
}
