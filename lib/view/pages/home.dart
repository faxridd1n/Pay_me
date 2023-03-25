import 'package:flutter/material.dart';

import '../../models/userCardModel.dart';
import '../../service/user_service.dart';
import '../../service/utils_service.dart';
import '../../storage/storage.dart';
import '../widgets/card_item.dart';
import 'add_card_Page.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 32, 40, 47),
      body: SingleChildScrollView(
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: box?.values.length ?? 0,
            itemBuilder: (context, index) {
              return cardItem(
                context,
                'assets/c2.jpg',
                box!.getAt(index)!.komp,
                box!.getAt(index)!.ism,
                box!.getAt(index)!.kartaRaqam,
                box!.getAt(index)!.amalQilishMuddati,
                index,
                box!.getAt(index)!,
                (){
                  setState(() {
                    
                  });
                }
              );
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 70, 224, 241),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddCard(),
            ),
          );
        },
        child: Icon(
          Icons.add,
          size: 35,
          color: Colors.white,
        ),
      ),
    );
  }


  void _createUser(UserModel newUser) async {
    bool result =
    await UserService.createUser(newUser);
    if (result) {
      setState(() {});
      Utils.snackBarSuccess(
          'Created successfully', context);
    } else {
      Utils.snackBarError('Someting is wrong', context);
    }
  }
}
