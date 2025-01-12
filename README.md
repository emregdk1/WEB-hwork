# **Money Transfer Test Automation**

Bu proje, **CatchyLabs** web platformunda **para transfer işlemleri** ve diğer kullanıcı işlevlerini test etmek için hazırlanmış bir otomasyon dosyasıdır. Test senaryoları, kullanıcıların temel özellikleri doğrulamasına ve olası hataları tespit etmesine yardımcı olur.

---

## **Özellikler**

### **Genel Açıklama**

- **Platform:** CatchyLabs Web Client
- **Test Framework:** Gauge ve BDD formatında yazılmıştır.
- **Hedef:** Para transferi, hesap işlemleri ve hata durumlarının doğrulanması.

---

# **FEATURES**

### **Background**

Tüm senaryolar için ortak başlangıç ayarları:

- **Driver:** Google Chrome
- **URL:** Oturum açma sayfası ile başlar.

---

## **Senaryolar**

### **1. Başarılı Giriş Kontrolü**

- URL doğrulanır.
- Kullanıcı adı ve şifre ile giriş yapılır.

---

### **2. Para Transfer İşlemi Kontrolü**

- Kullanıcı giriş yapar.
- Para transfer işlemi gerçekleştirilir.
- Gönderici ve alıcı hesap seçimi yapılır.
- Girilen tutar kontrol edilir.

---

### **3. Hesaba Para Yükleme Kontrolü**

- Kullanıcı giriş yapar.
- Kart bilgileriyle para yüklenir.
- Yükleme tamamlandığında miktar doğrulanır.

---

### **4. Hesap Adı Güncelleme Kontrolü**

- Kullanıcı giriş yapar.
- Hesap adı güncellenir ve doğrulanır.

---

### **5. Yanlış Kart Numarası Kontrolü**

- Kullanıcı giriş yapar.
- Hatalı kart numarasıyla işlem yapıldığında uyarı mesajı doğrulanır.

---

### **6. Başarılı Çıkış Kontrolü**

- Kullanıcı giriş yapar.
- Oturum başarıyla sonlandırılır.

---

### **7. Eksi Bakiye Giriş Kontrolü**

- Kullanıcı giriş yapar.
- Hatalı bir tutarla işlem yapılmak istendiğinde hata mesajı kontrol edilir.

---

## **Nasıl Kullanılır?**

### **Ön Gereksinimler**

1. **Google Chrome** kurulu olmalıdır.
2. Test framework kurulumları tamamlanmış olmalıdır (Cucumber, Selenium, vb.).

---

### **Kurulum ve Çalıştırma**

1. Proje dosyalarını indirin veya klonlayın.
2. Gerekli bağımlılıkları yüklemek için aşağıdaki komutu çalıştırın:
   ```bash
   mvn clean install

# Drivers

## Genel Bakış
`Drivers.java`, Selenium tabanlı test otomasyon projelerinde WebDriver yapılandırmalarını yönetmek için merkezi ve yeniden kullanılabilir bir mekanizma sağlar. Chrome, Firefox ve mobil web emülasyonu dahil olmak üzere birden fazla tarayıcı ve yapılandırmayı destekler.

---

## Özellikler

- **Tarayıcı Desteği**:
  - Chrome
  - Firefox
  - Mobil Web (Chrome mobil emülasyonu kullanarak)

- **Özelleştirilebilir Tarayıcı Ayarları**:
  - Otomasyon ile ilgili bayraklar ve açılır pencere engelleyiciler devre dışı bırakılır.
  - Bildirimler ve eklentiler gibi tarayıcı tercihleri yapılandırılır.

- **Mobil Emülasyon**:
  - Chrome seçeneklerini kullanarak `iPhone 12 Pro` gibi cihazların emülasyonunu destekler.

- **Dinamik Sürücü Alma**:
  - Geçilen sürücü türüne göre WebDriver örneklerini döndürür.

---

## Metotlar

### `getDriver()`
- **Açıklama**: İlgili WebDriver örneğini başlatmak ve yapılandırmak için her enum değeri tarafından uygulanan soyut bir metottur.

### `getDriverType(String driverName)`
- **Açıklama**: Verilen sürücü türüne göre sürücüyü döndürür.
- **Parametreler**:
  - `driverName`: Sürücü adı (`CHROME`, `FIREFOX`, `MOBILEWEB`).
- **Hata Durumu**:
  - Geçersiz bir sürücü türü sağlanırsa `IllegalArgumentException` fırlatılır.

---

## Sürücü Uygulamaları

### CHROME
- Aşağıdaki yapılandırmalarla bir ChromeDriver örneği başlatır:
  - Otomasyon ile ilgili özellikler devre dışı bırakılır (örn. `enable-automation`).
  - Dil (`tr`), GPU devre dışı bırakılır ve açılır pencereler engellenir.
  - Eklentiler ve bildirimler devre dışı bırakılır.
  - Şifre yöneticisi gibi Chrome'a özgü deneysel ayarlar yapılandırılır.

### FIREFOX
- Aşağıdaki ayarlarla bir FirefoxDriver örneği başlatır:
  - Açılır pencere engelleyici, GPU ve infobars devre dışı bırakılır.
  - Dil (`tr`) ayarlanır ve bildirimler devre dışı bırakılır.

### MOBILEWEB
- Mobil emülasyon için bir ChromeDriver örneği başlatır:
  - `iPhone 12 Pro` cihaz emülasyonunu kullanır.
  - `CHROME` ile benzer yapılandırmalar uygulanır ancak mobil cihazlara özel ek ayarlar içerir.

---

## Gereksinimler

1. **Java**: Java'nın sisteminizde kurulu ve yapılandırılmış olduğundan emin olun.
2. **Tarayıcı Sürücüleri**:
  - Chrome için `chromedriver`.
  - Firefox için `geckodriver`.
3. **Bağımlılıklar**:
  - Selenium WebDriver kütüphanesi.
4. **Mobil Emülasyon**:
  - Sadece Chrome üzerinde desteklenir.

# BaseTest.java

## Genel Bakış
`BaseTest.java`, Selenium WebDriver ve Cucumber kullanılarak oluşturulan test otomasyon projeleri için temel bir sınıftır. Test ortamını kurma, temizleme ve yeniden kullanılabilir yapılandırmaları sağlama gibi işlevler içerir.

---

## Özellikler

- **Dinamik WebDriver Başlatma**:
  - `chrome`, `firefox` veya `mobileWeb` tarayıcılarını destekler.

- **Ortam Günlüğü**:
  - İşletim sistemi (`os.name`) ve Java sürümü gibi bilgileri günlükler.

- **Kaynak Yönetimi**:
  - Test verileri için `AccountName.properties` ve `LoginInfo.properties` dosyalarını yükler.

- **Test Sonrası Temizlik**:
  - Her testten sonra WebDriver örneklerini kapatır.

- **Actions Sınıfı Desteği**:
  - Gelişmiş kullanıcı etkileşimlerini desteklemek için `Actions` sınıfını başlatır.

---

## Metotlar

### `setUp(String driverType)`
- **Açıklama**: Verilen tarayıcı türüne göre WebDriver'ı başlatır ve yapılandırır.
- **Parametreler**:
  - `driverType`: Tarayıcı türünü belirten bir dize (`chrome`, `firefox`, `mobileWeb`).
- **Örnek Kullanım**:
  ```gherkin
  Given Setup Driver "chrome"

  
   
