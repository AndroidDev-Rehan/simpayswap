import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

var lightWhite=Color(0xffEDF1F9);
class Verify extends StatefulWidget
{
  var onComplete;
  TextEditingController _txtPin;
  String _txt;

  Verify(this.onComplete,this._txtPin,this._txt);
  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  double height=0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: lightWhite,

      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                widget._txt,textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20,horizontal: 70),
              child: PinCodeTextField(
                readOnly: true,
                controller: widget._txtPin,
                appContext: context,
                showCursor: false,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                ],
                obscureText: true ,
                length: 4,
                obscuringWidget: Container(
                  height: 20,
                  width: 20,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),

                mainAxisAlignment: MainAxisAlignment.spaceAround,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.circle,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 20,
                  fieldWidth: 20,
                  inactiveColor: Colors.grey.shade700,
                  borderWidth: 0,
                  activeFillColor: Colors.green,
                ),
                onChanged: (val){},
                onCompleted: widget.onComplete,
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _CustomKeyboard()
          ),
        ],
      ),
    );
  }

  Widget _CustomKeyboard()
  {
    return Container(
      height: height/2.5,
      child: Column(
        children: [
          Expanded(
            child: _btnRow(
              _Button("1", "1"),
              _Button("2", "2"),
              _Button("3", "3"),
            ),
          ),

          Expanded(
            child:_btnRow(
              _Button("4", "4"),
              _Button("5", "5"),
              _Button("6", "6"),
            ),
          ),

          Expanded(
            child:_btnRow(
              _Button("7", "7"),
              _Button("8", "8"),
              _Button("9", "9"),
            ),
          ),
          Expanded(
            child:_btnRow(
              _Button(".", ""),
              _Button("0", "0"),
              _backButton(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _btnRow(var btn1,var btn2,var btn3)
  {
    return Row(
      children: [
        btn1,
        btn2,
        btn3
      ],
    );
  }

  Widget _Button(String text, String val)
  {
    return Expanded(
        child: InkWell(
          splashColor: Colors.white,
          borderRadius: BorderRadius.circular(100),
          onTap: (){
            if(widget._txtPin.text.length<4) {
              widget._txtPin.text += val;
              print(widget._txtPin.text);
              setState(() {});
            }
          },
          child: Container(
            child: Center(
                child: Text(text,style: TextStyle(color: Colors.blue.shade900,fontSize: 25),)
            ),
          ),
        )
    );
  }

  Widget _backButton()
  {
    return Expanded(
        child: InkWell(
          onTap: (){
            if(widget._txtPin.text.length > 0)
            widget._txtPin.text=widget._txtPin.text.substring(0,widget._txtPin.text.length-1);
            setState(() {

            });
          },
          splashColor: Colors.white,
          borderRadius: BorderRadius.circular(100),
          child: Container(
            child: Center(
                child: Icon(Icons.backspace_outlined,color: Colors.blue.shade700,size: 20,)
            ),
          ),
        )
    );
  }
}