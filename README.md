# eazr_assignment

## Getting Started

Architecture:
The application follows a modular architecture where different components are organized into separate folders based on their responsibilities. The API integration is handled in the apiservice folder, while the user interface (UI) is designed and implemented in the screens folder. This modular approach promotes code organization, separation of concerns, and easier maintenance.

Design Patterns:
Separation of Concerns: The application separates the concerns of data fetching and UI presentation. The apiservice folder is responsible for handling API requests and responses, while the screens folder focuses on designing user interfaces and interacting with users.

Third-Party Libraries:
http: Used for making HTTP requests to the News API endpoints. It provides a simple and easy-to-use API for performing network operations.
flutter_webview_plugin: Utilized to display web content (articles) within the application using WebView. This library simplifies the integration of web content into the Flutter application.

Overview:
The Flutter application is designed with a focus on modularity and separation of concerns. The apiservice folder contains all the code related to API integration, including endpoints, request handling, and response parsing. On the other hand, the screens folder houses all UI components, screens, and navigation logic. By organizing the code in this way, the application promotes code maintainability and scalability. Additionally, the application utilizes the http library for network communication, ensuring smooth data fetching from the News API. Overall, this architecture enables efficient development and maintenance of the application while providing a seamless user experience. Flutter_webview_plugin enables the display of web content within the application, providing a seamless user experience.


