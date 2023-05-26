import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CodeComponent extends StatelessWidget {
  CodeComponent({
    super.key,
    required this.codeControllers,
  });
  final List<TextEditingController> codeControllers;

  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Container(
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: _buildCodeField(codeControllers[0], 0)),
              Expanded(child: _buildCodeField(codeControllers[1], 1)),
              Expanded(child: _buildCodeField(codeControllers[2], 2)),
              Expanded(child: _buildCodeField(codeControllers[3], 3)),
              Expanded(child: _buildCodeField(codeControllers[4], 4)),
              Expanded(child: _buildCodeField(codeControllers[5], 5)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCodeField(TextEditingController controller, int index) {
    return Container(
      width: 50,
      height: 50,
      margin: EdgeInsets.only(left: 8, right: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        onChanged: (value) {
          if (value.length == 1) {
            if (index == 5) {
              FocusScope.of(context).unfocus();
            } else {
              FocusScope.of(context).nextFocus();
            }
          }
        },
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(1),
        ],
        keyboardType: TextInputType.number,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 10, right: 10),
        ),
      ),
    );
  }
}
