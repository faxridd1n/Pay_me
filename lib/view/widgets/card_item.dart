import 'package:exam2/models/userCardModel.dart';
import 'package:exam2/storage/storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../service/user_service.dart';
import '../../service/utils_service.dart';

Widget cardItem(
    BuildContext context,
    String backImage,
    String bank,
    String name,
    String cardNumber,
    String time,
    int index,
    UserModel model,
    void Function() setState) {
  return Container(
      margin: EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 15),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
            image: AssetImage(
              backImage,
            ),
            fit: BoxFit.cover,
          )),
      child: Stack(children: [
        Positioned(
          top: 5,
          right: 15,
          child: Image.asset(
            bank.toLowerCase().startsWith('humo')
                ? 'assets/humo.png'
                : 'assets/uzcardOq.png',
            height: 60,
            width: 60,
          ),
        ),
        Positioned(
          top: 15,
          left: 15,
          child:
              Text(bank, style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
        Positioned(
          top: 60,
          left: 15,
          child: Text('0.00 so\'m',
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
        Positioned(
          bottom: 60,
          left: 15,
          child:
              Text(name, style: TextStyle(color: Colors.white, fontSize: 18)),
        ),
        Positioned(
          bottom: 15,
          left: 15,
          child: Text(cardNumber,
              style: TextStyle(color: Colors.white, fontSize: 18)),
        ),
        Positioned(
          bottom: 15,
          right: 95,
          child:
              Text(time, style: TextStyle(color: Colors.white, fontSize: 18)),
        ),
        Positioned(
            bottom: 10,
            right: 15,
            child: IconButton(
              onPressed: () async {
                box!.deleteAt(index);

                 delete(card) async {
                  bool result = await UserService.deleteUser(card);
                  if (result) {
                    setState();
                    Utils.snackBarSuccess('Deleted successfully', context);
                  } else {
                    Utils.snackBarError('Someting is wrong', context);
                  }
                }

                setState();
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
                size: 30,
              ),
            )),
      ]));
}