# **PAGES**

# LoginPage

### Hakkında
Bu sınıf, **Login Page** (Giriş Sayfası) için tanımlanan bileşenleri ve işlevleri içermektedir. Web tabanlı test otomasyon projelerinde kullanılmak üzere tasarlanmıştır. Bu sınıf, `WebMainPage` sınıfını miras alır ve giriş sayfasına özgü öğeleri tanımlar.

---

### Kullanılan Öğeler

- **Username Giriş Alanı:**
    - XPath: `//input[@placeholder='Username']`
    - Değişken: `TRANSFER_MONEY_USERNAME_INPUT`

- **Password Giriş Alanı:**
    - XPath: `//input[@placeholder='Password']`
    - Değişken: `TRANSFER_MONEY_PASSWORD_INPUT`

- **Login Butonu:**
    - XPath: `//div[text()='Login']//parent::div`
    - Değişken: `TRANSFER_MONEY_LOGIN_BUTTON`

- **Logout Yazısı:**
    - XPath: `//div[text()='Logout']//parent::div`
    - Değişken: `TRANSFER_MONEY_LOGOUT_TEXT`

---

### Yöntemler

#### `getPageName()`
- Geri Dönen Değer: `"Login Page"`
- Bu yöntem, sayfa adını döndürür.

---

### Kullanım
Bu sınıf, test senaryolarında giriş işlemlerinin otomasyonu için kullanılabilir. `BaseElement` ile tanımlanan öğeler, kullanıcı etkileşimlerini gerçekleştirmek için uygundur.

---

### Bağımlılıklar
- **Selenium WebDriver**
- Projede kullanılan diğer ortak sınıflar (`BaseElement`, `WebMainPage`).

---

### Geliştirme Notları
1. XPath ifadelerinin doğruluğunu test edin.
2. Yeni öğeler eklenmesi gerekiyorsa aynı yapı ve standartlara uygun bir şekilde tanımlayın.


# **AddMoneyPage**

### **Hakkında**
Bu sınıf, CatchyLabs platformunda **para yükleme işlemleri** için tasarlanmıştır. Web tabanlı test otomasyon projelerinde para yükleme sayfasına ait bileşenleri ve işlevleri içerir.  
`WebMainPage` sınıfını miras alır ve `BaseElement` ile sayfa öğelerini tanımlar.

---

## **Özellikler**

### **Genel Bilgiler**

- **Sayfa Adı:** Add Money Page
- **Kullanılan Öğeler:** Para yükleme işlemlerine yönelik input alanları ve butonlar.
- **Kullanım Amacı:** Kullanıcıların kart bilgilerini girerek hesaplarına para yüklemesini sağlayan işlemleri test etmek.

---

### **Sayfa Öğeleri**

#### **1. Genel İşlem Öğeleri**
- **Add Money Butonu:**
  - XPath: `//div[text()='Add money']//parent::div`
  - Değişken: `ADD_MONEY_BUTTON`

