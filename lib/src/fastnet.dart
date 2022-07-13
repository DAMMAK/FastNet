library fastnet;

import 'dart:async';
import 'package:fastnet/src/model/result.dart';
import 'package:puppeteer/puppeteer.dart';

/// A .
class FastNet {
  //Duration in milliseconds
  static void _delay(duration) {
    Future.delayed(Duration(milliseconds: duration));
  }

  static init({
    Page page,
    Browser browser,
    StreamController streamController,
  }) async {
    Result prevResult;
    while (true) {
      var content = await page.evaluate('''x=>{
    const downloadSpeedValue= document.querySelector("#speed-value").textContent;
    const downloadSpeedUnit =document.querySelector("#speed-units").textContent;
    const uploadSpeedValue = document.querySelector("#upload-value").textContent;
    const uploadSpeedUnit = document.querySelector("#upload-units").textContent;
    const isDone= Boolean(
					document.querySelector('#speed-value.succeeded') && document.querySelector('#upload-value.succeeded')
				);
    return{downloadSpeedValue, downloadSpeedUnit, uploadSpeedValue, uploadSpeedUnit, isDone};
  }''', args: []);
      var result = Result.fromJson(content);

      if (result.downloadSpeedValue > 0 && result != prevResult) {
        streamController.sink.add(result);
      }

      if (result.isDone) {
        await browser.close();
        streamController.close();
        return;
      }
      prevResult = result;
      _delay(100);
    }
  }

  getSpeed() async {
    StreamController<Result> _streamController = StreamController();
    Browser browser = await puppeteer.launch(timeout: Duration(minutes: 10));
    Page page = await browser.newPage();
    await page.goto('https://fast.com/#');
    init(page: page, browser: browser, streamController: _streamController);
    _streamController.close();
    return _streamController.stream;
  }
}
