import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_zindan_kesfi/oyun_zindan_kesfi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(zindanKesfiConfig.title.length, 33);
    expect(zindanKesfiConfig.tagline.length, 33);
    for (final s in zindanKesfiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(zindanKesfiConfig.gameId, zindanKesfiId);
    expect(zindanKesfiRules.gameId, zindanKesfiId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(zindanKesfiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: zindanKesfiId, optionalMechanics: zindanKesfiRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(zindanKesfiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
