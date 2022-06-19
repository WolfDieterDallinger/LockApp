//
//  View+unlockOnFirstStart.swift
//  LockPackage
//
//  Created by Wolf Dieter Dallinger on 30.05.22.
//  Copyright © 2022 Wolf Dieter Dallinger. All rights reserved.
//

import SwiftUI

struct UnlockOnFirstStart: ViewModifier {
    func body(content: Content) -> some View {
        content
            .environment(\.isLockedDefault, false)
    }
}

public extension View {
    /// Unlocks the app on its first start.
    ///
    /// For security reasons the app is locked on its first start. Use this `View` method to unlock the app on its first start.
    func unlockOnFirstStart() -> some View {
        modifier(UnlockOnFirstStart())
    }
}
