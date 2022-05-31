//
//  HomeReactor.swift
//  TextArea
//
//  Created by 김민창 on 2022/05/26.
//

import Foundation

import ReactorKit

final class HomeViewReactor: Reactor {
    enum Action {
        
    }
    
    enum Mutation {
        case setSections([HomeListSection])
    }
    
    struct State {
        var isCollection: Bool
        var sections: [HomeListSection]
    }
    
    let initialState: State
    
    init() {
        self.initialState = State(
            isCollection: false,
            sections: [
                HomeListSection(
                    items: [
                        HomeCellModel.Table(data: HomeModel(identity: UUID(), name: "Test1", fileType: .folder)),
                        HomeCellModel.Table(data: HomeModel(identity: UUID(), name: "Test2", fileType: .folder)),
                        HomeCellModel.Table(data: HomeModel(identity: UUID(), name: "Test3", fileType: .folder)),
                        HomeCellModel.Table(data: HomeModel(identity: UUID(), name: "Test4", fileType: .folder))
                    ],
                    identity: UUID()
                ),
                HomeListSection(
                    items: [
                        HomeCellModel.Table(data: HomeModel(identity: UUID(), name: "Test1", fileType: .file)),
                        HomeCellModel.Table(data: HomeModel(identity: UUID(), name: "Test2", fileType: .file)),
                        HomeCellModel.Table(data: HomeModel(identity: UUID(), name: "Test3", fileType: .file)),
                        HomeCellModel.Table(data: HomeModel(identity: UUID(), name: "Test4", fileType: .file))
                    ],
                    identity: UUID()
                )
            ]
        )
    }
    
    // MARK: Action -> Mutation
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {

        }
    }
    
    // MARK: Mutation -> Mutation
//    func transform(mutation: Observable<Mutation>) -> Observable<Mutation> {
//
//    }

    
    // MARK: Mutation -> State
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
        case let .setSections(sections):
            state.sections = sections
            return state
        }
    }
}