- **Uyarı Kapat Butonu:**
  - XPath: `//div[@class='css-146c3p1 r-lrvibr r-1loqt21']`
  - Değişken: `WARNING_CLOSE_BUTTON`

---

#### **2. Kart Bilgileri**
- **Kart Numarası Alanı:**
  - XPath: `//div[text()='Card number']//parent::div//input`
  - Değişken: `ADD_MONEY_CARD_NUMBER_INPUT`

- **Kart Sahibi Alanı:**
  - XPath: `//div[text()='Card holder']//parent::div//input`
  - Değişken: `ADD_MONEY_CARD_HOLDER_INPUT`

- **Son Kullanma Tarihi Alanı:**
  - XPath: `//div[text()='Expiry date']//parent::div//input`
  - Değişken: `ADD_MONEY_EXPIRY_DATE_INPUT`

- **CVV Alanı:**
  - XPath: `//div[text()='CVV']//parent::div//input`
  - Değişken: `ADD_MONEY_CVV_INPUT`

---

#### **3. Yükleme İşlemi**
- **Miktar Alanı:**
  - XPath: `//div[text()='Amount']//parent::div//input`
  - Değişken: `ADD_MONEY_AMOUNT_INPUT`

- **Ekle Butonu:**
  - XPath: `//div[text()='Add']//parent::div`
  - Değişken: `ADD_BUTTON`

---

## **Yöntemler**

#### **getPageName()**
- Geri Dönen Değer: `"Add Money Page"`
- Bu yöntem, sayfa adını döndürür.

---

## **Kullanım**

### **Ön Gereksinimler**

1. **Selenium WebDriver** ve gerekli bağımlılıkların projeye entegre edilmiş olması gerekir.
2. CatchyLabs platformunda para yükleme işlemi yapılabilecek bir test hesabına sahip olunmalıdır.

---

### **Kurulum ve Çalıştırma**

1. Projeyi klonlayın veya indirin.
2. Bağımlılıkları yüklemek için şu komutu çalıştırın:
   ```bash
   mvn clean install


# **EditAccountPage**

### **Hakkında**
Bu sınıf, CatchyLabs platformunda **hesap düzenleme işlemleri** için tasarlanmıştır. Web tabanlı test otomasyon projelerinde hesap düzenleme sayfasına ait bileşenleri ve işlevleri içerir.  
`WebMainPage` sınıfını miras alır ve `BaseElement` ile sayfa öğelerini tanımlar.

---

## **Özellikler**

### **Genel Bilgiler**

- **Sayfa Adı:** Edit Account Page
- **Kullanılan Öğeler:** Hesap bilgilerini düzenlemeye yönelik input alanları ve butonlar.
- **Kullanım Amacı:** Kullanıcıların hesap adını düzenleyip kaydetme işlemlerini test etmek.

---

### **Sayfa Öğeleri**

#### **1. Genel İşlem Öğeleri**
- **Hesap Düzenle Butonu:**
  - XPath: `//div[text()='Edit account']//parent::div`
  - Değişken: `EDIT_ACCOUNT_BUTTON`

- **Hesap Adı Alanı (Input):**
  - XPath: `//div[text()='Account name']//parent::div//input`
  - Değişken: `ACCOUNT_NAME_INPUT`

- **Güncelle Butonu:**
  - XPath: `//div[text()='UPDATE']//parent::div`
  - Değişken: `UPDATE_BUTTON`

- **Hesap Adı Alanı (Metin):**
  - XPath: `//div[text()='Account name']/following-sibling::div`
  - Değişken: `ACCOUNT_NAME_TEXT`

---

## **Yöntemler**

#### **getPageName()**
- Geri Dönen Değer: `"Edit Account Page"`
- Bu yöntem, sayfa adını döndürür.

---

## **Kullanım**

### **Ön Gereksinimler**

1. **Selenium WebDriver** ve gerekli bağımlılıkların projeye entegre edilmiş olması gerekir.
2. CatchyLabs platformunda bir test hesabına sahip olunmalıdır.

---

### **Kurulum ve Çalıştırma**

1. Projeyi klonlayın veya indirin.
2. Maven bağımlılıklarını yüklemek için şu komutu çalıştırın:
   ```bash
   mvn clean install


# **TransferMoneyPage**

### **Hakkında**
Bu sınıf, CatchyLabs platformunda **para transferi işlemleri** için tasarlanmıştır. Web tabanlı test otomasyon projelerinde para transfer sayfasına ait bileşenleri ve işlevleri içerir.  
`WebMainPage` sınıfını miras alır ve `BaseElement` ile sayfa öğelerini tanımlar.

---

## **Özellikler**

### **Genel Bilgiler**

- **Sayfa Adı:** Transfer Money Page
- **Kullanılan Öğeler:** Para transferi işlemleri için gerekli input alanları, butonlar ve dropdown menüler.
- **Kullanım Amacı:** Kullanıcıların hesapları arasında para transferi işlemlerini test etmek.

---

### **Sayfa Öğeleri**

#### **1. Genel İşlem Öğeleri**
- **Para Transferini Aç Butonu:**
  - XPath: `//div[text()='Open Money Transfer']//parent::div`
  - Değişken: `OPEN_MONEY_TRANSFER_BUTTON`

