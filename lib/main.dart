import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:knovator_task/core/data/hive_adapter.dart';
import 'package:knovator_task/core/data/hive_data.dart';
import 'package:knovator_task/view/resume_view/resume_view.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory appDocumentsDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentsDir.path);
  Hive.registerAdapter(HiveAdapter());
  var box = await Hive.openBox('knovator');

  runApp(MaterialApp(home: FormView()));
}

class FormView extends StatefulWidget {
  HiveData? m;

  FormView([this.m]);

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  TextEditingController email = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController jobRole = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  Box box = Hive.box('knovator');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.m != null) {
      email.text = widget.m!.email;
      firstName.text = widget.m!.firstName;
      lastName.text = widget.m!.lastName;
      jobRole.text = widget.m!.jobRole;
      phoneNumber.text = widget.m!.phoneNumber;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (widget.m != null)
            ? const Text("Update Resume data")
            : const Text("Add Resume data"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
        child: Column(
          children: [
            TextField(
              controller: email,
              decoration: const InputDecoration(labelText: "Enter Email"),
            ),
            TextField(
              controller: firstName,
              decoration: const InputDecoration(labelText: "Enter First Name"),
            ),
            TextField(
              controller: lastName,
              decoration: const InputDecoration(labelText: "Enter Last Name"),
            ),
            TextField(
              controller: jobRole,
              decoration: const InputDecoration(labelText: "Enter Job Role Title"),
            ),
            TextField(
              controller: phoneNumber,
              minLines: 5,maxLines: 7,
              decoration: const InputDecoration(labelText: "Enter Summary"),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
                onPressed: () {
                  if (widget.m != null) {
                    widget.m!.email = email.text;
                    widget.m!.firstName = firstName.text;
                    widget.m!.lastName = lastName.text;
                    widget.m!.jobRole = jobRole.text;
                    widget.m!.phoneNumber = phoneNumber.text;
                    widget.m!.save();
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const ResumeView();
                      },
                    ));

                    email.clear();
                    firstName.clear();
                    lastName.clear();
                    jobRole.clear();
                    phoneNumber.clear();

                  } else {
                    HiveData saved = HiveData(
                      email.text,
                      firstName.text,
                      lastName.text,
                      jobRole.text,
                      phoneNumber.text,
                    );
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const ResumeView();
                      },
                    ));

                    email.clear();
                    firstName.clear();
                    lastName.clear();
                    jobRole.clear();
                    phoneNumber.clear();

                    box.add(saved);
                    print(saved);
                  }
                },
                child: const Text("Submit")),
          ],
        ),
      ),
    );
  }
}
