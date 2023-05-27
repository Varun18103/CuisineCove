# CuisineCove

CuisineCove is an iOS app developed using Swift 5.4 and Xcode 14.3. It follows the Model-View-Controller (MVC) design pattern for a modular and maintainable codebase. The app's minimum supported iOS version is 16.4.

Frameworks Used:
Alamofire: A networking library that simplifies API communication.
SwiftyJSON: A library for parsing and handling JSON data.
SDWebImage: A framework for asynchronous image downloading and caching.

Project Structure:

![image](https://github.com/Varun18103/CuisineCove/assets/121311587/f917e56e-bcdc-46b6-a527-0dca10886924)

AppDelegate and SceneDelegate: Manage the overall app lifecycle and scene setup.
Resources: Contains useful classes, extensions, and constants for development.
ServerManager: Handles server-side communication, including network requests.
Architecture: Separates the app into Model, View, and Controller components for organized development.
Asset Folder: Stores app icons and visual assets.
Main.Storyboard: Represents the app's user interface with connected view controllers.

Testing:
Sandbox Mode: Utilize platforms like Diawi to test the app in a sandbox environment by generating a build and sharing it with testers.
TestFlight: Apple's beta testing platform for gathering feedback and identifying bugs before release.

Home Screen Features:

![image](https://github.com/Varun18103/CuisineCove/assets/121311587/b037ab1c-0d52-42f2-bed2-99c90bda66d0)

API Request: Retrieve a list of products by making an API request using Alamofire. Parse the response into model objects with SwiftyJSON.
Table View: Display the fetched products in a table view, showing information such as product name, image, price, category, description, and quantity.
Quantity Management: Allow users to adjust the quantity of each product using +/- buttons. Update the quantity in the corresponding model object.
View Cart: Show a bottom view when the quantity of any product is selected. Placeholder buttons for View Cart, My Orders, and View Receipt.

Publishing to App Store:
To publish the app to the App Store, enroll in the Apple Developer Program and obtain a personal Apple Developer Account. Submit the app for review and make it available for download to a broader audience.

For detailed information, please refer to the provided project.
