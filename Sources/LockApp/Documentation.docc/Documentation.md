# ``LockApp``

A Swift modul to lock and unlock an app using `SwiftUI`.

## Overview

This modul enables:

- A persisting app property meaning whether your app is locked or unlocked.
- Access to this property with the property wrappers `IsLocked` and `IsUnlocked`.
- A lock button to lock and unlock your app using the system dialogue for authentication.
- View modifiers for customization.
- Security by design.

### Dynamic Properties

Use the property wrappers ``IsLocked`` and ``IsUnlocked`` to create dynamic properties and access the lock mode with the type `Bool`. Default value is locked (secure by design).

```swift
struct MyView: View {
    @IsLocked private var isLocked
    
    var body: some View {
        Text(isLocked ? "This app is locked." : "This app is unlocked.")
    }
}
```

To use unlocked as default value use the `View` method `isUnlockedByDefault()`. This behaviour should stay the same for the whole app so apply it high enough in the view hirarchy.

```swift
MyView()
    .isUnlockedByDefault()
```

> Note: As of July 2022 DocC does not handle extensions to external symbols so `isUnlockedByDefault()` is not properly included in this documentation, but you can access the documentation using quick help (right click on symbol > show quick help).

### LockButton

Use the `LockButton` for the user to lock and unlock. To unlock the `LockButton` prompts the user the system dialogue for authentication, i. e. password, TouchID or FaceID.

```swift
struct MyView: View {
    var body: some View {
        LockButton()
    }
}
```

If no password is set, the `LockButton` does not unlock (secure by design). You can change this with the `View` method `unlockWithoutAuthenticationIfPasswordNotSet()`. This behaviour should stay the same for the whole app so apply it high enough in the view hirarchy.

```swift
MyView()
    .unlockWithoutAuthenticationIfPasswordNotSet()
```
        
The `LockButton` unlocks without password prompt if the `View` method `unlockWithoutAuthentication()` is applied. This behaviour should stay the same for the whole app so apply it high enough in the view hirarchy.

```swift
MyView()
    .unlockWithoutAuthentication()
```
     
> Note: As of July 2022 DocC does not handle extensions to external symbols so `unlockWithoutAuthentication()` and `unlockWithoutAuthenticationIfPasswordNotSet()` are not properly included in this documentation, but you can access the documentation using quick help (right click on symbol > show quick help).

### Access to the app property

Use the modul constant ``isLockedAppStorageKey`` or its value as key to access the isLocked property via [`AppStorage`](https://developer.apple.com/documentation/swiftui/appstorage/) or [`UserDefaults`](https://developer.apple.com/documentation/foundation/userdefaults). The value will not change in future versions.

This allows you to set and get the value in the app preferences.

### Localization

This modul is localized for:

* English (default localization)
* German

Feel free to help localizing it to more languages if this modul suits your needs.

## Topics

### Propert Wrappers and Default Value

- ``IsLocked``
- ``IsUnlocked``
- ``isUnlockedByDefault()``

### Lock Button

- ``LockButton``
- ``unlockWithoutAuthenticationIfPasswordNotSet()``
- ``unlockWithoutAuthentication()``

### App Storage Key

- ``isLockedAppStorageKey``
