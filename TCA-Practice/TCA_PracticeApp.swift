//
//  TCA_PracticeApp.swift
//  TCA-Practice
//
//  Created by Suji Lee on 12/14/23.
//

import SwiftUI
import ComposableArchitecture

@main
struct MyApp: App {
    
  static let store = Store(initialState: CounterFeature.State()) {
      
    CounterFeature()
          ._printChanges()
  }

  var body: some Scene {
    WindowGroup {
      CounterView(store: MyApp.store)
    }
  }
}
