import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'create_ticket_page.dart';

class ViewTickets extends StatefulWidget {
  const ViewTickets({Key? key}) : super(key: key);

  @override
  State<ViewTickets> createState() => _ViewTicketsState();
}

class _ViewTicketsState extends State<ViewTickets> {
  List<String> docId = []; // document id list

  // get docId from firestore
  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('tickets')
        .get()
        // ignore: avoid_function_literals_in_foreach_calls
        .then((snapshot) => snapshot.docs.forEach((document) {
              docId.add(document.reference.id);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 180),

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
                      'Tickets #',
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'View all Tickets.',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'LiberationMono',
                        color: Colors.grey[700],
                      ),
                    ),
                    IconButton(
                      // onpressed navigate to login page
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CreateTicketPage()),
                        );
                      },
                      icon: Icon(
                        Icons.note_add_outlined,
                        color: Colors.greenAccent.shade200,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                //Email Textfield
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          // item count is 10
                          child: FutureBuilder(
                            future: getDocId(),
                            builder: (context, snapshot) {
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: docId.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: const Text(
                                                  "Ticket Details",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily:
                                                        'LiberationMono',
                                                  ),
                                                ),
                                                content: GetTicketDetails(
                                                    documentId: docId[index]),
                                              );
                                            });
                                      },
                                      child: ListTile(
                                        title: GetTickets(
                                            documentId: docId[index]),
                                        tileColor: Colors.grey[200],
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
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

class GetTickets extends StatelessWidget {
  final String documentId;
  const GetTickets({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference tickets =
        FirebaseFirestore.instance.collection('tickets');
    return FutureBuilder<DocumentSnapshot>(
        future: tickets.doc(documentId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "${data['number']}" "  ${data['name']}",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'LiberationMono',
                  ),
                ),
                Text(
                  " status: ${data['status']}",
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'LiberationMono',
                    color: data['status'] == "open"
                        ? Colors.greenAccent
                        : Colors.redAccent.shade200,
                  ),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.greenAccent,
            ),
          );
        });
  }
}

class GetTicketDetails extends StatelessWidget {
  final String documentId;
  const GetTicketDetails({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference tickets =
        FirebaseFirestore.instance.collection('tickets');
    return FutureBuilder<DocumentSnapshot>(
        future: tickets.doc(documentId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return SizedBox(
              height: 300,
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Ticket Number: ${data['number']}",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'LiberationMono',
                    ),
                  ),
                  Text(
                    "Ticket Category: ${data['category']}",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'LiberationMono',
                    ),
                  ),
                  Text(
                    "Ticket Name: ${data['name']}",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'LiberationMono',
                    ),
                  ),
                  Text(
                    "Ticket Description: ${data['description']}",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'LiberationMono',
                    ),
                  ),
                  Text(
                    " Ticket Status: ${data['status']}",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'LiberationMono',
                      color: data['status'] == "open"
                          ? Colors.greenAccent
                          : Colors.redAccent.shade200,
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.greenAccent,
            ),
          );
        });
  }
}
