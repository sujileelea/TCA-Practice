//
//  Feature.swift
//  TCA-Practice
//
//  Created by Suji Lee on 12/14/23.
//

import ComposableArchitecture

// State: 로직을 수행하고 UI를 렌더링하는 데 필요한 데이터를 포함
// Action: 작업, 알림, 이벤트 등 기능에서 발생할 수 있는 모든 작업을 나열
// Reducer: 작업, 알림, 이벤트 등 기능을 수행하고, State를 변경하거나 API를 호출하는 작업을 수행
// Store: 실제로 Feature를 구동하는 런타임

struct Feature: Reducer {
    //데이터를 저장할 변수
    //평상시 @State로 감싸던 변수
    struct State: Equatable {
        var count: Int = 0
    }
    
    enum Action: Equatable {
        case plusButtonTapped
        case minusButtonTapped
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .plusButtonTapped:
            state.count += 1
            return .none
        case .minusButtonTapped:
            state.count -= 1
            return .none
        }
    }
}
