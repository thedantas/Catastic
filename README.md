# Catastic 😺

Catastic is a SwiftUI-based iOS app that showcases a gallery of adorable cats using the [CATAAS](https://cataas.com/) API. The app is structured with a clean MVVM architecture, modular scene separation, snapshot and unit testing, and includes UX details like skeleton placeholders during image loading.

---

## 🌐 Architecture Overview

Catastic follows the **MVVM (Model-View-ViewModel)** architecture for clear separation of concerns and maintainability.

### Folders

* `Scenes/`

  * **CatList/**: Cat grid screen.
  * **CatDetail/**: Cat detail screen.
* `Model/`: Data models like `CatItem`.
* `Core/`

  * **Networking/**: API abstraction via `NetworkClientProtocol`.
  * **Services/**: Business logic (`CatService`).
  * **Extensions/**: Utility extensions.
* `Components/`: Reusable views (e.g., `CustomNavigationBar`, `ShimmerPlaceholder`, `FlexibleView`).

---

## 🎭 Scenes

### CatListView

* Displays a responsive `LazyVGrid` of cat cards.
* Each card includes a `ShimmerPlaceholder` until image is loaded.
* Uses `CatListViewModel` to fetch and format the cat list.

### CatDetailView

* Shows a fullscreen image and metadata of the selected cat.
* Uses `CatDetailViewModel` to manage loading states and image URL logic.
* Includes a custom navigation bar.

---

## 🔧 Installation

1. Clone this repo:

```bash
git clone https://github.com/thedantas/Catastic.git
```

2. Open `Catastic.xcodeproj` in Xcode.
3. Run the app using an iPhone simulator (e.g. iPhone 14).

### Dependencies

Uses Swift Package Manager:

* `SnapshotTesting` (point-in-time UI validation)
* `Lottie` (optional, if used in splash animations)

---

## 🏋️‍♂️ Testing

### 🔢 Unit Tests

Under `CatasticTests/`:

* `CatListViewModelTests` tests:

  * successful parsing
  * error handling with mock services
* `MockNetworkClient` simulates API behavior.

### 📸 Snapshot Tests

Under `CatasticTests/`:

* `CatListViewSnapshotTests`
* `CatDetailViewSnapshotTests`
* `CustomNavigationBarSnapshotTests`

Uses `assertSnapshot(matching:..., as: .image(layout:...))` to validate visual integrity.

---

## 🎨 Components

### ShimmerPlaceholder

A reusable skeleton loader using `LinearGradient` and animation to provide a smooth UX while images are loading.

```swift
ShimmerPlaceholder()
    .frame(height: 200)
```

### CustomNavigationBar

A back button and optional title component that replaces native navigation bar.

```swift
CustomNavigationBar(title: "Catastic 😺")
```

### FlexibleView

Auto-wrapping tag list using a `GeometryReader` to layout tags responsively.

```swift
FlexibleView(data: cat.tags) { tag in
    Text(tag)
}
```
