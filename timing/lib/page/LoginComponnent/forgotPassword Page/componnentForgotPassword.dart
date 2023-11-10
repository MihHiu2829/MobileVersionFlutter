import 'package:flutter/material.dart';

class InforForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
        // margin: EdgeInsets.all(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.lock_open_outlined,
                  size: 70,
                  color: Color.fromARGB(255, 130, 93, 34),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    "Reset password",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 151, 112, 48)),
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.all(5),
              child: const Text(
                '   Viec su dung tai khoan va so dien thoai de khoi phuc tai khoan la cach lam toi uu nhat?, day chi la demo cho man hinh reset password?',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 151, 112, 48)),
              ),
            )
          ],
        ));
  }
}

class InputAccountToResetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: TextField(
        cursorColor: Colors.black,
        decoration: InputDecoration(
            prefixText: '  ',
            floatingLabelBehavior:
                FloatingLabelBehavior.never, //  ko de floating label
            floatingLabelStyle: const TextStyle(
                color: Color.fromARGB(255, 151, 112, 48),
                fontWeight: FontWeight.bold,
                fontSize: 20),
            // alignLabelWithHint: false,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                gapPadding: 5.0,
                borderSide: const BorderSide(
                    width: 2.0, color: Color.fromARGB(255, 151, 112, 48))),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                gapPadding: 5.0,
                borderSide: const BorderSide(
                    width: 2.0, color: Color.fromARGB(255, 151, 112, 48))),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4), gapPadding: 6.0),
            labelText: 'type your account',
            labelStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
            )),
      ),
    );
  }
}

class InputNumberToResetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: TextField(
        cursorColor: Colors.black,
        decoration: InputDecoration(
            prefixText: '  ',
            floatingLabelBehavior:
                FloatingLabelBehavior.never, //  ko de floating label
            floatingLabelStyle: const TextStyle(
                color: Color.fromARGB(255, 151, 112, 48),
                fontWeight: FontWeight.bold,
                fontSize: 20),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                gapPadding: 5.0,
                borderSide: const BorderSide(
                    width: 2.0, color: Color.fromARGB(255, 151, 112, 48))),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                gapPadding: 5.0,
                borderSide: const BorderSide(
                    width: 2.0, color: Color.fromARGB(255, 151, 112, 48))),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4), gapPadding: 6.0),
            labelText: 'type your number',
            labelStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
            )),
      ),
    );
  }
}

class OutputCheckToResetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: SizedBox(
        width: double.infinity,
        height: 45,
        child: ElevatedButton(
            style: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 75, 12, 7)),
              foregroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 135, 89, 85)),
            ),
            onPressed: () {},
            child: const Text(
              'Reset password',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 151, 112, 48)),
            )),
      ),
    );
  }
}
