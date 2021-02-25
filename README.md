# Tema Değişimi ✨

Dark Mode | Light Mode | Record
------------ | ------------- | -------------
<img src="https://github.com/harunayyildiz/theme_change/blob/master/lib/screen_dark.png" alt="Dark Mode" width="220" height="391"> | <img src="https://github.com/harunayyildiz/theme_change/blob/master/lib/screen_light.png" alt="Light Mode" width="220" height="391"> | <img src="https://github.com/harunayyildiz/theme_change/blob/master/lib/Theme_change_record.gif" alt="Splash" width="220" height="391">


# Bilgiler

* Bir kutuyu kapatmak: settings.close();
* Bir kutu kapatmak: Hive.box('settings').close();
* Hive native kanallarla iletişim kurmadığı için daha hızlıdır. (Native Bağımlılığı yoktur)
* Hive ile Web,Mobil ve Masaüstü platformlarda localde veriler tutulabilir (Dart bağımlılığından)
* add: Komutu ile Değer eklenir (auto increment default olarak çalışıyor Her yeni değer eskisinden farklıdır)
* put(key,value) ile Veriler local'de tutulabilir
* get(key) : key'e ait value get
* delete(key): key'e ait value delete
* Güçlü şifreleme ile localdeki veriler şifreleniyor
* Shared Preferences ile Farkı Her defasında  asenkron yapıyı bekliyoruz.Çünkü Nativeden haber bekliyoruz
* Uygulama boyunca açık kalmasını istediğimiz kutuları main metodu içinde açabiliriz.Sonrasında kullanırsak asenkron yapıyı beklemek durumundayız
* Sqlite göre daha az yer kaplar
* Hive ile local'e  Temel Veri tiplerini,List,Map ve TypeAdapter kullanılarak sınıf desteği ile de eklenebilir
* Hive'deki bütün kutuları kapatmak: Hive.close();
* Hive ile State Management yapısıyla Flutter'ın kendi widgetlarından olan:
* ValueListenableBuilder<box> : Bir değeri dinleyip değer değişince içindekine haber veren bir widget

# License 
## MIT ~
<p><a target="_blank" rel="noopener noreferrer" href="https://camo.githubusercontent.com/4b8724b99a8519c22d968e1e441f3623f645adb89e7dde5fd467f679da96ae69/68747470733a2f2f6d65646961312e67697068792e636f6d2f6d656469612f5a486a53587a526b55575457452f3230302e676966"><img src="https://camo.githubusercontent.com/4b8724b99a8519c22d968e1e441f3623f645adb89e7dde5fd467f679da96ae69/68747470733a2f2f6d65646961312e67697068792e636f6d2f6d656469612f5a486a53587a526b55575457452f3230302e676966" alt="Yeay" data-canonical-src="https://media1.giphy.com/media/ZHjSXzRkUWTWE/200.gif" style="max-width:100%;"></a></p>
