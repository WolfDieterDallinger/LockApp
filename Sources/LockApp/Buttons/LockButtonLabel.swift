//
//  LockButtonLabel.swift
//  LockPackage
//
//  Created by Wolf Dieter Dallinger on 04.06.22.
//  Copyright © 2022 Wolf Dieter Dallinger. All rights reserved.
//

import SwiftUI

struct LockButtonLabel: View {
    @IsLocked private var isLocked

    var body: some View {
        Label(
            String(localized: isLocked ? "LockButton:Locked" : "LockButton:Unlocked", bundle: .module),
            systemImage: isLocked ? "lock" : "lock.open"
        )
    }
}

struct LockButtonLabel_Previews: PreviewProvider {
    static var previews: some View {
        LockButtonLabel()
    }
}
