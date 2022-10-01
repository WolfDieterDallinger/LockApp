//
//  DetailView.swift
//  LockAppTest
//
//  Created by Wolf Dieter Dallinger on 20.06.22.
//

import LockApp
import SwiftUI

struct DetailView: View {
    @AppIsLocked private var appIsLocked
    let title: String
    
    var body: some View {
        Form {
            Text(appIsLocked ? "This app is locked." : "This app is unlocked.")
            Text("This text is only shown if the app is unlocked.")
                .ifAppIsUnlocked()
        }
        .navigationTitle(Text(title))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                LockAppButton()
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(title: "Standard")
    }
}
