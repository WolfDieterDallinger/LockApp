//
//  View+unlockAppWithoutAuthentication().swift
//  LockApp
//
//  Created by Wolf Dieter Dallinger on 31.05.22.
//  Copyright © 2022 Wolf Dieter Dallinger. All rights reserved.
//

import SwiftUI

struct UnlockAppWithoutAuthentication: ViewModifier {
    func body(content: Content) -> some View {
        content
            .environment(\.unlockAppWithoutAuthentication, true)
    }
}

public extension View {
    /// A `View` method to control the `LockButton`.
    ///
    /// Use this `View` method to allow the `LockButton` to unlock without authentication regardless whether a password is set or not.
    func unlockAppWithoutAuthentication() -> some View {
        modifier(UnlockAppWithoutAuthentication())
    }
}
