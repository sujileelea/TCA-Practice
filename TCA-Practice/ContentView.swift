//
//  ContentView.swift
//  TCA-Practice
//
//  Created by Suji Lee on 12/14/23.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
        
    @State var isNavigationStackPresented = false
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    NavigationLink("Basics") {
                        CounterDemoView()
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
