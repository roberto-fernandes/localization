import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _locale,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(setLocale),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage(this.setLocale, {super.key});

  final void Function(Locale locale) setLocale;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

const _mariaName = 'Maria';
const _johnName = 'John';

class _MyHomePageState extends State<MyHomePage> {
  String _name = _mariaName;

  void _changeName(String name) {
    setState(() {
      _name = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.welcomeMessage(_name)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                AppLocalizations.of(context)!.initialMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      widget.setLocale(
                          const Locale.fromSubtags(languageCode: 'en'));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset('assets/images/uk.png'),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      widget.setLocale(
                          const Locale.fromSubtags(languageCode: 'pt'));
                    },
                    child: Image.asset('assets/images/portugal.png'),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              child: Text(AppLocalizations.of(context)!.changeName(_mariaName)),
              onPressed: () => _changeName(_mariaName),
            ),
            ElevatedButton(
              child: Text(AppLocalizations.of(context)!.changeName(_johnName)),
              onPressed: () => _changeName(_johnName),
            ),
            const SizedBox(height: 30),
            Text(
              AppLocalizations.of(context)!.language,
            ),
            Text(
              Localizations.localeOf(context).toString(),
            ),
          ],
        ),
      ),
    );
  }
}
