import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Teste de integração ', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });

    test('verifica se a lista carregou os itens corretamente', () async {
      final listFinder = find.byValueKey('long_list');
      final itemFinder = find.byValueKey('item_20_text');

      await driver.scrollUntilVisible(
        listFinder,
        itemFinder,
        dyScroll: -400.0,
      );

      expect(
        await driver.getText(itemFinder),
        'Imagem 20',
      );
    });

    test('verficia se abriu a segunda tela ao clicar no item', () async {
      final listFinder = find.byValueKey('long_list');
      final itemFinder = find.byValueKey('item_10_text');
      final buttonFinder = find.byValueKey('button');

      await driver.scrollUntilVisible(
        listFinder,
        itemFinder,
        dyScroll: 400.0,
      );

      await driver.tap(itemFinder);

      await driver.waitFor(buttonFinder, timeout: Duration(seconds: 1));

    });
  });
}