//
//  Folder.swift
//  TextArea
//
//  Created by 김민창 on 2022/05/30.
//

import Foundation

struct Folder: Codable, Equatable {
    let name: String
    let identity: String
    let item: [String]?
    let paranetIdentity: String?
    let children: [Folder]?
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identity)
    }
    
    static func == (lhs: Folder, rhs: Folder) -> Bool {
        lhs.identity == rhs.identity
    }
}
