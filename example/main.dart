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

/* OUTPUT

Download: 1.0Mbps
Upload: 567Kbps
Download: 5.0Mbps
Upload: 1.2Mbps
Download: 20Mbps
Upload: 3.0Mbps

*/
