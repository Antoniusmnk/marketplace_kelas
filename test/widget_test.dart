import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marketplace_kelas/main.dart';

void main() {
  testWidgets('Full flow: Splash -> Register -> Loading -> Home', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.75;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(const NexaApp());

    // 1. Splash Screen
    expect(find.text('Ne'), findsOneWidget);
    expect(find.text('Xa'), findsOneWidget);

    // 2. Transisi ke RegisterScreen
    await tester.pumpAndSettle(const Duration(seconds: 3));
    expect(find.text('Next level starts here.'), findsOneWidget);
    expect(find.text('Buat akun untuk lanjut belajar'), findsOneWidget);

    // 3. Isi form register
    final textFields = find.byType(TextField);
    await tester.enterText(textFields.at(0), 'budi@nexa.com');
    await tester.enterText(textFields.at(1), 'password123');
    await tester.enterText(textFields.at(2), 'password123');
    await tester.pump();

    // 4. Tekan tombol Daftar
    final daftarButton = find.text('Daftar');
    await tester.ensureVisible(daftarButton);
    await tester.tap(daftarButton);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));

    // 5. Loading screen muncul
    expect(find.text('Sedang masuk, harap tunggu...'), findsOneWidget);

    // 6. Majukan durasi loading menuju Home screen (2000 ms)
    await tester.pump(const Duration(milliseconds: 2100));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));

    expect(find.text('Selamat datang, Budi'), findsOneWidget);
    expect(find.text('Rekomendasi Untukmu!'), findsOneWidget);
    expect(find.text('Cari Pelajaran Favoritmu Disini'), findsOneWidget);
    expect(find.text('Kategori'), findsOneWidget);
    expect(find.text('Beranda'), findsOneWidget);
  });
}
