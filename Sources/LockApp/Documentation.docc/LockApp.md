# ``LockApp``

A Swift framework to lock and unlock an app using `SwiftUI`.

## Overview

This framework enables:

- A persisting dynamic property meaning whether your app is locked or unlocked.
- Access to this property with the PropertyWrapper ``AppIsLocked``.
- A lock button to lock and unlock your app using the system dialogue for authentication.
- View modifiers for customization.
- Security by design.

### Dynamic Properties

Use the PropertyWrapper ``AppIsLocked`` to create dynamic properties and access the lock mode with the type `Bool`. Default value is locked (secure by design).

```swift
struct MyView: View {
    @AppIsLocked private var appIsLocked
    
    var body: some View {
        Text(appIsLocked ? "App is locked." : "App is unlocked.")
    }
}
```

To use unlocked as default value use the `View` method `appIsUnlockedByDefault()`. This behaviour should stay the same for the whole app so apply it high enough in the view hirarchy.

```swift
MyView()
    .appIsUnlockedByDefault()
```

> Note: As of October 2022 DocC does not handle extensions to external symbols so ``appIsUnlockedByDefault()`` is not properly included in this documentation. But you can access the documentation using quick help (right click on symbol > show quick help).

### LockAppButton

Use the ``LockAppButton`` for the user to lock and unlock. To unlock the ``LockAppButton`` prompts the user the system dialogue for authentication, i. e. password, TouchID or FaceID.

```swift
struct MyView: View {
    var body: some View {
        LockAppButton()
    }
}
```

If no password is set, the ``LockAppButton`` does not unlock (secure by design). You can change this with the `View` method ``unlockAppWithoutAuthenticationIfPasswordNotSet()``. This behaviour should stay the same for the whole app so apply it high enough in the view hirarchy.

```swift
MyView()
    .unlockAppWithoutAuthenticationIfPasswordNotSet()
```
        
The ``LockAppButton`` unlocks without password prompt if the `View` method ``unlockAppWithoutAuthentication()`` is applied. This behaviour should stay the same for the whole app so apply it high enough in the view hirarchy.

```swift
MyView()
    .unlockAppWithoutAuthentication()
```
     
> Note: As of October 2022 DocC does not handle extensions to external symbols so ``unlockAppWithoutAuthentication()`` and ``unlockAppWithoutAuthenticationIfPasswordNotSet()`` are not properly included in this documentation. But you can access the documentation using quick help (right click on symbol > show quick help).

### Convenience ViewMofifiers and View extensions

The View extensions ``ìfAppIsUnlocked()`` shows the `View` if and only if the app is unlocked.

> Note: As of October 2022 DocC does not handle extensions to external symbols so ``ìfAppIsUnlocked()`` is not properly included in this documentation. But you can access the documentation using quick help (right click on symbol > show quick help).

### Access to the app property

Use the framework constant ``appIsLockedAppStorageKey`` or its value as key to access the appIsLocked property via [`AppStorage`](https://developer.apple.com/documentation/swiftui/appstorage/) or [`UserDefaults`](https://developer.apple.com/documentation/foundation/userdefaults). This value will not change in future versions.

This allows you to set and get the value in the app preferences.

### Localization

This modul is localized for:

* English (default localization)
* German

Feel free to help localizing it to more languages if this framework suits your needs.

## Topics

### Propert Wrappers and Default Value

- ``AppIsLocked``
- ``isUnlockedByDefault()``

### Lock Button

- ``LockAppButton``
- ``unlockAppWithoutAuthenticationIfPasswordNotSet()``
- ``unlockAppWithoutAuthentication()``

### Convenience ViewMofifiers and View extensions

- ``ìfAppIsUnlocked()``

### App Storage Key

- ``appIsLockedAppStorageKey``