- **Para Transfer Butonu:**
  - XPath: `//div[text()='Transfer money']//parent::div`
  - Değişken: `TRANSFER_MONEY_BUTTON`

---

#### **2. Dropdown ve Input Alanları**
- **Gönderici Hesap Dropdown:**
  - XPath: `(//div[@class='css-175oi2r r-1777fci']//select)[1]`
  - Değişken: `SENDER_ACCOUNT_DROP`

- **Alıcı Hesap Dropdown:**
  - XPath: `(//div[@class='css-175oi2r r-1777fci']//select)[2]`
  - Değişken: `RECEIVER_ACCOUNT_DROP`

- **Tutar Giriş Alanı:**
  - XPath: `//input[contains(@inputmode,'numeric')]`
  - Değişken: `TRANSFER_MONEY_AMOUNT_INPUT`

---

#### **3. Transfer İşlemi ve Doğrulama**
- **Gönder Butonu:**
  - XPath: `//div[text()='Send']//parent::div`
  - Değişken: `TRANSFER_MONEY_SEND_BUTTON`

- **Transfer Edilen Tutar Yazısı:**
  - XPath: `(//div[text()='Amount:']/following-sibling::div//div)[1]`
  - Değişken: `TRANSFERRED_MONEY_AMOUNT_TEXT`

---

## **Yöntemler**

#### **getPageName()**
- Geri Dönen Değer: `"Transfer Money Page"`
- Bu yöntem, sayfa adını döndürür.

---

## **Kullanım**

### **Ön Gereksinimler**

1. **Selenium WebDriver** ve gerekli bağımlılıkların projeye entegre edilmiş olması gerekir.
2. CatchyLabs platformunda bir test hesabına ve birden fazla hesap arasında transfer yapılabilir bir senaryoya sahip olunmalıdır.

---

### **Kurulum ve Çalıştırma**

1. Projeyi klonlayın veya indirin.
2. Maven bağımlılıklarını yüklemek için şu komutu çalıştırın:
   ```bash
   mvn clean install


# **STEPDEFINITIONS**


# **CommonStepDefinitions**

### **Hakkında**
Bu sınıf, CatchyLabs platformunda test otomasyonu için gerekli adımları tanımlayan `Cucumber` step definitions dosyasıdır.  
Sınıf, temel işlevleri kapsar ve projedeki çeşitli test senaryolarında kullanılmak üzere genel bir yapı sağlar.

---

## **Özellikler**

### **Genel Bilgiler**

- **Framework:** Cucumber ve Gauge
- **Hedef:** Test senaryoları için tekrar eden işlemleri (örneğin URL kontrolü, oturum açma, hata doğrulama) kolaylaştırmak.
- **Kullanılan Paketler:**
    - `io.cucumber.java.en.*`: Cucumber step annotations.
    - `org.openqa.selenium.*`: Selenium WebDriver öğeleri.
    - `org.junit.jupiter.api.*`: Assertion işlemleri.
    - `org.slf4j.Logger`: Loglama işlemleri.

---

### **Tanımlanan Adımlar**

#### **1. URL İşlemleri**
- **Adım:** `@Given("Go to {string} address")`
    - Belirtilen URL'ye yönlendirme yapar ve sayfanın yüklenmesini bekler.
- **Adım:** `@Given("Check if current URL contains the value {string}")`
    - Mevcut URL'nin beklenen bir değeri içerip içermediğini kontrol eder.

---

#### **2. Hesap İşlemleri**
- **Adım:** `@Given("The account is successfully logged out")`
    - Hesabın başarıyla çıkış yaptığından emin olur.
- **Adım:** `@Given("Check that the account has been successfully logged out")`
    - Çıkış işleminin başarılı olduğunu doğrular.

---

#### **3. Bekleme İşlemleri**
- **Adım:** `@And("Wait {int} seconds")`
    - Belirtilen süre kadar bekleme yapar (saniye cinsinden).
- **Adım:** `@And("User waits {long} milliseconds")`
    - Belirtilen süre kadar bekleme yapar (milisaniye cinsinden).

---

#### **4. Hata Mesajı Doğrulama**
- **Adım:** `@When("Assert error message is displayed for negative amount")`
    - Negatif miktar için hata mesajının görüntülendiğini doğrular.
- **Adım:** `@When("Verify error message is displayed for wrong card number")`
    - Hatalı kart numarası girildiğinde hata mesajının görüntülendiğini doğrular.

---

#### **5. Miktar İşlemleri**
- **Adım:** `@When("Save the amount value")`
    - Para miktarını kaydeder ve loglar.
- **Adım:** `@When("Verify the updated amount")`
    - Güncellenen para miktarını doğrular.

---

## **Kullanım**

### **Ön Gereksinimler**

1. **Cucumber ve Selenium WebDriver** kurulumlarının yapılmış olması gerekir.
2. Chrome tarayıcı ve uygun WebDriver sürücüsü yüklü olmalıdır.

---

### **Kurulum ve Çalıştırma**

1. Projeyi klonlayın veya indirin.
2. Maven bağımlılıklarını yüklemek için şu komutu çalıştırın:
   ```bash
   mvn clean install

