// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import '../components/my_textfield.dart';
import '../database/firestore_services.dart';

class CreateTicketPage extends StatefulWidget {
  const CreateTicketPage({Key? key}) : super(key: key);

  @override
  CreateTicketPageState createState() => CreateTicketPageState();
}

class CreateTicketPageState extends State<CreateTicketPage> {
  final _numberController = TextEditingController();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _categoryController = TextEditingController();
  final _statusController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 150),
                Row(
                  children: [
                    const SizedBox(width: 30),
                    IconButton(
                      // onpressed navigate to login page
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_circle_left_outlined,
                          size: 40),
                    ),
                    const SizedBox(width: 50),
                    const Text(
                      'New Ticket ',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'LiberationMono',
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.grey,
                  height: 20,
                  thickness: 1.8,
                  indent: 100,
                  endIndent: 100,
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              MyTextfield(
                                controller: _numberController,
                                hintText: 'Ticket Number',
                                obscureText: false,
                              ),
                              const SizedBox(height: 10),
                              MyTextfield(
                                controller: _nameController,
                                hintText: 'Ticket Name',
                                obscureText: false,
                              ),
                              const SizedBox(height: 10),
                              MyTextfield(
                                controller: _descriptionController,
                                hintText: 'Ticket Description',
                                obscureText: false,
                              ),
                              const SizedBox(height: 10),
                              MyTextfield(
                                controller: _categoryController,
                                hintText: 'Ticket Category',
                                obscureText: false,
                              ),
                              const SizedBox(height: 10),
                              MyTextfield(
                                controller: _statusController,
                                hintText: 'Ticket Status',
                                obscureText: false,
                              ),
                              const SizedBox(height: 30),
                              ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    var response =
                                        await FirebaseCrudTickets.createTicket(
                                      number: _numberController.text.trim(),
                                      name: _nameController.text.trim(),
                                      description:
                                          _descriptionController.text.trim(),
                                      category: _categoryController.text.trim(),
                                      status: _statusController.text.trim(),
                                    );
                                    Navigator.pop(context);

                                    if (response.code != 200) {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              content: Text(
                                                  response.message.toString()),
                                            );
                                          });
                                    } else {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              content: Text(
                                                  response.message.toString()),
                                            );
                                          });
                                    }
                                  }
                                },
                                style: ButtonStyle(
                                  fixedSize: MaterialStateProperty.all(
                                      const Size(200, 50)),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.greenAccent),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  'Submit',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'LiberationMono',
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
