import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class WelcomePage extends StatelessWidget {
  static const String routeName = '/welcome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ShaderMask(
              shaderCallback: (rect) {
                return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Colors.transparent],
                ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
              },
              blendMode: BlendMode.dstIn,
              child: Image.asset(
                'assets/welcome.jpg',
                fit: BoxFit.contain,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: RichText(
                text: TextSpan(
                    text: 'Welcome to ',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Dragon',
                          style: Theme.of(context).textTheme.headlineMedium)
                    ]),
              ),
            ),
            // Text('Nơi bạn chill trong tưởng tượng',style: Theme.of(context).textTheme.headlineMedium,)
            // ,Column(children: [
            //   But
            // ],)
            Expanded(
                flex: 1,
                // child: Align(
                //     alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(50, 0, 50, 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    padding: EdgeInsets.all(10),
                                    minimumSize: const Size.fromHeight(50)),
                                onPressed: () {},
                                child:  Text(AppLocalizations.of(context)!.login)),
                          ),SizedBox(height: 20,),
                          Flexible(
                            child: OutlinedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    padding: EdgeInsets.all(10),
                                    minimumSize: const Size.fromHeight(50)),
                                onPressed: () {},
                                child:  Text(AppLocalizations.of(context)!.register)),
                          )
                        ],
                      ),
                    )
                // )
            )
          ]),
    );
  }
}
