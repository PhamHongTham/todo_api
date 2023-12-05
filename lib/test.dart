import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CodeScreen extends StatelessWidget {
  const CodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Code'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: PinCodeTextField(
            appContext: context,
            length: 6, // Độ dài mã xác nhận
            onChanged: (value) {
              // Xử lý khi giá trị thay đổi
            },
            onCompleted: (value) {
              // Xử lý khi mã xác nhận đã được nhập đủ độ dài
            },
            // Bạn có thể thay đổi các thuộc tính khác như style, decoration, inputFormatters, v.v.
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 50,
              fieldWidth: 40,
         
              activeFillColor: Colors.blue,
              inactiveColor: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
