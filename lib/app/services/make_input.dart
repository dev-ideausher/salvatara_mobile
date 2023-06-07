

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salvatara/app/services/TextStyleUtil.dart';
import 'package:salvatara/app/services/colors.dart';
import 'package:salvatara/app/services/constants/constantSize.dart';
import 'package:salvatara/app/services/responsiveSize.dart';



class MakeInput extends StatelessWidget {

  final double width;
  final height;
  final String label;
  final enabled;
  final bool passwordField;
  final bool obscureText;
  final String hintText;
  final controllerID;
  final errorText;
  final valUE;
  final ontapObsecureText;
  final onChanged;
  final KeyBoardtype;

  MakeInput(
      {required this.hintText,
        required this.label,
        required this.obscureText,
        this.controllerID,
        this.enabled = true,
        required this.width,
        this.height,
        this.errorText,
        this.valUE,
        required this.passwordField,
        this.ontapObsecureText,  this.onChanged, this.KeyBoardtype});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        inputFormatters: [
          NoLeadingSpaceFormatter()
          // controllerID.toString().deny(
          //       RegExp(r'\s')),
        ],

        onChanged: onChanged,
        onTap: valUE,
        enabled: enabled,
        controller: controllerID,
        obscureText: obscureText,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          suffixIcon: passwordField
              ? IconButton(
            onPressed: ontapObsecureText,
            //     (){
            //
            //   if(loginController.ObsecureText.value == true){
            //     loginController.ObsecureText.value = false;
            //   }else{
            //     loginController.ObsecureText.value = true;
            //   }
            // },
            icon: Icon(Icons.remove_red_eye),
          )
              : null,
          errorText: errorText,
          fillColor: ColorUtil.neutral1,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyleUtil.k16(
            fontWeight: FontWeight.normal,
            color: ColorUtil.neutral4
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 0.0,
            horizontal: 20.0,
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffEAE7FF),
            ),
            borderRadius: BorderRadius.circular(Size_8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffEAE7FF),
            ),
            borderRadius: BorderRadius.circular(Size_8),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorUtil.k6,
            ),
            borderRadius: BorderRadius.circular(Size_8),
          ),
        ),
        keyboardType: KeyBoardtype,
      ),
    );
  }
}

class MakeInputPhone extends StatelessWidget {
  final double width;
  final height;
  final String label;
  final enabled;
  final bool passwordField;
  final bool obscureText;
  final String hintText;
  final controllerID;
  final errorText;
  final valUE;
  final ontapObsecureText;

  //TextEditingController
  MakeInputPhone(
      {required this.hintText,
        required this.label,
        required this.obscureText,
        this.controllerID,
        this.enabled = true,
        required this.width,
        this.height,
        this.errorText,
        this.valUE,
        required this.passwordField,
        this.ontapObsecureText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(

        onTap: valUE,
        enabled: enabled,
        controller: controllerID,
        obscureText: obscureText,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(

          prefixIcon: GestureDetector(
            onTap: (){},
            child: Icon(
                Icons.keyboard_arrow_down_rounded
            ),
          ),
          // prefixStyle: TextStyle(
          //   color: ColorUtil.kPrimaryBlack,
          //   fontSize: 14.kh,
          //   fontWeight: FontWeight.bold,
          //   fontFamily: 'Montserrat-Bold'
          // ),
          // prefixText:"(+92)  |  " ,
          suffixIcon: passwordField
              ? IconButton(
            onPressed: ontapObsecureText,
            //     (){
            //
            //   if(loginController.ObsecureText.value == true){
            //     loginController.ObsecureText.value = false;
            //   }else{
            //     loginController.ObsecureText.value = true;
            //   }
            // },
            icon: Icon(Icons.remove_red_eye),
          )
              : null,
          errorText: errorText,
          fillColor: Color(0xffF6E7FF),
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
            fontFamily: 'Montserrat-Regular',
            fontSize: 14.kh,
            color: Color(0xff736081),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 0.0,
            horizontal: 20.0,
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffEAE7FF),
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffEAE7FF),
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff387CFF),
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      ),
    );
  }
}

class MakeInputTF extends StatelessWidget {
  final double width;
  final double height;
  final String label;
  final enabled;
  final bool obscureText;
  final String hintText;
  final controllerID;
  final errorText;

  //TextEditingController
  MakeInputTF(
      {required this.hintText,
        required this.label,
        required this.obscureText,
        this.controllerID,
        this.enabled = true,
        required this.width,
        required this.height,
        required this.errorText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: height,
      width: width,
      child: TextFormField(
        //minLines: 1,
        maxLines: 5,
        // allow user to enter 5 line in textfield
        keyboardType: TextInputType.multiline,
        enabled: enabled,
        // validator:  (errorText) {
        //   if (value == null || value.isEmpty) {
        //     return 'Please fill the empty text fields';
        //   }
        // },
        controller: controllerID,
        obscureText: obscureText,

        style: TextStyle(color: ColorUtil.k6),
        decoration: InputDecoration(
          errorText: errorText,
          fillColor: Color(0xffF6E7FF),
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
            fontFamily: 'Montserrat-Regular',
            fontSize: 14.kh,
            color: ColorUtil.k6,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 20.0,
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorUtil.k6,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorUtil.k6,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorUtil.k6,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      ),
    );
  }
}

class MakeInputCustomIcon extends StatelessWidget {
  final double width;
  final height;
  final String label;
  final enabled;
  final bool SuffixIcon;
  final bool obscureText;
  final String hintText;
  final controllerID;
  final errorText;
  final valUE;
  final ontapSuffixIcon;
  final onChanged;
  final  prefixIcon;

  //TextEditingController
  MakeInputCustomIcon(

      {required this.hintText,
        required this.label,
        required this.obscureText,
        this.controllerID,
        this.enabled = true,
        required this.width,
        this.height,
        this.errorText,
        this.valUE,
        required this.SuffixIcon,
        this.ontapSuffixIcon,  this.onChanged,
      this.prefixIcon
      });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(

        onChanged: onChanged,
        onTap: valUE,
        enabled: enabled,
        controller: controllerID,
        obscureText: obscureText,
        style: TextStyle(color: Colors.black),

        decoration: InputDecoration(
          prefixIcon: prefixIcon,

          suffixIcon: SuffixIcon
              ? IconButton(
            onPressed: ontapSuffixIcon,
            //     (){
            //
            //   if(loginController.ObsecureText.value == true){
            //     loginController.ObsecureText.value = false;
            //   }else{
            //     loginController.ObsecureText.value = true;
            //   }
            // },
            icon: Icon(Icons.calendar_month),
          )
              : null,
          errorText: errorText,
          fillColor: ColorUtil.neutral1,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyleUtil.k16(
              fontWeight: FontWeight.normal,
              color: ColorUtil.neutral4
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 0.0,
            horizontal: 20.0,
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffEAE7FF),
            ),
            borderRadius: BorderRadius.circular(Size_4),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffEAE7FF),
            ),
            borderRadius: BorderRadius.circular(Size_4),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorUtil.k6,
            ),
            borderRadius: BorderRadius.circular(Size_8),
          ),
        ),
      ),
    );
  }
}

class NoLeadingSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    if (newValue.text.startsWith(' ')) {
      final String trimedText = newValue.text.trimLeft();

      return TextEditingValue(
        text: trimedText,
        selection: TextSelection(
          baseOffset: trimedText.length,
          extentOffset: trimedText.length,
        ),
      );
    }

    return newValue;
  }
}