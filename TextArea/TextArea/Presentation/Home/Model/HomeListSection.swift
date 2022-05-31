//
//  HomeCellModel.swift
//  TextArea
//
//  Created by 김민창 on 2022/05/31.
//

import Foundation

import RxDataSources

struct HomeModel {
    enum FileType {
        case folder, file
    }
    
    var identity: UUID
    
    let name: String
    let fileType: FileType
}

struct HomeListSection {
    var items: [HomeCellModel]
    var identity: UUID
}

enum HomeCellModel: IdentifiableType, Equatable {
    typealias Identity = UUID
    
    case Table(data: HomeModel)
    case Collection(data: HomeModel)
    
    var identity: Identity {
        switch self {
        case .Table(let data):
            return data.identity
        case .Collection(let data):
            return data.identity
        }
    }
    
    static func == (lhs: HomeCellModel, rhs: HomeCellModel) -> Bool {
        return lhs.identity == rhs.identity
    }
}


extension HomeListSection: AnimatableSectionModelType {
    init(original: HomeListSection, items: [HomeCellModel]) {
        self = original
        self.items = items
    }
}
