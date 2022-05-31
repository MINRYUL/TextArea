//
//  ItemMO+CoreDataProperties.swift
//  TextArea
//
//  Created by 김민창 on 2022/05/31.
//
//

import Foundation
import CoreData


extension ItemMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemMO> {
        return NSFetchRequest<ItemMO>(entityName: "Item")
    }

    @NSManaged public var data: String?
    @NSManaged public var name: String?
    @NSManaged public var document: DocumentMO?

}

extension ItemMO : Identifiable {

}
