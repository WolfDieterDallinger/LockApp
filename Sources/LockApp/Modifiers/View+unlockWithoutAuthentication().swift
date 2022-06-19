//
//  View+unlockWithoutAuthentication().swift
//  LockApp
//
//  Created by Wolf Dieter Dallinger on 31.05.22.
//  Copyright © 2022 Wolf Dieter Dallinger. All rights reserved.
//

import SwiftUI

struct UnlockWithoutAuthentication: ViewModifier {
    func body(content: Content) -> some View {
        content
            .environment(\.unlockWithoutAuthentication, true)
    }
}

public extension View {
    /// A `View` method to control the `LockButton`.
    ///
    /// Use the `View` method `unlockWithoutAuthentication()`to allow the `LockButton` to unlock without authentication regardless whether a password is set or not.
    func unlockWithoutAuthentication() -> some View {
        modifier(UnlockWithoutAuthentication())
    }
}
