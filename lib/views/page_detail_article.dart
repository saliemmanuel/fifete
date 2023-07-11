import 'package:fifete/utils/library/library.dart';

import 'widgets/widget.dart';

class PageDetailArticle extends StatefulWidget {
  final listImage;
  final data;
  const PageDetailArticle(
      {Key? key, required this.listImage, required this.data})
      : super(key: key);

  @override
  State<PageDetailArticle> createState() => _PageDetailArticleState();
}

class _PageDetailArticleState extends State<PageDetailArticle> {
  int selectIndex = 0;
  int groupValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Détail article',
          style: TextStyle(
              fontSize: 25.0, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImage(
                  widget.data['images'],
                  nom: widget.data['nom'],
                  isNetwork: false,
                  width: double.infinity,
                  height: 230.0,
                  radius: 0.0,
                ),
                const SizedBox(height: 10.0),
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Nom Article : ${widget.data['nom']}",
                        style: TextStyle(fontSize: 25.0))),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Prix : ${widget.data['prix']}",
                      style: TextStyle(fontSize: 25.0)),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${widget.data['disponibilite']}"),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Taille"),
                ),
                const SizedBox(height: 10.0),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    TailleArticleWidget(label: '${widget.data['taille']}')
                  ],
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      "${widget.data['description']}\n\nAmet veniam qui culpa ipsum tempor ut nisi cupidatat aliqua reprehenderit mollit id incididunt ullamco. Do consequat eiusmod amet mollit sit proident sint eiusmod ut fugiat Lorem aute sunt et. Do mollit adipisicing in anim veniam excepteur est aliquip duis. Reprehenderit esse ex cupidatat do labore adipisicing excepteur. Do ut qui cillum laboris proident officia esse qui eu duis incididunt qui. Adipisicing proident do tempor non occaecat excepteur qui ullamco sit ullamco anim amet. Sint deserunt sit sint id ipsum consequat minim exercitation ut nisi non non consectetur ullamco. Consectetur laboris cillum dolore excepteur et. Quis ullamco consectetur sunt cillum. Pariatur nulla magna dolore esse cillum irure nulla eiusmod."),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 90.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              InkWell(
                child: Container(
                  height: 70.0,
                  width: 75.0,
                  child:
                      Icon(Icons.star_border, color: Colors.white, size: 30.0),
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          bottomLeft: Radius.circular(25.0),
                          topRight: Radius.circular(10.0),
                          bottomRight: Radius.circular(25.0))),
                ),
                onTap: () {},
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        elevation: 0.0,
                        backgroundColor: Colors.transparent,
                        enableDrag: true,
                        context: context,
                        builder: (builder) {
                          return Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(18.0),
                                    topRight: Radius.circular(18.0))),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                CustumTextField(
                                    keyboardType: TextInputType.number,
                                    child: "${widget.data['prix']}",
                                    obscureText: false),
                                const SizedBox(height: 10.0),
                                const CustumTextField(
                                    keyboardType: TextInputType.number,
                                    child: "Numéro de téléphone",
                                    obscureText: false),
                                const SizedBox(height: 10.0),
                                const CustumTextField(
                                    keyboardType: TextInputType.text,
                                    child: "Nom du compte",
                                    obscureText: false),
                                const SizedBox(height: 10.0),
                                RadioListTile<int>(
                                    value: 1,
                                    groupValue: groupValue,
                                    activeColor: Colors.green,
                                    title: const Text("MTN"),
                                    onChanged: (value) => setState(() {
                                          groupValue = value!;
                                        }),
                                    secondary: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Image.asset(
                                          'assets/images/mtnmomo.png'),
                                    )),
                                const Divider(),
                                RadioListTile<int>(
                                    value: 2,
                                    activeColor: Colors.green,
                                    groupValue: groupValue,
                                    title: const Text("Orange"),
                                    onChanged: (value) => setState(() {
                                          groupValue = value!;
                                          if (groupValue == 1) {
                                            errorDialogueCard(
                                                '',
                                                "Le mode de recharge par Orange Money est indisponible reessayer plus tard",
                                                context);
                                          }
                                          if (groupValue == 2) {
                                            errorDialogueCard(
                                                '',
                                                "Le mode de recharge par MTN MoMo est indisponible reessayer plus tard",
                                                context);
                                          }
                                        }),
                                    secondary: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child:
                                          Image.asset('assets/images/om.png'),
                                    )),
                                const SizedBox(height: 10.0),
                                // CustumButton(
                                //     enableButton:
                                //         groupValue == 2 ? false : true,
                                //     child: TextApp.confirmer,
                                //     onPressed: () async {}),
                              ],
                            ),
                          );
                        });
                  },
                  child: Container(
                    height: 70.0,
                    alignment: Alignment.center,
                    child: const Text("Achetez",
                        style: TextStyle(fontSize: 25.0, color: Colors.white)),
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.0),
                            bottomLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                            bottomRight: Radius.circular(25.0))),
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
