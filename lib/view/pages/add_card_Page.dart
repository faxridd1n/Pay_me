import 'package:exam2/models/userCardModel.dart';
import 'package:exam2/view/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../service/user_service.dart';
import '../../service/utils_service.dart';
import '../../storage/storage.dart';

var cardNumForm = new MaskTextInputFormatter(
    mask: '#### #### #### ####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy);

class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  TextEditingController name = TextEditingController();
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  bool uzcard = false;
  bool humo = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 25, 35, 44),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
        ),
        backgroundColor: Color.fromARGB(255, 24, 35, 43),
        title: Text(
          'Karta qo\'shing',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.28,
                width: MediaQuery.of(context).size.width * 2,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(top: 15, right: 10, left: 10),
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                          image: AssetImage(
                            index == 0 ? 'assets/c1.jpg' : 'assets/c2.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 110,
                height: 57,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipOval(
                        child: Image.asset(
                          index == 0 ? 'assets/c1.jpg' : 'assets/c2.jpg',
                          fit: BoxFit.cover,
                          height: 40,
                          width: 40,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ismingiz',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: name,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Ismingizni kiriting',
                          hintStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Color.fromARGB(255, 52, 61, 67)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Kartaning raqami',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.99,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 290,
                            child: TextFormField(
                              inputFormatters: [cardNumForm],
                              style: TextStyle(color: Colors.white),
                              controller: t1,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Kartaning raqami',
                                  hintStyle: TextStyle(color: Colors.white),
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 52, 61, 67)),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Color.fromARGB(255, 59, 67, 71),
                            child: Center(
                              child: Icon(
                                Icons.qr_code_scanner,
                                size: 30,
                                color: Colors.teal,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Amal qilish muddati',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: t2,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Amal qilish muddati',
                          hintStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Color.fromARGB(255, 52, 61, 67)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Kartaning nomi',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: t3,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Kartaning nomi',
                          hintStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Color.fromARGB(255, 52, 61, 67)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 54, 61, 68),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            )),
                        onPressed: () async {
                          var Model = UserModel(
                              ism: name.text,
                              kartaRaqam: t1.text,
                              komp: t3.text,
                              amalQilishMuddati: t2.text,
                              id: '');

                          box!.add(
                            Model,
                          );
                          add(Model) async {
                            bool result = await UserService.createUser(Model);
                            if (result) {
                              setState(() {});
                              // ignore: use_build_context_synchronously
                              Utils.snackBarSuccess(
                                  'Created successfully', context);
                            } else {
                              Utils.snackBarError('Someting is wrong', context);
                            }
                          }

                          setState(() {});

                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(builder: (context) {
                            return HomePage();
                          }), (route) => false);
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 130, vertical: 15),
                          child: Text(
                            'Tayyor',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 226, 225, 225),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
