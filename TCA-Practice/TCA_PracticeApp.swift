//
//  TCA_PracticeApp.swift
//  TCA-Practice
//
//  Created by Suji Lee on 12/14/23.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCA_PracticeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(store: Store(initialState: Feature.State(), reducer: {
                Feature()
            }))
        }
    }
}