# **LoginStepDefinitions**

### **Hakkında**
Bu sınıf, CatchyLabs platformunda kullanıcı giriş işlemleri için tanımlanmış `Cucumber Step Definitions` dosyasıdır. Test senaryolarında kullanıcı giriş süreçlerini yönetmek için kullanılır.

---

## **Özellikler**

### **Genel Bilgiler**

- **Framework:** Cucumber
- **Kullanım Amacı:** Kullanıcı giriş işlemlerini Cucumber senaryolarında tanımlanan adımlarla otomatikleştirmek.
- **Kullanılan Paketler:**
  - `io.cucumber.datatable.DataTable`: Giriş işlemi sırasında veri tablosu kullanımı.
  - `org.slf4j.Logger`: Test süreçlerinde loglama için kullanılır.

---

### **Adımlar**

#### **1. Kullanıcı Giriş İşlemi**
- **Adım:** `@Given("User performs login")`
  - **Parametre:** `DataTable table`
  - Bu adım, giriş işlemini gerçekleştirir. Giriş için gerekli bilgiler `DataTable` formatında sağlanır ve `loginProcess` metodu ile işlenir.

---

## **Yöntemler**

#### **performLogin(DataTable table)**
- **Açıklama:** Bu yöntem, kullanıcının giriş yapmasını sağlar. `DataTable` ile sağlanan veriler `loginProcess` metoduna aktarılır.
- **Loglama:** Yöntem, giriş işleminin detaylarını loglar.

---

## **Kullanım**

### **Ön Gereksinimler**

1. **Cucumber ve Selenium WebDriver** kurulumlarının tamamlanmış olması gerekir.
2. Kullanıcı giriş bilgilerini içeren bir senaryo oluşturulmalıdır.

---

### **Kurulum ve Çalıştırma**

1. Projeyi klonlayın veya indirin.
2. Maven bağımlılıklarını yüklemek için şu komutu çalıştırın:
   ```bash
   mvn clean install


# **TransferMoneyStepDefinitions**

### **Hakkında**
Bu sınıf, CatchyLabs platformunda **para transferi işlemleri** için `Cucumber Step Definitions` dosyası olarak tanımlanmıştır. Test senaryolarında para transfer işlemlerini yönetmek ve doğrulamak için kullanılır.

---

## **Özellikler**

### **Genel Bilgiler**

- **Framework:** Cucumber
- **Kullanım Amacı:** Para transferi adımlarını Cucumber senaryolarında otomatikleştirmek.
- **Kullanılan Paketler:**
  - `io.cucumber.datatable.DataTable`: Transfer işlemleri sırasında veri tablosu kullanımı.
  - `org.slf4j.Logger`: Test süreçlerinde loglama için kullanılır.

---

### **Adımlar**

#### **1. Para Transfer Seçeneği**
- **Adım:** `@Given("Select Transfer Money")`
  - **Parametre:** `DataTable table`
  - Bu adım, kullanıcıların para transferi işlemini gerçekleştirmesini sağlar. Gerekli bilgiler `DataTable` formatında sağlanır ve `transferMoneyOption` metodu ile işlenir.

---

## **Yöntemler**

#### **transferMoneyOption(DataTable table)**
- **Açıklama:** Bu yöntem, para transfer işlemi için gerekli seçeneklerin seçilmesini sağlar.
- **Loglama:** İşlemler sırasında detaylar loglanır.
- **Kullanım:** Transfer işlemi için gerekli bilgiler Cucumber senaryosunda sağlanır ve bu yöntem ile işlenir.

---

## **Kullanım**

### **Ön Gereksinimler**

1. **Cucumber ve Selenium WebDriver** kurulumlarının tamamlanmış olması gerekir.
2. Para transfer işlemleri için gerekli bilgiler içeren bir senaryo hazırlanmalıdır.

---

### **Kurulum ve Çalıştırma**

1. Projeyi klonlayın veya indirin.
2. Maven bağımlılıklarını yüklemek için şu komutu çalıştırın:
   ```bash
   mvn clean install
   
# **STEPS**


# **BaseSteps**

### **Hakkında**
Bu sınıf, test otomasyon projelerinde temel işlevlerin yürütülmesi için oluşturulmuştur. Selenium WebDriver tabanlı testlerde sıklıkla kullanılan metotları içerir ve diğer adım tanımlama sınıfları tarafından kullanılabilir.

---

## **Özellikler**

### **Genel Bilgiler**

- **Temel İşlevler:**
  - WebElement bulma ve tıklama.
  - Dropdown seçimleri.
  - JavaScript işlemleri (scroll, tıklama).
  - Sayfa yüklenme durumu kontrolü.
- **Framework:** Selenium WebDriver
- **Loglama:** SLF4J tabanlı loglama kullanılmıştır.

---

### **Başlıca Metotlar**

#### **1. Element İşlemleri**
- `findElement(By infoParam)`: Belirtilen locator ile bir WebElement bulur ve sayfada görünmesini bekler.
- `clickElement(By by)`: Belirtilen locator ile bir öğeye tıklar.
- `sendKeys(By by, String text)`: Bir input alanına metin gönderir.
- `isDisplayedBy(By by)`: Bir öğenin görünür olup olmadığını kontrol eder.

