import 'package:flutter/material.dart';

class Faq_page extends StatelessWidget {
  const Faq_page({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Text(
                        "FAQs",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Divider(),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "How do I start planning my wedding?",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w200),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        "Simple. Go to your Setting and click on Wedding Settings to start filling in the details regarding your big day. You can also add the bride/ groom to the app so that you're both on the same page!",
                        style: TextStyle(
                          color: Colors.grey,
                        )),
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      "Who is a collaborator? What can a collaborator do?",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w200),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        "A collaborator can be anybody whose inputs you need to plan your big day; your mom, sister or best friend! Since these guys are the people who'd know you and your tastes best, they can help you shortlist vendors by sharing their suggestions on your wedding wall.",
                        style: TextStyle(
                          color: Colors.grey,
                        )),
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      "Can a non-collaborator see what's happening on my wedding wall ?",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w200),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Of course not!",
                        style: TextStyle(
                          color: Colors.grey,
                        )),
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      "How many collaborators can I add?",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w200),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        "You can add upto 10 collaborators for a wedding. Any more than that and you'll be debating vendors more than finalising them.",
                        style: TextStyle(
                          color: Colors.grey,
                        )),
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      "Can a collaborator participate in multiple weddings at the same time?",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w200),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        "Yes! If you have the stamina to plan more than one at a time, we won't be the reason to stop you.",
                        style: TextStyle(
                          color: Colors.grey,
                        )),
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      "How do I get in touch with a vendor?",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w200),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        "Go to the vendor profile and click on send Query. Feel free to ask as many questions as you like :-)",
                        style: TextStyle(
                          color: Colors.grey,
                        )),
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      "What do I do if a vendor doesn't reply?",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w200),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        "A vendor usually takes 3-10 days to reply to a query. In case you don't hear from them, you can always reach out to us at info wedmegood.com. We'll try and source the answers for you.",
                        style: TextStyle(
                          color: Colors.grey,
                        )),
                    Text(
                      "How do I get my wedding featured on WedMeGood?",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w200),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        "Write to us at submissions@EventShadow.com and we'll take it from there.",
                        style: TextStyle(
                          color: Colors.grey,
                        )),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      color: Color.fromARGB(255, 237, 236, 236),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text(
                              " @24  Event Shadow",
                              style: TextStyle(
                                fontWeight: FontWeight.w100,
                                fontSize: 20,
                                color: Colors.grey,
                                fontFamily: "ArchitectsDaughter",
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
