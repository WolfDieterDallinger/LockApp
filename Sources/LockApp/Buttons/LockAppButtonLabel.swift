//
//  LockAppButtonLabel.swift
//  LockApp
//
//  Created by Wolf Dieter Dallinger on 04.06.22.
//  Copyright © 2022 Wolf Dieter Dallinger. All rights reserved.
//

import SwiftUI

struct LockAppButtonLabel: View {
    @AppIsLocked private var appIsLocked

    var body: some View {
        Label(
            String(localized: appIsLocked ? "LockAppButton:Locked" : "LockAppButton:Unlocked", bundle: .module),
            systemImage: appIsLocked ? "lock" : "lock.open"
        )
    }
}

struct LockAppButtonLabel_Previews: PreviewProvider {
    static var previews: some View {
        LockAppButtonLabel()
    }
}