---

#### **2. Sayfa İşlemleri**
- `goToUrl(String url)`: Belirtilen URL'ye yönlendirir ve varsa açılan uyarıları kabul eder.
- `getCurrentUrl()`: Mevcut sayfanın URL'sini döndürür.
- `refreshPage()`: Sayfayı yeniler.
- `waitForPageToCompleteState()`: Sayfa yüklenme durumunu kontrol eder ve tam yüklenmesini bekler.

---

#### **3. JavaScript İşlemleri**
- `javaScriptClicker(WebElement element)`: Bir öğeye JavaScript ile tıklar.
- `scrollByJs(By by)`: Bir öğeye JavaScript ile kaydırır.
- `scrollIntoKeyByJs(WebElement webElement)`: Bir öğeye kaydırır ve görünüm merkezine getirir.

---

#### **4. Dropdown ve Liste İşlemleri**
- `selectTextFromDropDown(String text, By by)`: Bir dropdown menüsünden belirtilen metni seçer.
- `findMostExpensiveTablet(List<WebElement> priceElements)`: Bir liste içinde en yüksek fiyatlı öğeyi bulur ve döndürür.

---

## **Kullanım**

### **Ön Gereksinimler**
1. Selenium WebDriver yapılandırmasının tamamlanmış olması gerekir.
2. SLF4J loglama kütüphanesi projede entegre olmalıdır.

---

### **Kurulum ve Çalıştırma**
1. Projeyi klonlayın veya indirin.
2. Maven bağımlılıklarını yüklemek için şu komutu çalıştırın:
   ```bash
   mvn clean install

# **LoginSteps**

### **Hakkında**
Bu sınıf, CatchyLabs platformunda **kullanıcı giriş işlemleri** için adım adım işlemleri yönetir. `BaseSteps` sınıfını genişleterek giriş süreciyle ilgili işlevler sunar.

---

## **Özellikler**

### **Genel Bilgiler**

- **Kapsam:** Kullanıcı adı ve şifre giriş işlemleri, giriş butonuna tıklama, giriş doğrulama.
- **Framework:** Cucumber, Selenium WebDriver
- **Kullanım Amacı:** Kullanıcı giriş işlemlerini otomatikleştirmek ve doğrulamak.

---

### **Başlıca Metotlar**

#### **1. Giriş Süreci**
- **`loginProcess(DataTable table)`**
  - **Açıklama:** `DataTable` formatında sağlanan kullanıcı adı ve şifre bilgilerini alır, giriş işlemini tamamlar.
  - **Doğrulama:** Giriş başarılı olduğunda logout metninin görünür olduğunu doğrular.

---

#### **2. Giriş Adımları**
- **`enterUsername(String userName)`**
  - **Açıklama:** Kullanıcı adını giriş alanına yazar.
  - **Parametre:** `userName` (Kullanıcı adı).

- **`enterPassword(String userPassword)`**
  - **Açıklama:** Kullanıcı şifresini giriş alanına yazar.
  - **Parametre:** `userPassword` (Kullanıcı şifresi).

- **`clickLoginButton()`**
  - **Açıklama:** Giriş butonuna tıklar.

---

## **Kullanım**

### **Ön Gereksinimler**

1. **Selenium WebDriver** ve **Cucumber** yapılandırmasının tamamlanmış olması gerekir.
2. Kullanıcı giriş bilgilerini içeren bir `DataTable` test senaryosu hazırlanmalıdır.

---

### **Kurulum ve Çalıştırma**
1. Projeyi klonlayın veya indirin.
2. Maven bağımlılıklarını yüklemek için şu komutu çalıştırın:
   ```bash
   mvn clean install


# **TransferMoneySteps**

### **Hakkında**
Bu sınıf, CatchyLabs platformunda **para transferi, para ekleme ve hesap düzenleme işlemleri** için adım adım işlemleri yönetir. `BaseSteps` sınıfını genişleterek, farklı işlemlere özgü işlevleri sağlar.

---

## **Özellikler**

### **Genel Bilgiler**

- **Kapsam:** Para transferi, para ekleme ve hesap düzenleme işlemleri.
- **Framework:** Cucumber, Selenium WebDriver
- **Kullanım Amacı:** Kullanıcı işlemlerini otomatikleştirmek ve doğrulamak için test senaryolarını desteklemek.

---

### **Başlıca Metotlar**

#### **1. İşlem Yönetimi**
- **`transferMoneyOption(DataTable option)`**
  - Sağlanan seçeneklere göre para transferi, para ekleme veya hesap düzenleme işlemlerini yönetir.
- **`TransferMoneyHashMap(DataTable option)`**
  - İşlem türüne göre metotları haritaya ekler ve çağırır.

---

#### **2. Para Transferi İşlemleri**
- **`transferMoneyProcess`**
  - Gönderici ve alıcı hesap seçimi, tutar girişi ve doğrulama işlemlerini gerçekleştirir.
- **`amountEntry(String amount, By by)`**
  - Tutar giriş alanına belirtilen değeri yazar.
