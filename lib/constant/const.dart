import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/web_veiw_screen.dart';

Widget articleWidget(list, context) => InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return WebViewScreen(list['url']);
          },
        ));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    '${list['urlToImage']}',
                  ),
                ),
              ),
            ),
            SizedBox(width: 25),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${list['title']}',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${list['publishedAt']}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

Widget deafualtTextformField({
  required TextEditingController controller,
  void Function()? onTap,
  required void Function(String?)? saved,
  void Function(String?)? submitted,
  required String? Function(String?)? validator,
  TextInputType? keybordtype,
  required String lable,
  required Widget icon,
  void Function(String)? onChange,
}) =>
    TextFormField(
      controller: controller,
      onTap: onTap,
      onChanged: onChange,
      keyboardType: keybordtype,
      decoration: InputDecoration(
        labelText: lable,
        prefixIcon: icon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
        ),
      ),
      onSaved: saved,
      onFieldSubmitted: submitted,
      validator: validator,
    );
