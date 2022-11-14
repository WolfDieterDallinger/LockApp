# ``LockApp``

A Swift framework to lock and unlock an app using `SwiftUI`.

## Overview

This framework offers:

- A [property wrapper](https://docs.swift.org/swift-book/LanguageGuide/Properties.html#ID617) for a dynamic property to access a persistently stored state whether an app is locked or not.
- A button to lock and unlock an app using user authentication.
- `ViewModifier`s for customization.
- Convenience `ViewModifier`s.
- `AppStorage` Key.
- Localization.
- Security by design.

This framework is part of a swift package which can be found [here](https://github.com/WolfDieterDallinger/LockApp).

### Property Wrapper AppIsLocked

``AppIsLocked`` is a [property wrapper](https://docs.swift.org/swift-book/LanguageGuide/Properties.html#ID617) for a dynamic property to access a persistently stored state whether an app is locked or not.

```swift
struct MyView: View {
    @AppIsLocked private var appIsLocked

    var body: some View {
        Text(appIsLocked ? "This app is locked." : "This app is unlocked.")
    }
}
```

For security reasons the app is locked by default. Use the `View` method ``LockAppButton/appIsUnlockedByDefault()`` high enough in the view hierarchy to customize the app to be unlocked by default.

- Note: If you need a `Binding` with inverted boolean value use the operator ! from the Framework [BindingHelper](https://github.com/WolfDieterDallinger/BindingHelper).

### LockAppButton

``LockAppButton`` is a button to lock and unlock an app using user authentication.

To unlock the app this button uses the system dialog to authenticate the user with password, TouchID or FaceID.

```swift
struct MyView: View {
    var body: some View {
        LockAppButton()
    }
}
```

For security reasons this button does not unlock the app if the password is not set. Use the `View` method ``LockAppButton/unlockAppWithoutAuthenticationIfPasswordNotSet()`` high enough in the view hierarchy to customize this button to unlock the app without authentication if the password is not set.

For security reasons this button does only unlock the app with authentication. Use the `View` method ``LockAppButton/unlockAppWithoutAuthentication()`` high enough in the view hierarchy to customize this button to unlock the app without authentication.
     
### Convenience ViewModifiers

``LockAppButton/ifAppIsUnlocked()`` is a `View` method to show the `View` only if the app is unlocked.

```swift
MyView()
    .ifAppIsUnlocked()
```

### AppStorage Key

``appIsLockedAppStorageKey`` is a key for [`AppStorage`](https://developer.apple.com/documentation/swiftui/appstorage/)/[`UserDefaults`](https://developer.apple.com/documentation/foundation/userdefaults) to store persistently whether an app is locked or not.

You can use this key for the `Settings.bundle`. The value will not change in future versions.

### Localization

This framework is localized for:

* English (default localization)
* German

Feel free to help localizing it to more languages if this framework suits your needs.

## Topics

### Property Wrapper AppIsLocked

- ``AppIsLocked``
- ``LockAppButton/appIsUnlockedByDefault()``

### LockAppButton

- ``LockAppButton``
- ``LockAppButton/unlockAppWithoutAuthenticationIfPasswordNotSet()``
- ``LockAppButton/unlockAppWithoutAuthentication()``

### Convenience ViewModifiers

- ``LockAppButton/ifAppIsUnlocked()``

### AppStorage Key

- ``appIsLockedAppStorageKey``
