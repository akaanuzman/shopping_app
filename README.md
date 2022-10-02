## 📱 Basic Shopping App

### 🔎 Preview
https://user-images.githubusercontent.com/55639112/153931839-493d7630-3369-4a99-91d7-e08520642b65.mov

https://user-images.githubusercontent.com/55639112/153932162-31180b7c-9888-47bb-b57e-1a95fa3fa89b.mov

### 📁 Description
The shopping app checks the internet connection. If you are connected to the Internet, the products are listed. You can add your product to the basket with the "+" icon in the upper right corner of the products and increase or decrease the number of your products from the animatic menu that appears. When you add or delete each product, the basket value in the upper right is updated. You can check the products in your basket by clicking the amount in the upper right, and you can increase or decrease your products on the basket.

### 📶 API
[Fake store api](https://fakestoreapi.com/) is used in this project.Data in the API is parsed with the [json_serializable](https://pub.dev/packages/json_serializable) and [json_annotation](https://pub.dev/packages/json_annotation) methods. The ["dio"](https://pub.dev/packages/dio) package is used to send requests to the API.

### 🧑🏻‍💻 Coding
I tried to write the code of this project as clean as possible. I used MVVM as the software architecture model. In terms of folders, the project proceeds through three main folders. The core folder contains structures such as extensions, singleton classes, base classes, and navigation routes that I use in every project. The Properties folder is the part where each screen is separated according to the MVMM software architecture model, and the design and API integration is done. The product folder is the part where the atomic widgets or components I have prepared or my managers are located. Used as provider state management.

### 🎁 APK
You can find the apk [here.](https://www.mediafire.com/file/4pgfblvyd2x97dm/app-release.apk/file)
