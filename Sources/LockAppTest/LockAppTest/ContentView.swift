//
//  ContentView.swift
//  LockAppTest
//
//  Created by Wolf Dieter Dallinger on 20.06.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text(try! AttributedString(markdown: "Test app for the Swift framework LockApp in the package [LockApp](https://github.com/WolfDieterDallinger/LockApp)."))
                    Text("Press the LockAppButton in the upper right corner of the detail views to change the value of the dynamic property appIsLocked.")
                } header: {
                    Text("Information")
                }
                
                Section {
                    NavigationLink("Standard") {
                        DetailView(title: "Standard")
                    }
                }
                
                Section {
                    NavigationLink(".appIsUnlockedByDefault()") {
                        DetailView(title: ".appIsUnlockedByDefault()")
                            .appIsUnlockedByDefault()
                    }
                } footer: {
                    Text("The default value is returned as the value of the dynamic property as long as the persistent value in the UserDefaults is nil. If you set the dynamic property e. g. with the LockAppButton the persistent value in the UserDefaults no longer is nil. The app is locked by default to be secure by design. You can override this behaviour by applying appIsUnlockedByDefault() to a View. The chosen default value should be static for an app so apply this high enough in the View tree.")
                }
                
                Section {
                    NavigationLink(".unlockAppWithoutAuthentication()") {
                        DetailView(title: ".unlockAppWithoutAuthentication()")
                            .unlockAppWithoutAuthentication()
                    }
                }
                
                Section {
                    NavigationLink(".unlockAppWithoutAuthenticationIfPasswordNotSet()") {
                        DetailView(title: ".unlockAppWithoutAuthenticationIfPasswordNotSet()")
                            .unlockAppWithoutAuthenticationIfPasswordNotSet()
                    }
                }
            }
            .navigationTitle("LockAppTest")
        }
        //.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

