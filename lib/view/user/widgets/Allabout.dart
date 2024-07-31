import 'package:evnt_shadow/view/user/widgets/terms_and_conditions.dart';
import 'package:flutter/material.dart';

class All_About extends StatelessWidget {
  const All_About({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text(
                    "About Us",
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
                    "India's favourite wedding planning website & app with over 1.5 millon monthly dedicated users. ​WedMeGood is​ a ​swanky alternative to the outdated wedding planning process. A one-stop-shop for all things weddings, you can find inspiratio​​n​, ​ideas ​and vendors within​ your​ budget​. WedMeGood has been trusted by over 2​​ m​illio​n brides & grooms​ all over the world​ to plan their big day.​ So sit back, log on to WedMeGood, and ​plan the wedding of your dreams​!",
                    style: TextStyle(
                      color: Colors.grey,
                    )),
                SizedBox(
                  height: 35,
                ),
                Text(
                  "Make Plannning Decision",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Vendors",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w200),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "From photographers to wedding priests, WedMeGood has 80,000+ active vendors for you to choose from. Browse their portfolio, prices, genuine client reviews & much more to do your research and book just about any wedding vendor you might require.",
                    style: TextStyle(
                      color: Colors.grey,
                    )),
                SizedBox(
                  height: 35,
                ),
                Text(
                  "Bridel Gallery/Shop",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w200),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "The WMG Bridal Gallery is your one-stop wedding shop. Choose from 2000+ outfits and chat with the designer's team directly to find the outfit of your dreams. Kick-start your wedding shopping here from the comfort of your home!",
                    style: TextStyle(
                      color: Colors.grey,
                    )),
                SizedBox(
                  height: 35,
                ),
                Text(
                  "Genie",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w200),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "WMG Genie services can help you find the right vendor to fit your budget & style! Our Genie expert saves you the time & hassle of browsing through hundreds of profiles by suggesting only the most relevant vendors for your specific requirements.",
                    style: TextStyle(
                      color: Colors.grey,
                    )),
                SizedBox(
                  height: 35,
                ),
                Text(
                  "Shadow Mynt",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w200),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "An exclusive loyalty program by WedMeGood for our brides-to-be and grooms-to-be, this allows access to special offers and benefits from 100+ premium brands across various categories like bridal wear, travel, jewellery, beauty and more!",
                    style: TextStyle(
                      color: Colors.grey,
                    )),
                SizedBox(
                  height: 35,
                ),
                Text(
                  "Still early stages in your journey? Get inspired and discover your own wedding style",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w200),
                ),
                SizedBox(
                  height: 35,
                ),
                Text(
                  "Photos",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w200),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "With over 4 million photos, we just enough to have your wedding mood board in place! Right from trending bridal lehenga designs to fascinating decor details and stunning pre-wedding shoots, WMGs Photo Gallery serves you a collection of the most dreamy wedding photos that perfectly sum up",
                    style: TextStyle(
                      color: Colors.grey,
                    )),
                SizedBox(
                  height: 35,
                ),
                Text(
                  "Real Wedding",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w200),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "Every couple has a tale to tell. Whether it is a wedding thriller or a magical fairytale, we have immortalised tons of real couples' stories on our Real Weddings section. With over 1,000 stories to cherish and bonus inspiration for us!",
                    style: TextStyle(
                      color: Colors.grey,
                    )),
                SizedBox(
                  height: 35,
                ),
                Text(
                  "Blog",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w200),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "That would be your chock-a-block for all your weddingblogs dedicated to a mixed-platter of the latest wedding trends & ideas to serve you with just the right amount of wedding inspiration you need to kickstart your wedding planning",
                    style: TextStyle(
                      color: Colors.grey,
                    )),
                SizedBox(
                  height: 35,
                ),
                Text(
                  "Plan your wedding with Us",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w200),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "WedMeGood is an Indian Wedding Planning Website and app where you can find the best wedding vendors, with prices and reviews at the click of a button. Whether you are looking to hire wedding planners in India, or looking for the top photographers, or just some ideas and inspiration for your wedding. WedMeGood can help you solve your wedding planning woes through its unique features. With a checklist, detailed vendor list, inspiration gallery and blog - you won't need to spend hours planning a wedding anymore.",
                    style: TextStyle(
                      color: Colors.grey,
                    )),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 100,
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
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TermsAndConditionsPage(),
                                  //input the page
                                ),
                              );
                            },
                            child: Text(
                              "Terms & Conditions / Privacy Policy",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300),
                            ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
