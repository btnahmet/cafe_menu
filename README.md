# ☕ Cafe Menu

**Cafe Menu**, Flutter ile tasarlanmış, kullanıcıların sanal bir cafe menüsünü görüntüleyip sipariş oluşturabildiği şık ve interaktif bir mobil uygulamadır. Menü öğeleri, fiyatlar ve görseller uygulamada kullanıcıya sunulur.

## Özellikler

- Menü öğelerinin listelenmesi: içecek ve yiyecek kategorileri.
- Öğelere ait görsel (resim), fiyat ve açıklama bilgisi.
- Sepet özelliği: öğeleri ekle, çıkar, toplam fiyatı gör.
- Responsive UI: farklı ekran boyutlarına uyumlu tasarım.
- Tema desteği: açık/koyu mod veya özel renk seçenekleri.
- [Opsiyonel] Firebase veya yerel SQLite/Shared Preferences destekli veri kaydı (eğer varsa belirt).
- Platform bağımsız: Android & iOS.

## 📷 Ekran Görüntüleri

<img width="381" height="699" alt="Ekran görüntüsü 2025-07-29 125707" src="https://github.com/user-attachments/assets/c0f6c8ab-c9c6-4bb4-af24-532cbfb1314b" />
<img width="383" height="686" alt="Ekran görüntüsü 2025-07-29 125239" src="https://github.com/user-attachments/assets/522a474d-f9d5-4ac2-8467-5e97f066a683" /><img width="390" height="676" alt="Ekran görüntüsü 2025-07-29 125605" src="https://github.com/user-attachments/assets/b2964a55-98cb-47ce-a6dc-1b9eee7d8e2d" />
<img width="395" height="683" alt="Ekran görüntüsü 2025-07-29 125617" src="https://github.com/user-attachments/assets/4ec7c152-8331-4a9b-9ca3-84489c4c1e76" />
<img width="387" height="691" alt="Ekran görüntüsü 2025-07-29 125625" src="https://github.com/user-attachments/assets/85400a27-541c-41bf-bc78-08f7ba94d45a" /><img width="393" height="690" alt="Ekran görüntüsü 2025-07-29 125250" src="https://github.com/user-attachments/assets/d55091c9-e284-4ec9-adb1-844cf3fa475c" />
<img width="388" height="681" alt="Ekran görüntüsü 2025-07-29 125510" src="https://github.com/user-attachments/assets/1382d5a8-f3f4-4a71-b204-0c8c30bcb721" />
<img width="388" height="670" alt="Ekran görüntüsü 2025-07-29 125518" src="https://github.com/user-attachments/assets/a46208f1-d5d5-46b4-a5fc-8bd65f4495bd" />
<img width="384" height="705" alt="Ekran görüntüsü 2025-07-29 125529" src="https://github.com/user-attachments/assets/3d4f65da-16cf-45ce-bac0-af5cccdaca20" />
<img width="380" height="672" alt="Ekran görüntüsü 2025-07-29 125546" src="https://github.com/user-attachments/assets/a81bf905-b42c-441f-ab20-f280361369ac" />
<img width="383" height="676" alt="Ekran görüntüsü 2025-07-29 125556" src="https://github.com/user-attachments/assets/7bfeef6b-3e8d-45ac-a9f3-c8f159a8d330" />




## 🛠️ Kurulum & Çalıştırma

```bash
git clone https://github.com/btnahmet/cafe_menu.git
cd cafe_menu
flutter pub get
flutter run

cafe_menu/
├── lib/
│   ├── main.dart             # Uygulama başlangıcı
│   ├── screens/              # Menü, detay, sepet ekranları
│   ├── models/               # Menü öğesi modeli, sepet modeli
│   └── widgets/              # Özel bileşenler (kartlar, liste öğeleri vs.)
├── assets/
│   ├── images/               # Menü görselleri
│   └── icons/ or sounds/     # İkonlar veya sesler (opsiyonel)
├── pubspec.yaml              # Bağımlılıklar ve varlık tanımı
└── test/                     # Birim testleri (varsa)

# Kullanılan Teknolojiler

* Flutter
* Dart
* UI bileşenleri: ListView, GridView, Card, Provider veya Bloc (durum yönetimi kullanıldıysa belirt)
* Tema ve responsive tasarım
* [Opsiyonel] SQLite (sqflite) veya Shared Preferences
* [Opsiyonel] Firebase Firestore / Authentication

# Hedef Kullanıcılar

* Cafe menülerini mobilde keşfetmek isteyen kullanıcılar
* Flutter öğrenen geliştiriciler için örnek proje ve referans
* Tema ve basit sepet uygulaması örneği arayanlar
