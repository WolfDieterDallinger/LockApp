//
//  AppIsUnlockedByDefault().swift
//  LockApp
//
//  Created by Wolf Dieter Dallinger on 30.05.22.
//  Copyright © 2022 Wolf Dieter Dallinger. All rights reserved.
//

import SwiftUI

fileprivate struct MyEnvironmentKey: EnvironmentKey {
    static var defaultValue = true
}

extension EnvironmentValues {
    // Property is used by AppIsLocked, too.
    var appIsLockedByDefault: Bool {
        get { self[MyEnvironmentKey.self] }
        set { self[MyEnvironmentKey.self] = newValue }
    }
}

fileprivate struct AppIsUnlockedByDefault: ViewModifier {
    func body(content: Content) -> some View {
        content
            .environment(\.appIsLockedByDefault, false)
    }
}

public extension View {
    /**
     A `View` method to customize the app to be unlocked by default.
     
     For security reasons the app is locked by default. Use this `View` method high enough in the view hierarchy to customize the app to be unlocked by default.
     
     ```swift
     MyView()
         .appIsUnlockedByDefault()
     ```
     */
    func appIsUnlockedByDefault() -> some View {
        modifier(AppIsUnlockedByDefault())
    }
}
