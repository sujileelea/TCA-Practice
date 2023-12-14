//
//  CounterDemoView.swift
//  TCA-Practice
//
//  Created by Suji Lee on 12/14/23.
//

import SwiftUI
import ComposableArchitecture

private let readMe: String = """
  This screen demonstrates the basics of the Composable Architecture in an archetypal counter application.

  The domain of the application is modeled using simple data types that correspond to the mutable state of the application and any actions that can affect that state or the outside world.
"""

// MARK: - Feature domain

@Reducer
struct Counter {
    
    struct State: Equatable {
        var count = 0
    }
    
    enum Action {
        case decrementButtonTapped
        case incrementButtonTapped
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .decrementButtonTapped:
                state.count -= 1
                return .none
            case .incrementButtonTapped:
                state.count += 1
                return .none
            }
        }
    }
}

// MARK: - Feature View

struct CounterView: View {
    
    let store: StoreOf<Counter>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            HStack(spacing: 30) {
                // 뺄셈 버튼
                Button(action: {
                    viewStore.send(.decrementButtonTapped)
                }, label: {
                    Image(systemName: "minus")
                })
                //표시될 숫자
                Text ("\(viewStore.state.count)")
                    .monospacedDigit()
                // 덧셈 버튼
                Button(action: {
                    viewStore.send(.incrementButtonTapped)
                }, label: {
                    Image(systemName: "plus")
                })
            }
        }
    }
}

// MARK: - 전체 페이지

struct CounterDemoView: View {
    
    @State var store = Store(initialState: Counter.State()) {
        Counter()
    }
    
    var body: some View {
        Form {
          Section {
            AboutView(readMe: readMe)
          }
          Section {
            CounterView(store: self.store)
              .frame(maxWidth: .infinity)
          }
        }
        .buttonStyle(.borderless)
        .navigationTitle("Counter demo")
    }
}

#Preview {
    CounterDemoView(store: Store(initialState: Counter.State(), reducer: {
        Counter()
    }))
}
