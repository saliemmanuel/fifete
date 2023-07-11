import 'package:fifete/utils/library/library.dart';
import 'package:flutter/services.dart';
import 'widget.dart';

class CustomBottomSheet {
  static bottomSheet(var context) {
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.grey.shade100,
        elevation: 0.0,
        builder: (BuildContext context) {
          return Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CustomListTile(
                  icon: FeatherIcons.thumbsUp,
                  text: "Like",
                  onTap: () {},
                ),
                CustomListTile(
                  icon: FeatherIcons.messageCircle,
                  text: "Comment",
                  onTap: () {},
                ),
                CustomListTile(
                  icon: Icons.favorite_border,
                  text: "Ajouté aux favories",
                  onTap: () {},
                ),
                CustomListTile(
                  icon: Icons.share,
                  text: "Partager",
                  onTap: () {},
                ),
                CustomListTile(
                  icon: Icons.copy,
                  text: "Copier le lien",
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: "link"));
                    SmartDialog.showToast('Le lien a bien été copié.');
                  },
                ),
              ],
            ),
          );
        });
  }
}
