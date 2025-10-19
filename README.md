# InboxKit 📬

[![Swift](https://img.shields.io/badge/Swift-5.9+-orange.svg)](https://swift.org)
[![iOS](https://img.shields.io/badge/iOS-13.0+-blue.svg)](https://developer.apple.com/ios/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

**InboxKit** is a powerful, lightweight Swift package that provides a complete inbox messaging solution for iOS applications. Built with modern Swift architecture patterns, it offers both simple integration and advanced customization capabilities.

## 🚀 Quick Start

Get your inbox up and running in just **2 lines of code**:

```swift
let inboxKit = InboxKit()
await inboxKit.configure(root: self, config: InboxServiceConfig(style: .darkMode, appId: "your-app-id", language: .english))
```

That's it! Your inbox is ready to use with full functionality including message display, Core Data persistence, and multi-language support.

## ✨ Features

- **🎨 Dual Theme Support**: Dark and Light mode themes
- **🌍 Multi-Language Support**: Built-in internationalization
- **💾 Core Data Integration**: Automatic message persistence
- **📱 Modern UI**: Clean, responsive interface
- **⚡ Async/Await**: Modern Swift concurrency
- **🔧 Highly Customizable**: Extensive configuration options
- **📦 Lightweight**: Minimal dependencies

## 📋 Requirements

- iOS 13.0+
- Swift 5.9+
- Xcode 15.0+

## 📱 Cross-Platform Support

InboxKit is part of the ControlKit ecosystem and provides cross-platform messaging solutions:

- **🍎 iOS**: [InboxKit](https://github.com/ControlKit/InboxKit) - Swift package for iOS applications
- **🤖 Android**: [InboxKit-Android](https://github.com/ControlKit/InboxKit-Android) - Kotlin library for Android applications

Both versions maintain consistent APIs and functionality across platforms, making it easy to implement inbox messaging in your iOS and Android apps with the same developer experience.

## 📦 Installation

### Swift Package Manager

Add InboxKit to your project using Swift Package Manager:

```swift
dependencies: [
    .package(url: "https://github.com/ControlKit/InboxKit.git", from: "1.0.0")
]
```

## 🎯 Usage Approaches

### 1. Simple Usage (Recommended for Quick Implementation)

Perfect for developers who want to get started quickly with minimal configuration:

```swift
import InboxKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInbox()
    }
    
    private func setupInbox() {
        let inboxKit = InboxKit()
        let config = InboxServiceConfig(
            style: .darkMode,
            appId: "your-app-id",
            language: .english
        )
        
        Task {
            await inboxKit.configure(root: self, config: config)
        }
    }
}
```

**Benefits:**
- ✅ Zero configuration required
- ✅ Default styling and behavior
- ✅ Automatic Core Data setup
- ✅ Built-in error handling

### 2. Advanced Usage (For Customization)

Ideal for developers who need full control over the inbox behavior and appearance:

```swift
import InboxKit

class AdvancedViewController: UIViewController {
    private let inboxKit = InboxKit()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAdvancedInbox()
    }
    
    private func setupAdvancedInbox() {
        // Custom configuration
        let config = InboxServiceConfig(
            style: .lightMode,
            appId: "your-app-id",
            language: .persian
        )
        
        // Custom presentation style
        Task {
            await inboxKit.configure(
                root: self,
                modalPresentationStyle: .pageSheet,
                config: config
            )
        }
    }
    
    // Custom message handling
    private func handleMessageSelection(_ messageId: String) {
        let repository = InboxRepository()
        if let message = repository.getInbox(with: messageId) {
            // Custom message processing
            print("Selected message: \(message.id ?? "Unknown")")
        }
    }
}
```

**Advanced Features:**
- 🎨 Custom presentation styles
- 🔧 Custom view configurations
- 📊 Direct Core Data access
- 🌐 Multi-language support
- ⚡ Custom async handling

## 🌍 Multi-Language Support

InboxKit supports multiple languages out of the box:

```swift
// English
let englishConfig = InboxServiceConfig(
    style: .darkMode,
    appId: "your-app-id",
    language: .english
)

// Persian/Farsi
let persianConfig = InboxServiceConfig(
    style: .lightMode,
    appId: "your-app-id",
    language: .persian
)

// Add more languages as needed
let customConfig = InboxServiceConfig(
    style: .darkMode,
    appId: "your-app-id",
    language: .custom("your-language-code")
)
```

## 🎨 Theme Customization

Choose between built-in themes or create custom ones:

```swift
// Dark Mode Theme
let darkConfig = InboxServiceConfig(
    style: .darkMode,
    appId: "your-app-id",
    language: .english
)

// Light Mode Theme
let lightConfig = InboxServiceConfig(
    style: .lightMode,
    appId: "your-app-id",
    language: .english
)
```

## 💾 Core Data Integration

InboxKit automatically handles message persistence using Core Data:

```swift
// Access the repository for advanced operations
let repository = InboxRepository()

// Create a new inbox message
let newMessage = repository.createInbox(with: "message-id")

// Retrieve all messages
let allMessages = repository.getAllInboxes()

// Get specific message
let specificMessage = repository.getInbox(with: "message-id")

// Update message
if let message = specificMessage {
    repository.updateInbox(message, with: "new-id")
}

// Delete message
repository.deleteInbox(with: "message-id")

// Get message count
let count = repository.getInboxCount()
```

## 🏗️ Architecture

InboxKit follows modern iOS architecture patterns:

```
InboxKit/
├── 📱 View Layer
│   ├── InboxViewController
│   ├── InboxViewProtocol
│   └── Theme-specific Views
├── 🧠 ViewModel Layer
│   ├── InboxViewModel
│   └── DetailViewModel
├── 🌐 Service Layer
│   ├── InboxService
│   ├── InboxRequest
│   └── InboxResponse
├── 💾 Data Layer
│   ├── InboxRepository
│   ├── CoreDataContext
│   └── Inbox Entity
└── 🎨 UI Components
    ├── Dark Mode Theme
    ├── Light Mode Theme
    └── Customizable Styles
```

## 🔧 Configuration Options

### InboxServiceConfig

```swift
public struct InboxServiceConfig {
    public let appId: String           // Your application ID
    public let language: CKLanguage    // Language preference
    public let style: InboxViewStyle   // Theme style
    public let sdkVersion: String      // SDK version (auto-set)
    public let viewConfig: InboxViewConfig // UI configuration
}
```

### Presentation Styles

```swift
// Full screen presentation
await inboxKit.configure(root: self, config: config)

// Page sheet presentation
await inboxKit.configure(
    root: self,
    modalPresentationStyle: .pageSheet,
    config: config
)

// Form sheet presentation
await inboxKit.configure(
    root: self,
    modalPresentationStyle: .formSheet,
    config: config
)
```

## 📊 Data Models

### InboxModel

```swift
public struct InboxModel: Codable {
    public let id: String
    public let title: LocalString?
    public let description: LocalString?
    public let created_at: String?
}
```

### InboxResponse

```swift
public struct InboxResponse: Codable {
    public var data: [InboxModel]?
}
```

## 🚀 Performance

InboxKit is optimized for performance:

- **⚡ Lazy Loading**: Views and data are loaded on-demand
- **💾 Efficient Caching**: Core Data provides automatic caching
- **🔄 Async Operations**: All network operations use modern async/await
- **📱 Memory Efficient**: Minimal memory footprint

## 🛠️ Troubleshooting

### Common Issues

1. **Core Data Model Not Found**
   ```swift
   // Ensure the Core Data model is properly included
   // Check that InboxKit.xcdatamodeld is in your bundle
   ```

2. **Language Not Supported**
   ```swift
   // Use supported languages or add custom language support
   let config = InboxServiceConfig(
       style: .darkMode,
       appId: "your-app-id",
       language: .english // Use supported language
   )
   ```

3. **App ID Required**
   ```swift
   // Always provide a valid app ID
   let config = InboxServiceConfig(
       style: .darkMode,
       appId: "your-valid-app-id", // Required
       language: .english
   )
   ```

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request to the appropriate repository:

- **iOS Contributions**: [InboxKit Repository](https://github.com/ControlKit/InboxKit)
- **Android Contributions**: [InboxKit-Android Repository](https://github.com/ControlKit/InboxKit-Android)

## 📞 Support

For support, email support@controlkit.com or create an issue on GitHub:

- **iOS Issues**: [InboxKit Issues](https://github.com/ControlKit/InboxKit/issues)
- **Android Issues**: [InboxKit-Android Issues](https://github.com/ControlKit/InboxKit-Android/issues)

## 🔄 Version History

- **1.0.0** - Initial release with Core Data integration and multi-language support

---

**Made with ❤️ by the ControlKit team**

## 🔗 Related Projects

- **🍎 iOS**: [InboxKit](https://github.com/ControlKit/InboxKit) - Swift package for iOS
- **🤖 Android**: [InboxKit-Android](https://github.com/ControlKit/InboxKit-Android) - Kotlin library for Android
- **🌐 ControlKit**: [ControlKitBase](https://github.com/ControlKit/ControlKitBase) - Base framework for ControlKit ecosystem