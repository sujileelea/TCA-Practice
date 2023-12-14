//
//  ContentView.swift
//  TCA-Practice
//
//  Created by Suji Lee on 12/14/23.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    
    let store: StoreOf<Feature>
    
    var body: some View {
        //WithViewStore의 content 클로저는 argument viewStore를 반환. viewStore로 State의 값을 참조한다.
       WithViewStore(store, observe: { $0 }, content: { viewStore in
           VStack {
               Text("\(viewStore.count)")
                   .font(.title)
               HStack {
                   Button("-") {
                       viewStore.send(.minusButtonTapped)
                   }
                   Button("+") {
                       viewStore.send(.plusButtonTapped)
                   }
               }
           }
           
       })
    }
}

#Preview {
    ContentView(store: Store(initialState: Feature.State(), reducer: {
        Feature()
    }))
}