- **`checkAmount(By by)`**
  - Transfer edilen tutarın doğru şekilde işlendiğini doğrular.

---

#### **3. Para Ekleme İşlemleri**
- **`addMoneyProcess`**
  - Kart bilgileri ve tutar girişi ile para ekleme işlemini yönetir.
- **`cardNumberEntry`, `cardHolderEntry`, `cardExpiryDateEntry`, `cardCvvEntry`**
  - Kart bilgilerini ilgili alanlara yazar.

---

#### **4. Hesap Düzenleme İşlemleri**
- **`editAccountProcess`**
  - Hesap adı düzenleme işlemlerini gerçekleştirir.
- **`accountNameEntry(String accountName, By by)`**
  - Hesap adı giriş alanına belirtilen değeri yazar.

---

#### **5. Yardımcı Metotlar**
- **`hoverAndClickElementByJs(By by)`**
  - Bir öğe üzerinde hover işlemi yapar ve JavaScript ile tıklar.
- **`selectDropDown(String text, By by)`**
  - Bir dropdown menüsünden belirtilen metni seçer.

---

## **Kullanım**

### **Ön Gereksinimler**

1. **Selenium WebDriver** ve **Cucumber** yapılandırmalarının tamamlanmış olması gerekir.
2. İşlem seçeneklerini ve gerekli bilgileri içeren bir `DataTable` test senaryosu hazırlanmalıdır.

---

### **Kurulum ve Çalıştırma**
1. Projeyi klonlayın veya indirin.
2. Maven bağımlılıklarını yüklemek için şu komutu çalıştırın:
   ```bash
   mvn clean install
   
# **PROPERTIES**

# **AccountName**

### **Hakkında**
Bu dosya, test otomasyonunda kullanılan kullanıcı giriş bilgileri, kart bilgileri, ve işlem verileri gibi parametreleri tanımlamak için kullanılır. Test senaryolarında gerekli veri setlerini sağlar.

---

## **Özellikler**

### **Dosya Yapısı**
Dosya, anahtar-değer çiftleriyle düzenlenmiştir. Anahtar, bir test senaryosunda kullanılacak belirli bir öğeyi temsil eder; değer ise o öğeye karşılık gelen veriyi içerir.

---

### **İçerik**

#### **1. Gönderici ve Alıcı Hesapları**
- **Gönderici Hesap:**
  - **Key:** `SenderAccount_Selection`
  - **Value:** `GUNCELTEST`
- **Alıcı Hesap:**
  - **Key:** `ReceiverAccount_Selection`
  - **Value:** `Testinium-4`

---

#### **2. Tutar Verileri**
- **Doğru Tutar:**
  - **Key:** `Amount_Input`
  - **Value:** `100000`
- **Yanlış Tutar:**
  - **Key:** `WrongAmount_Input`
  - **Value:** `-100000`

---

#### **3. Kart Bilgileri**
- **Kart Numarası:**
  - **Key:** `CardNumber_Input`
  - **Value:** `1234 1234 1234 1234`
- **Hatalı Kart Numarası:**
  - **Key:** `WrongCardNumber_Input`
  - **Value:** `9999 9999 9999 9999`
- **Kart Sahibi:**
  - **Key:** `CardHolder_Input`
  - **Value:** `deneme`
- **Son Kullanma Tarihi:**
  - **Key:** `ExpiryDate_Input`
  - **Value:** `1226`
- **CVV:**
  - **Key:** `Cvv_Input`
  - **Value:** `111`

---

#### **4. Hesap Adı**
- **Mevcut Hesap Adı:**
  - **Key:** `CurrentAccountName_Input`
  - **Value:** `NewAccountName`

---

## **Kullanım**

### **Ön Gereksinimler**
1. Bu dosya, otomasyon projesinin ana kaynak klasöründe yer almalıdır.
2. `BaseTest` veya ilgili yapılandırmalarla dosyaya erişim sağlanmalıdır.

---

### **Nasıl Kullanılır?**
1. **Değerleri Alma:**  
   Test sırasında, bu dosyadaki bir değer şu şekilde alınabilir:
   ```java
   String senderAccount = BaseTest.AccountName.getString("SenderAccount_Selection");


# **LoginInfo**

### **Hakkında**
Bu dosya, test otomasyonunda **kullanıcı giriş bilgilerini** depolamak için kullanılır. Kullanıcı adı ve şifre gibi bilgileri anahtar-değer çiftleri halinde içerir. Test senaryolarında giriş işlemleri sırasında bu bilgiler kullanılır.

---

## **Özellikler**

### **Dosya Yapısı**
Dosya, anahtar-değer çiftleriyle düzenlenmiştir. Her anahtar, bir giriş alanını temsil eder; değer ise o alan için kullanılacak veriyi içerir.

---

### **İçerik**

#### **1. Kullanıcı Adı**
- **Key:** `Username_Input`
- **Value:** `emre.guduk`

#### **2. Şifre**
- **Key:** `Password_Input`
- **Value:** `Emre-1452`

---

## **Kullanım**

### **Ön Gereksinimler**
1. Bu dosya, otomasyon projesinin ana kaynak klasöründe yer almalıdır.
2. `BaseTest` veya ilgili yapılandırmalarla dosyaya erişim sağlanmalıdır.

