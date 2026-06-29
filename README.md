![](https://raw.githubusercontent.com/wiki/kitasuke/PagingMenuController/images/logo.png)

[![CI Status](http://img.shields.io/travis/kitasuke/PagingMenuController.svg?style=flat)](https://travis-ci.org/kitasuke/PagingMenuController)
![Swift 3.0.x](https://img.shields.io/badge/Swift-3.0.x-orange.svg)

This library is inspired by [PageMenu](https://github.com/uacaps/PageMenu)

## Updates

See [CHANGELOG](https://github.com/kitasuke/PagingMenuController/blob/master/CHANGELOG.md) for details

## Description

### Standard mode with flexible item width

<img src="https://raw.githubusercontent.com/wiki/kitasuke/PagingMenuController/images/demo4.gif" width="160" height="284">

### Segmented control mode

<img src="https://raw.githubusercontent.com/wiki/kitasuke/PagingMenuController/images/demo2.gif" width="284" height="160">

### Infinite mode with fixed item width

<img src="https://raw.githubusercontent.com/wiki/kitasuke/PagingMenuController/images/demo3.gif" width="160" height="284">

## Customization

### PagingMenuControllerCustomizable

* default page index to show as a first view
```Swift
defaultPage: Int
```

* duration for paging view animation
```Swift
animationDuration: TimeInterval
```

* isScrollEnabled for paging view. **Set false in case of using swipe-to-delete on your table view**
```swift
isScrollEnabled: Bool
```

* background color for paging view
```Swift
backgroundColor: UIColor
```

* number of lazy loading pages
```swift
lazyLoadingPage: LazyLoadingPage
public enum LazyLoadingPage {
    case one // Currently sets false to isScrollEnabled at this moment. Should be fixed in the future.
    case three
    case all // Currently not available for Infinite mode
}
```

* a set of menu controller
```swift
menuControllerSet: MenuControllerSet
public enum MenuControllerSet {
        case single
        case multiple
    }
```

* component type of PagingMenuController
```swift
componentType: ComponentType
public enum ComponentType {
    case menuView(menuOptions: MenuViewCustomizable)
    case pagingController(pagingControllers: [UIViewController])
    case all(menuOptions: MenuViewCustomizable, pagingControllers: [UIViewController])
}
```

### MenuViewCustomizable

* background color for menu view
```Swift
backgroundColor: UIColor
```

* background color for selected menu item
```Swift
selectedBackgroundColor: UIColor
```

* height for menu view
```Swift
height: CGFloat
```

* duration for menu view animation
```Swift
animationDuration: TimeInterval
```

* decelerating rate for menu view
```swift
deceleratingRate: CGFloat
```

* menu item position
```swift
menuSelectedItemCenter: Bool
```

* menu mode and scrolling mode

```swift
displayMode: MenuDisplayMode

public enum MenuDisplayMode {
    case standard(widthMode: MenuItemWidthMode, centerItem: Bool, scrollingMode: MenuScrollingMode)
    case segmentedControl
    case infinite(widthMode: MenuItemWidthMode, scrollingMode: MenuScrollingMode) // Requires three paging views at least
}

public enum MenuItemWidthMode {
    case flexible
    case fixed(width: CGFloat)
}

public enum MenuScrollingMode {
  case scrollEnabled
  case scrollEnabledAndBouces
  case pagingEnabled
}
```

if `centerItem` is true, selected menu item is always on center

if `MenuScrollingMode` is `ScrollEnabled` or `ScrollEnabledAndBouces`, menu view allows scrolling to select any menu item
if `MenuScrollingMode` is `PagingEnabled`, menu item should be selected one by one

* menu item focus mode
```Swift
focusMode: MenuFocusMode
public enum MenuFocusMode {
    case none
    case underline(height: CGFloat, color: UIColor, horizontalPadding: CGFloat, verticalPadding: CGFloat)
    case roundRect(radius: CGFloat, horizontalPadding: CGFloat, verticalPadding: CGFloat, selectedColor: UIColor)
}
```

* dummy item view number for Infinite mode
```swift
dummyItemViewsSet: Int
```

* menu position

```swift
menuPosition: MenuPosition

public enum MenuPosition {
    case top
    case bottom
}
```

* divider image to display right aligned in each menu item  

```swift
dividerImage: UIImage?
```

### MenuItemViewCustomizable

* horizontal margin for menu item
```swift
horizontalMargin: CGFloat
```

* menu item mode
```swift
displayMode: MenuItemDisplayMode
public enum MenuItemDisplayMode {
    case text(title: MenuItemText)
    case multilineText(title: MenuItemText, description: MenuItemText)
    case image(image: UIImage, selectedImage: UIImage?)
    case custom(view: UIView)
}
```

## Usage

`import PagingMenuController` to use PagingMenuController in your file.

### Using Storyboard

```Swift
struct MenuItem1: MenuItemViewCustomizable {}
struct MenuItem2: MenuItemViewCustomizable {}

struct MenuOptions: MenuViewCustomizable {
    var itemsOptions: [MenuItemViewCustomizable] {
        return [MenuItem1(), MenuItem2()]
    }
}

struct PagingMenuOptions: PagingMenuControllerCustomizable {
    var componentType: ComponentType {
        return .all(menuOptions: MenuOptions(), pagingControllers: [UIViewController(), UIViewController()])
    }
}

let pagingMenuController = self.childViewControllers.first as! PagingMenuController
pagingMenuController.setup(options)
pagingMenuController.onMove = { state in
    switch state {
    case let .willMoveController(menuController, previousMenuController):
        print(previousMenuController)
        print(menuController)
    case let .didMoveController(menuController, previousMenuController):
        print(previousMenuController)
        print(menuController)
    case let .willMoveItem(menuItemView, previousMenuItemView):
        print(previousMenuItemView)
        print(menuItemView)
    case let .didMoveItem(menuItemView, previousMenuItemView):
        print(previousMenuItemView)
        print(menuItemView)
    case .didScrollStart:
        print("Scroll start")
    case .didScrollEnd:
        print("Scroll end")
    }
}
```
* You should add `ContainerView` into your view controller's view and set `PagingMenuController` as the embedded view controller's class

See `PagingMenuControllerDemo` target in demo project for more details

### Coding only
```Swift
struct MenuItem1: MenuItemViewCustomizable {}
struct MenuItem2: MenuItemViewCustomizable {}

struct MenuOptions: MenuViewCustomizable {
    var itemsOptions: [MenuItemViewCustomizable] {
        return [MenuItem1(), MenuItem2()]
    }
}

struct PagingMenuOptions: PagingMenuControllerCustomizable {
    var componentType: ComponentType {
        return .all(menuOptions: MenuOptions(), pagingControllers: [UIViewController(), UIViewController()])
    }
}

let options = PagingMenuOptions()
let pagingMenuController = PagingMenuController(options: options)

addChildViewController(pagingMenuController)
view.addSubview(pagingMenuController.view)
pagingMenuController.didMove(toParentViewController: self)
```

See `PagingMenuControllerDemo2` target in demo project for more details

### Menu move handler (optional)

```Swift
public enum MenuMoveState {
    case willMoveController(to: UIViewController, from: UIViewController)
    case didMoveController(to: UIViewController, from: UIViewController)
    case willMoveItem(to: MenuItemView, from: MenuItemView)
    case didMoveItem(to: MenuItemView, from: MenuItemView)
    case didScrollStart
    case didScrollEnd
}

pagingMenuController.onMove = { state in
    switch state {
    case let .willMoveController(menuController, previousMenuController):
        print(previousMenuController)
        print(menuController)
    case let .didMoveController(menuController, previousMenuController):
        print(previousMenuController)
        print(menuController)
    case let .willMoveItem(menuItemView, previousMenuItemView):
        print(previousMenuItemView)
        print(menuItemView)
    case let .didMoveItem(menuItemView, previousMenuItemView):
        print(previousMenuItemView)
        print(menuItemView)
    case .didScrollStart:
        print("Scroll start")
    case .didScrollEnd:
        print("Scroll end")
    }
}
```

### Moving to a menu tag programmatically

```swift
// if you pass a nonexistent page number, it'll be ignored
pagingMenuController.move(toPage: 1, animated: true)
```

### Changing PagingMenuController's option

Call `setup` method with new options again.
It creates a new paging menu controller. Do not forget to cleanup properties in child view controller.

## Requirements

iOS9+  
Swift 3.0+  
Xcode 8.0+

[v1.4.0](https://github.com/kitasuke/PagingMenuController/releases/tag/1.4.0) for iOS 8 in Swift 3.0  
[v1.2.0](https://github.com/kitasuke/PagingMenuController/releases/tag/1.2.0) for iOS 8 in Swift 2.3

## Installation

### Swift Package Manager

Add PagingMenuController as a package dependency in Xcode using:

```
https://github.com/kitasuke/PagingMenuController.git
```

Or add it to your `Package.swift`:

```swift
.package(url: "https://github.com/kitasuke/PagingMenuController.git", from: "2.3.1")
```

### Manual

Copy all the files in `Sources/PagingMenuController` directory into your project.

## Example

Open `Example/PagingMenuControllerDemo.xcodeproj`, then select the `PagingMenuControllerDemo` or `PagingMenuControllerDemo2` scheme before running on a simulator.

## License

PagingMenuController is available under the MIT license. See the [LICENSE](https://github.com/kitasuke/PagingMenuController/blob/master/LICENSE) file for more info.
