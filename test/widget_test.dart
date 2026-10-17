
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:productos/main.dart';

void main() {
  testWidgets('El Login se muestra correctamente', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MiAplicacion());

    expect(find.text('Iniciar Sesión'), findsOneWidget);
    expect(find.text('LOGIN'), findsOneWidget);

    expect(find.byType(TextField), findsNWidgets(2));
  });
}
