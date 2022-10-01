//
//  View+ifAppIsUnlocked().swift
//  LockApp
//
//  Created by Wolf Dieter Dallinger on 28.09.22.
//

import SwiftUI

struct IfAppIsUnlocked: ViewModifier {
    @AppIsLocked private var appIsLocked

    func body(content: Content) -> some View {
        if !appIsLocked {
            content
        }
    }
}

public extension View {
    /// Shows the `View` if and only if the app is unlocked.
    func ifAppIsUnlocked() -> some View {
        modifier(IfAppIsUnlocked())
    }
}
