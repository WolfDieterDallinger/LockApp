//
//  View+unlockWithoutAuthenticationIfPasswordNotSet().swift
//  LockPackage
//
//  Created by Wolf Dieter Dallinger on 30.05.22.
//  Copyright © 2022 Wolf Dieter Dallinger. All rights reserved.
//

import SwiftUI

struct UnlockWithoutAuthenticationIfPasswordNotSet: ViewModifier {
    func body(content: Content) -> some View {
        content
            .environment(\.unlockWithoutAuthenticationIfPasswordNotSet, true)
    }
}

public extension View {
    /// A `View` method to control the `LockButton`.
    ///
    /// If no password is set the `LockButton` denies to unlock for security reasons. Use the `View` method `unlockWithoutAuthenticationIfPasswordNotSet()` to allow this button to unlock in this case without authentication.
    func unlockWithoutAuthenticationIfPasswordNotSet() -> some View {
        modifier(UnlockWithoutAuthenticationIfPasswordNotSet())
    }
}
