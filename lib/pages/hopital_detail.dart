import 'package:flutter/material.dart';

class HopitalDetail extends StatefulWidget {
  const HopitalDetail({Key? key}) : super(key: key);

  @override
  State<HopitalDetail> createState() => _HopitalDetailState();
}

class _HopitalDetailState extends State<HopitalDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          // Ajout de l'icône de retour à gauche
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Ajoutez votre logique de retour ici
          },
        ),
        actions: <Widget>[
          IconButton(
            // Premier icône à droite pour le partage
            icon: const Icon(Icons.share),
            onPressed: () {
              // Ajoutez votre logique de partage ici
            },
          ),
          IconButton(
            // Deuxième icône à droite pour ajouter aux favoris
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              // Ajoutez votre logique pour ajouter aux favoris ici
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/hop.png"),
                fit: BoxFit
                    .cover, // Assurez-vous que l'image couvre tout l'arrière-plan
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(
                0.2), // Définir la couleur d'arrière-plan transparente
          ),
          const SizedBox(
            width: double.infinity,
            height: double.infinity,
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 130,
                ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 150,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.blue, // Couleur de fond avec opacité
                          borderRadius: BorderRadius.circular(
                              20), // Rayon de bordure personnalisé
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.verified,
                              color: Color.fromRGBO(13, 71, 161, 1),
                              size: 12,
                            ),
                            Text(
                              'Médecin professionnel',
                              style: TextStyle(
                                color: Color.fromRGBO(13, 71, 161, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 9,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        "Hopital principale",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 25,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 10.0)),
                      const Text(
                        """Prenez rendez-vous sLorem ipsum dolor sit amet consectetur adipiscing elit venenatis nisi, lectus at aenean libero euismod inceptos non auctor lacinia mi, sociosqu diam ultrices nunc vivamus sodales primis condimentum. Hac aliquam fames fringilla conubia porttitor est ullamcorper blandit, hendrerit sem suscipit nibh feugiat magna interdum ligula eu, quisque elementum gravida consequat sagittis vestibulum nec. Libero nec phasellus et consequat mauris a donec ornare magna lectus vestibulum, lacinia interdum nascetur ullamcorper bibendum hac scelerisque ac eros nulla viverra, platea vitae placerat varius integer leo porta ut velit tempus.
Commodo nunc imperdiet lacus mauris laoreet senectus ac at viverra inte
rdum primis purus, mollis donec sem fermentum ornare fusce lectus class por
ta penatibus non. Parturient magna aenean praesent egestas tellus ultrices 
venenatis tortor integer, aliquet turpis curabitur mi dui augue nunc consequat m
ontes pretium, magnis ultricies morbi facilisis maecenas suspendisse dignissim sed. 
Faucibus nulla ultricies a iaculis class placerat bibendum pretium, magnis dictumst 
ligula suscipit pulvinar laoreet nam gravida erat, donec sed vulputate facilisis velit morbi vel.ans effort et gérez votre parcours de santé.""",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
