import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ListTilesWidget extends StatelessWidget {
  const ListTilesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Desenvolvedores',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: const ListViewWidget(),
    );
  }
}

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: ListTile.divideTiles(context: context, tiles: const [
        ListTileWidget(
            typeImage: 'LA',
            title: 'Claudemir Públio Júnior',
            subtitle: 'Docente EBTT IFMT',
            urlImage:
                'https://pps.whatsapp.net/v/t61.24694-24/102752586_300455284308633_412660927002318082_n.jpg?ccb=11-4&oh=01_AVyYW8ZTx1lQNewY4OotzrBHzB2pLdv-tQpunxGEKwyiUw&oe=62B5699A',
            urLinkedin: 'https://lattes.cnpq.br/6986438491496935'),
        ListTileWidget(
            typeImage: 'LI',
            title: 'Yoji Massago',
            subtitle: 'Docente EBTT IFMT',
            urlImage:
                'https://pps.whatsapp.net/v/t61.24694-24/287615624_201082858908182_2851988399003640577_n.jpg?ccb=11-4&oh=01_AVxzm6UBV6EI9coWbU0IXrkRgIs9AknSdrfs8c7F3cyd9A&oe=62B51DAD',
            urLinkedin: 'https://www.linkedin.com/in/yoji-massago-42745a77'),
        ListTileWidget(
            typeImage: 'LI',
            title: 'Michel Ferracini',
            subtitle: 'Discente CSTADS',
            urlImage:
                'https://media-exp2.licdn.com/dms/image/C5603AQElohzc7acR4w/profile-displayphoto-shrink_200_200/0/1517591134479?e=1660780800&v=beta&t=cZ2PVkn5YjKnp1iFrvdaEt9s5vCxg89GjUgsH7sfnbY',
            urLinkedin:
                'https://www.linkedin.com/in/michel-ferracini-69529463'),
        ListTileWidget(
            typeImage: 'LI',
            title: 'Raul Tavares Cecatto',
            subtitle: 'Discente CSTADS',
            urlImage:
                'https://media-exp2.licdn.com/dms/image/C4E03AQEd6n-SabnR7Q/profile-displayphoto-shrink_200_200/0/1587613252450?e=1660780800&v=beta&t=19sXoQUIv3bgbX_5LXihC3Py_Mzq5hh95g_UVwJUGtk',
            urLinkedin: 'https://www.linkedin.com/in/raulcecatto'),
        ListTileWidget(
            typeImage: 'LI',
            title: 'Arlindo Junior Fernandes Pina',
            subtitle: 'Discente CSTADS',
            urlImage:
                'https://media-exp2.licdn.com/dms/image/C5603AQEZcTT7hQMrWw/profile-displayphoto-shrink_200_200/0/1653210160441?e=1660780800&v=beta&t=v7l7XIBBrKDKcTJpSP-C7iKu4bcBEnq1w2zjBPazi1M',
            urLinkedin:
                'https://www.linkedin.com/in/arlindo-junior-fernandes-662aa821a'),
        ListTileWidget(
            typeImage: 'LI',
            title: 'Danilo Batista da Cruz',
            subtitle: 'Discente CSTADS',
            urlImage:
                'https://media-exp2.licdn.com/dms/image/C4E03AQGLha7V5SU8bQ/profile-displayphoto-shrink_200_200/0/1534733782339?e=1660780800&v=beta&t=lwq3IOzAN5QW6KUiYYhKfuYElxpQJckIPmL4X8QjUGE',
            urLinkedin:
                'https://www.linkedin.com/in/danilo-batista-8679b516a/'),
        ListTileWidget(
            typeImage: 'VA',
            title: 'João Kleber Alves Neto',
            subtitle: 'Discente CSTADS',
            urlImage:
                'https://scontent.fbsb9-1.fna.fbcdn.net/v/t1.6435-9/69610652_743930866037080_8748678322721914880_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=174925&_nc_eui2=AeFG-pd_TukvVhBTulHCFArF-SEKyZlyYfn5IQrJmXJh-f9jX5dAzSu_FrPWDM4DboDrD1STSqgfJo5xxMk-1mzb&_nc_ohc=EuIbfT8454UAX9__AmC&_nc_ht=scontent.fbsb9-1.fna&oh=00_AT9N8ZMjcb9kbE4PbMex2xzWB-gLeW94uONR0ZhJtZluMQ&oe=62CBD967',
            urLinkedin: ''),
        ListTileWidget(
            typeImage: 'LI',
            title: 'Jucelio da Silva Santos',
            subtitle: 'Discente CSTADS',
            urlImage:
                'https://media-exp2.licdn.com/dms/image/C5603AQH47oiadJri0A/profile-displayphoto-shrink_200_200/0/1637635403360?e=1660780800&v=beta&t=K0Aqz-9PaFuGvk5vkXkC2Li6aqmLeMnycw7wPM7Vs_g',
            urLinkedin: 'https://www.linkedin.com/in/juceliodigital/'),
        ListTileWidget(
            typeImage: 'VA',
            title: 'Matheus Augusto dos Santos Santana',
            subtitle: 'Discente CSTADS',
            urlImage:
                'https://pps.whatsapp.net/v/t61.24694-24/196049341_526085358737394_1358442392608527340_n.jpg?ccb=11-4&oh=cb526136ea542671137b6c876b55a676&oe=62B92FCC',
            urLinkedin: ''),
        ListTileWidget(
            typeImage: 'LI',
            title: 'Miqueias Cardoso Soares',
            subtitle: 'Discente CSTADS',
            urlImage:
                'https://media-exp2.licdn.com/dms/image/C5603AQF5Hdn8bqjZ5g/profile-displayphoto-shrink_200_200/0/1636423099493?e=1660780800&v=beta&t=WdZ1_3bDfi7foFLS-X1uDzBwqZyvrceuhxc2d8B-gGU',
            urLinkedin:
                'https://www.linkedin.com/in/miqueias-cardoso-soares-507222224'),
        ListTileWidget(
            typeImage: 'LI',
            title: 'Priscila da Silva Batista',
            subtitle: 'Discente CSTADS',
            urlImage:
                'https://media-exp2.licdn.com/dms/image/C4D03AQFFs6RK9T31MA/profile-displayphoto-shrink_200_200/0/1593608625441?e=1660780800&v=beta&t=5LPInkpA4eOD-a6FVW_lYz2W8GmtiJPyBVsWuSJmIGA',
            urLinkedin:
                'https://www.linkedin.com/in/priscila-batista-972b72186'),
        ListTileWidget(
            typeImage: 'LI',
            title: 'Wagner Daniel Macedo Delmondes',
            subtitle: 'Discente CSTADS',
            urlImage:
                'https://scontent.fbsb9-1.fna.fbcdn.net/v/t1.6435-9/50192530_966011323597379_3190612182064693248_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=8bfeb9&_nc_eui2=AeEx0k2tbcXz1WDOnCixqWpxlQL8R2ZgUMOVAvxHZmBQw47jMbeiZdIQjLsHz3-Ow0TnDzZIXaSftw1Em8hUPUDq&_nc_ohc=4QL6ZvjWz5oAX_i2AC_&_nc_ht=scontent.fbsb9-1.fna&oh=00_AT8gtYciTDqEnUFtsE_ANoP0-gancvI8ZpBxsemYprK88w&oe=62CC2C11',
            urLinkedin: ''),
        ListTileWidget(
            typeImage: 'LI',
            title: 'Wanderson Renato Moraes da Silva',
            subtitle: 'Discente CSTADS',
            urlImage:
                'https://media-exp2.licdn.com/dms/image/C4D03AQEZt2H3KzUoGA/profile-displayphoto-shrink_200_200/0/1651629375414?e=1660780800&v=beta&t=qxvmJhnV3Y-qDKTnBIuzCI1NWYmERGFnB_auY5Rx8ds',
            urLinkedin:
                'https://www.linkedin.com/in/wanderson-renato-moraes-da-silva-b49681239/'),
      ]).toList(),
    );
  }
}

class ListTileWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String urlImage;
  final String urLinkedin;
  final String typeImage;
  const ListTileWidget(
      {key,
      required this.title,
      required this.subtitle,
      required this.urlImage,
      required this.urLinkedin,
      required this.typeImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: NetworkImage(urlImage),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 15.0)),
      trailing: Image.asset("img/" + typeImage + ".png"),
      //trailing: const Icon(FontAwesomeIcons.linkedin, color: Colors.indigo, size: 30,),
      onTap: () {
        var _url = Uri.parse(urLinkedin);
        launchUrl(_url);
      },
      dense: false,
      selected: false,
      enabled: true,
    );
  }
}

void mensagem(String msg, context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text(
          msg,
          style: const TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Fechar',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
