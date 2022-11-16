# VIPER, adını View, Interactor, Presenter, Entity ve Router ’ın ilk harflerinden alan bir yazılım mimarisidir.

 <img src="https://kenanatmaca.com/wp-content/uploads/2019/01/16W73TuYu1DWi9JY4_Uh8aA.png" width="1000" /> 



- View: Bildiğimiz gibi ViewController içerisinde bulunan kodlar diyebiliriz. Burada sadece presenterden gelecek verileri kullanırız. Farklı bir işlem yapılmaz. Sadece ilgili presenteri ile bağlıdır.
- Interactor: Uygulamanın Bussines Logic olarak adlandırdığımız kısmıdır. Burada UI işlemleri yapılmaz. (Fetch,Update vs) işlemler burada gerçekleşir. MVVM tasarım desenindeki VM görevini görür.
- Presenter: View ve Interactor arasındaki bağlantıyı gerçekleştirir. Interactordan aldığı verileri, View ile haberleştirip View katmanının kullanmasını sağlar. Bu katmanda UI veya bussines logic işlemleri bulunmamalıdır.
- Entity: Uygulamanın Model kısmıdır. Uygulama ile ilgili Data modeller burada bulunur. Bu kısım sadece Interactor ile işbirliği yapar. Diğer kısımlarda bulunmamalıdır.
- Router: Bu katman uygulamanın sayfalarının ne zaman gösterileceğini belirlememizi sağlayan katmandır. Bu katman Coordinator tasarım deseni ile modellenebilir.

<img src="https://miro.medium.com/max/1220/1*eym_aL8Ye8mN33MZX30Evg.png" width="1000" /> 

## Resources 🗂

-  https://medium.com/turkishkit/swift-4-protocols-giriş-1dabc75a0ff7
-  https://medium.com/turkishkit/swift-ile-protokol-tabanlı-programla-protocols-2-b84b9dc091f9
-  https://medium.com/turkishkit/swift-ile-uikit-uitableview-giriş-3a9d5f25edf2
-  https://medium.com/hardwareandro/ios-viper-mimarisi-ile-i̇lk-uygulama-geliştirme-fbe78e51332e
-  https://kenanatmaca.com/viper-pattern-nedir/
-  https://medium.com/turkishkit/swift-warning-error-b380170a689d
-  https://www.hackingwithswift.com/read/8/2/building-a-uikit-user-interface-programmatically
-  https://medium.com/turkishkit/swift-typealias-f5b64bc88707
-  https://medium.com/turkishkit/swift-throwing-functions-8121a7bfd72a
-  https://medium.com/turkishkit/swift-weak-ec4878d45101


