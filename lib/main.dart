import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:provider/provider.dart';
import 'models/theme_provider.dart';
import 'pages/app_theme_selected.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final docDirectory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(docDirectory.path);
  final settings = await Hive.openBox('settings');
  bool isLightTheme = settings.get('isLighTheme') ?? false;

  //Bir kutuyu kapatmak: settings.close();
  //Bir kutu kapatmak: Hive.box('settings').close();
  //Hive native kanallarla iletişim kurmadığı için daha hızlıdır. (Native Bağımlılığı yoktur)
  //Hive ile Web,Mobil ve Masaüstü platformlarda localde veriler tutulabilir (Dart bağımlılığından)
  //add: Komutu ile Değer eklenir (auto increment default olarak çalışıyor Her yeni değer eskisinden farklıdır)
  //put(key,value) ile Veriler local'de tutulabilir
  //get(key) : key'e ait value get
  //delete(key): key'e ait value delete
  //Güçlü şifreleme ile localdeki veriler şifreleniyor
  //Shared Preferences ile Farkı Her defasında  asenkron yapıyı bekliyoruz.Çünkü Nativeden haber bekliyoruz
  //Uygulama boyunca açık kalmasını istediğimiz kutuları main metodu içinde açabiliriz.Sonrasında kullanırsak asenkron yapıyı beklemek durumundayız
  //Sqlite göre daha az yer kaplar
  //Hive ile local'e  Temel Veri tiplerini,List,Map ve TypeAdapter kullanılarak sınıf desteği ile de eklenebilir
  //Hive'deki bütün kutuları kapatmak: Hive.close();
  //Hive ile State Management yapısıyla Flutter'ın kendi widgetlarından olan:
  //ValueListenableBuilder<box> : Bir değeri dinleyip değer değişince içindekine haber veren bir widget

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(ChangeNotifierProvider(
            create: (_) => ThemeProvider(isLightTheme: isLightTheme),
            child: AppStart(),
          )));
}

class AppStart extends StatelessWidget {
  const AppStart({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return MyApp(
      themeProvider: themeProvider,
    );
  }
}

class MyApp extends StatelessWidget with WidgetsBindingObserver {
  final ThemeProvider themeProvider;
  const MyApp({Key key, @required this.themeProvider}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeProvider.themeData(),
      debugShowCheckedModeBanner: false,
      home: AppThemeSelected(),
    );
  }
}
//Tema sağlayıcının çalışmasını sağlamak için yapılandırma: Provider
