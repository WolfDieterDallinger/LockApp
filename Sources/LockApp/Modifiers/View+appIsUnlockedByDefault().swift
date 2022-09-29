//
//  View+appIsUnlockedByDefault().swift
//  LockApp
//
//  Created by Wolf Dieter Dallinger on 30.05.22.
//  Copyright © 2022 Wolf Dieter Dallinger. All rights reserved.
//

import SwiftUI

struct AppIsUnlockedByDefault: ViewModifier {
    func body(content: Content) -> some View {
        content
            .environment(\.appIsLockedByDefault, false)
    }
}

public extension View {
    /// The app is unlocked by default.
    ///
    /// For security reasons the app is locked by default. Use this `View` method to make the app being unlock the app on its first start.
    func appIsUnlockedByDefault() -> some View {
        modifier(AppIsUnlockedByDefault())
    }
}
