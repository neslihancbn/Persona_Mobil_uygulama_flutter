# Mini Katalog Uygulaması

Flutter Günlük Eğitim Projesi - Temel seviyede mobil katalog uygulaması

## 📱 Proje Hakkında

Bu proje, Flutter kullanarak temel seviyede bir mobil uygulama geliştirme sürecini öğretmek için hazırlanmıştır. Öğrenciler bu proje ile widget yapısı, sayfa geçişleri, temel UI tasarımı, veri modeli oluşturma ve proje klasörleme mantığını öğreneceklerdir.

## ✨ Özellikler

- ✅ Modern ve kullanıcı dostu arayüz
- ✅ Ana sayfa ile kategorilere ayrılmış ürün listesi
- ✅ Ürün detay sayfası
- ✅ Arama ve filtreleme
- ✅ GridView ile kart tabanlı tasarım
- ✅ Navigator ile sayfa geçişleri
- ✅ Hero animasyonları
- ✅ Material Design 3 tema
- ✅ Responsive tasarım

## 🛠️ Teknolojiler

- Flutter SDK
- Dart
- Material Design 3

## 📂 Proje Yapısı

```
mini_katalog_app/
├── lib/
│   ├── main.dart                     # Ana uygulama dosyası
│   ├── models/
│   │   └── product.dart              # Ürün model sınıfı
│   ├── screens/
│   │   ├── home_screen.dart          # Ana sayfa
│   │   ├── product_list_screen.dart  # Ürün liste ekranı
│   │   └── product_detail_screen.dart # Ürün detay ekranı
│   └── widgets/
│       └── product_card.dart         # Ürün kartı widget'ı
├── assets/
│   ├── images/                       # Görseller
│   └── data/
│       └── products.json             # Örnek ürün verileri
└── pubspec.yaml                      # Proje bağımlılıkları
```

## 🚀 Kurulum

### Gereksinimler

- Flutter SDK (3.0.0 veya üzeri)
- Dart SDK
- Android Studio / VS Code
- Android Emulator veya fiziksel cihaz

### Adımlar

1. **Projeyi klonlayın:**
   ```bash
   git clone https://github.com/neslihancbn/Persona_Mobil_uygulama_flutter.git
   cd Persona_Mobil_uygulama_flutter/mini_katalog_app
   ```

2. **Doğru klasörde misin kontrol et:**
   ```bash
   dir  # Windows
   ls   # Mac/Linux
   ```
   `pubspec.yaml` görüyorsan doğru yerdesin ✅

3. **Bağımlılıkları yükleyin:**
   ```bash
   flutter pub get
   ```
   Hata vermezse tamamdır ✅

4. **Cihaz bağlı mı kontrol et:**
   ```bash
   flutter devices
   ```
   Şunlardan biri görünmeli:
   - Chrome
   - Edge
   - Android Emulator
   - Bağlı telefon

5. **Uygulamayı çalıştırın:**
   
   **Web için (en kolayı):**
   ```bash
   flutter run -d chrome
   ```
   
   **veya cihaz seçerek:**
   ```bash
   flutter run
   ```
   Menüden cihaz seçin (1, 2, 3...)

## 📚 Öğrenme Hedefleri

### Gün 1: Flutter'a Giriş
- Flutter mimarisi ve Dart
- Proje yapısı
- Stateless ve Stateful widget'lar

### Gün 2: Dart Temelleri ve Widget'lar
- Dart syntax ve veri tipleri
- Text, Container, Row, Column
- Card, ListTile ve butonlar

### Gün 3: Navigasyon
- Navigator.push / pop
- Route kavramı
- Sayfalar arası veri taşıma

### Gün 4: Listeleme ve Veri Yapıları
- JSON ve model sınıfı
- ListView ve GridView
- Arama ve filtreleme

### Gün 5: Proje Tamamlama
- Ekran tasarımları
- State yönetimi
- Final optimizasyonlar

## 🎯 Uygulama Ekranları

### 1. Ana Sayfa (Home Screen)
- Hoş geldin banner'ı
- Kategori kartları
- Tüm ürünlere erişim butonu

### 2. Ürün Listesi (Product List)
- GridView ile ürün kartları
- Arama çubuğu
- Kategori filtresi
- Her ürün için hızlı sepet ekleme

### 3. Ürün Detayı (Product Detail)
- Büyük ürün görseli
- Detaylı açıklama
- Fiyat bilgisi
- Miktar seçici
- Sepete ekleme butonu
- Favorilere ekleme

## 🎨 Tasarım Özellikleri

- **Material Design 3**: Modern ve tutarlı tasarım dili
- **Responsive Layout**: Farklı ekran boyutlarına uyumlu
- **Hero Animations**: Sayfa geçişlerinde akıcı animasyonlar
- **Custom Theme**: Özelleştirilebilir renk paleti
- **Card-based UI**: Kart tabanlı modern arayüz

## 💡 Kullanılan Önemli Flutter Kavramları

1. **Widget Ağacı**: Tüm UI elementleri widget'lardan oluşur
2. **Stateless Widget**: Değişmeyen UI componentleri
3. **Stateful Widget**: Dinamik içerikli componentler
4. **Navigator**: Sayfa yönetimi ve geçişler
5. **MaterialApp**: Uygulama çatısı
6. **Scaffold**: Sayfa yapısı
7. **GridView**: Izgara şeklinde liste
8. **Hero Animation**: Sayfalar arası geçiş animasyonu
9. **Theme**: Uygulama genelinde stil yönetimi

## 🔄 Gelecek Geliştirmeler

- [ ] Gerçek API entegrasyonu
- [ ] Sepet sistemi
- [ ] Favoriler sayfası
- [ ] Kullanıcı girişi
- [ ] Ödeme sistemi
- [ ] Push bildirimleri
- [ ] Çoklu dil desteği

## 📝 Notlar

- Bu proje eğitim amaçlıdır
- Ürün verileri simüle edilmiştir
- API çağrıları için http paketi eklenmiştir ancak şu an yerel veri kullanılmaktadır
- Görseller placeholder olarak ayarlanmıştır

## 🤝 Katkıda Bulunma

Bu eğitim projesine katkıda bulunmak isterseniz:

1. Fork edin
2. Feature branch oluşturun (`git checkout -b feature/amazing-feature`)
3. Commit edin (`git commit -m 'feat: Add amazing feature'`)
4. Push edin (`git push origin feature/amazing-feature`)
5. Pull Request açın

## 📄 Lisans

Bu proje eğitim amaçlıdır ve özgürce kullanılabilir.

## 👨‍💻 Eğitmen Notları

### Öğrencilere Tavsiyeler:
1. Her günün kodlarını mutlaka kendiniz yazın
2. Hata mesajlarını okuyun ve anlamaya çalışın
3. Widget Inspector'ı kullanmayı öğrenin
4. Hot Reload özelliğinden faydalanın
5. Kod formatlamaya dikkat edin
6. Yorumları okuyun ve anlayın

### Yaygın Hatalar ve Çözümleri:
1. **Import eksikliği**: Gerekli paketleri import etmeyi unutmayın
2. **Const kullanımı**: Performans için const kullanın
3. **Key kullanımı**: Liste widget'larında key kullanın
4. **Null safety**: Nullable değerleri kontrol edin
5. **Context kullanımı**: BuildContext'i doğru kullanın

## 📞 İletişim

Sorularınız için eğitmeninizle iletişime geçebilirsiniz.

---

**Başarılar dileriz! 🚀**
