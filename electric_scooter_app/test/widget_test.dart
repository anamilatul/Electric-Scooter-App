import 'package:electric_scooter_app/screen/auth/login_screen.dart';
import 'package:electric_scooter_app/screen/auth/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Login Screen Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));
    expect(find.text('Login'), findsOneWidget);
    await tester.press(find.text('LOGIN'));
    await tester.pump();
  });
  testWidgets('Register Screen Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: RegisterScreen(),
    ));
    expect(find.text('Register'), findsOneWidget);
    await tester.press(find.text('REGISTER'));
    await tester.pump();
  });
}
