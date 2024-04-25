import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:knovator_task/core/data/hive_data.dart';

import '../../main.dart';

class ResumeView extends StatefulWidget {
  const ResumeView({super.key});


  @override
  State<ResumeView> createState() => _ResumeViewState();
}

class _ResumeViewState extends State<ResumeView> {
  Box box = Hive.box('knovator');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Data"),
      ),
      body: ListView.builder(
        itemCount: box.length,
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
        itemBuilder: (context, index) {
          HiveData savedData = box.getAt(index);
          return Card(
            child: ListTile(
              title: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(savedData.email,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),),
                  Text(savedData.firstName + savedData.lastName,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),),
                  Text(savedData.jobRole,style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),
                  Text(savedData.phoneNumber,style: TextStyle(color: Colors.black26,fontWeight: FontWeight.w500),),
                ],
              ),
              trailing: Wrap(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return FormView(savedData);
                        },
                      ));
                    },
                    child: const Icon(Icons.edit),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      box.deleteAt(index);
                      setState(() {});
                    },
                    child: const Icon(Icons.delete),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