---

### **Nasıl Kullanılır?**
1. **Değerleri Alma:**  
   Test sırasında, bu dosyadaki bir değer şu şekilde alınabilir:
   ```java
   String username = BaseTest.LoginInfo.getString("Username_Input");
   String password = BaseTest.LoginInfo.getString("Password_Input");


# **log4j**

### **Hakkında**
Bu dosya, **Log4j** kütüphanesinin konfigürasyonu için kullanılır. Loglama işlemleri sırasında log seviyeleri, çıktı formatları ve hedeflerin ayarlanmasını sağlar.

---

## **Özellikler**

### **Genel Yapı**

1. **Root Logger Seviyesi:**
  - **Key:** `log4j.rootLogger`
  - **Value:** `INFO, stdout`
  - Log seviyesini `INFO` olarak ayarlar ve log çıktısını `stdout` hedefinde görüntüler.

2. **Appender Tanımı:**
  - **Appender Türü:** `ConsoleAppender`
  - **Hedef:** `System.out` (Konsol).

3. **Encoding Ayarı:**
  - Log çıktısının `UTF-8` formatında olmasını sağlar.

4. **Layout Formatı:**
  - **PatternLayout:** Logların düzenlenmesini sağlar.
  - **Conversion Pattern:** `%d{yyyy-MM-dd HH:mm:ss} %-5p [%F:%L] %M - %m%n`
    - **%d:** Tarih ve zaman.
    - **%-5p:** Log seviyesi (INFO, WARN, vb.).
    - **[%F:%L]:** Dosya adı ve satır numarası.
    - **%M:** Metot adı.
    - **%m:** Log mesajı.

5. **Filter Tanımı:**
  - Log seviyesi `WARN` olan mesajları filtreler.
  - `WARN` seviyesinde olan mesajlar konsolda gösterilmez.

### **İçerik**

```properties
log4j.rootLogger=INFO, stdout

log4j.appender.stdout=org.apache.log4j.ConsoleAppender
log4j.appender.stdout.Target=System.out
log4j.appender.stdout.encoding=UTF-8
log4j.appender.stdout.layout=org.apache.log4j.PatternLayout
log4j.appender.stdout.layout.ConversionPattern=%d{yyyy-MM-dd HH:mm:ss} %-5p [%F:%L] %M - %m%n

log4j.appender.stdout.filter.levelFilter=org.apache.log4j.varia.LevelMatchFilter
log4j.appender.stdout.filter.levelFilter.LevelToMatch=WARN
log4j.appender.stdout.filter.levelFilter.AcceptOnMatch=false
```

---

**# POM**

# **pom.xml**

### **Hakkında**
Bu dosya, Maven projelerinde kullanılan bağımlılıkları, eklentileri ve proje yapılandırmalarını tanımlamak için oluşturulmuş bir yapılandırma dosyasıdır. Test otomasyonu ve web projeleri için gerekli kütüphaneleri ve sürümlerini içerir.

---

## **Özellikler**

### **Proje Bilgileri**
- **Group ID:** `java`
- **Artifact ID:** `WEB-hwork`
- **Version:** `1.0-SNAPSHOT`

---

### **Bağımlılıklar**
Bu dosyada projede kullanılan tüm kütüphaneler tanımlanmıştır.

#### **1. Genel Bağımlılıklar**
- **Selenium:** Web tarayıcı otomasyonu için kullanılır.
  - **Sürüm:** `4.20.0`
- **Cucumber:** BDD test framework’ü.
  - **Sürüm:** `7.20.1`
- **Rest-Assured:** API testi için kullanılır.
  - **Sürüm:** `5.1.1`
- **Lombok:** Kod azaltma ve geliştirme kolaylığı sağlar.
  - **Sürüm:** `1.18.28`
- **JavaFaker:** Test verisi oluşturma kütüphanesi.
  - **Sürüm:** `1.0.2`

#### **2. Loglama**
- **Log4j:** Loglama işlemleri için kullanılır.
  - **Sürüm:** `2.0.5`
- **SLF4J:** Farklı loglama framework’leriyle entegrasyon sağlar.

#### **3. Ek Kütüphaneler**
- **Google Cloud Vision:** Görsel işleme API'si.
  - **Sürüm:** `2.0.0`
- **SnakeYAML:** YAML dosyalarını işlemek için kullanılır.
  - **Sürüm:** `2.2`
- **Thucydides (Serenity):** BDD raporları ve test senaryoları için kullanılır.
  - **Sürüm:** `0.9.275`

---

### **Eklentiler**
- **Maven Surefire Plugin:** Test çalıştırma işlemleri için kullanılır.
  - **Sürüm:** `3.1.2`
  - **Konfigürasyon:**
    - `reportFormat: brief`
    - `useFile: false`
- **Maven Compiler Plugin:** Java kaynak kodunu derlemek için kullanılır.
  - **Sürüm:** `3.8.1`
  - **Kaynak Sürümü:** `11`

---

## **Kullanım**

### **Bağımlılıkları Yükleme**
Aşağıdaki komut ile projedeki bağımlılıkları yükleyebilirsiniz:
```bash
mvn clean install






