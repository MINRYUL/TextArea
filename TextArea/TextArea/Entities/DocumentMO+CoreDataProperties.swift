//
//  DocumentMO+CoreDataProperties.swift
//  TextArea
//
//  Created by 김민창 on 2022/05/31.
//
//

import Foundation
import CoreData


extension DocumentMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DocumentMO> {
        return NSFetchRequest<DocumentMO>(entityName: "Document")
    }

    @NSManaged public var name: String?
    @NSManaged public var paranet: UUID?
    @NSManaged public var children: NSOrderedSet?
    @NSManaged public var items: NSOrderedSet?

}

// MARK: Generated accessors for children
extension DocumentMO {

    @objc(insertObject:inChildrenAtIndex:)
    @NSManaged public func insertIntoChildren(_ value: DocumentMO, at idx: Int)

    @objc(removeObjectFromChildrenAtIndex:)
    @NSManaged public func removeFromChildren(at idx: Int)

    @objc(insertChildren:atIndexes:)
    @NSManaged public func insertIntoChildren(_ values: [DocumentMO], at indexes: NSIndexSet)

    @objc(removeChildrenAtIndexes:)
    @NSManaged public func removeFromChildren(at indexes: NSIndexSet)

    @objc(replaceObjectInChildrenAtIndex:withObject:)
    @NSManaged public func replaceChildren(at idx: Int, with value: DocumentMO)

    @objc(replaceChildrenAtIndexes:withChildren:)
    @NSManaged public func replaceChildren(at indexes: NSIndexSet, with values: [DocumentMO])

    @objc(addChildrenObject:)
    @NSManaged public func addToChildren(_ value: DocumentMO)

    @objc(removeChildrenObject:)
    @NSManaged public func removeFromChildren(_ value: DocumentMO)

    @objc(addChildren:)
    @NSManaged public func addToChildren(_ values: NSOrderedSet)

    @objc(removeChildren:)
    @NSManaged public func removeFromChildren(_ values: NSOrderedSet)

}

// MARK: Generated accessors for items
extension DocumentMO {

    @objc(insertObject:inItemsAtIndex:)
    @NSManaged public func insertIntoItems(_ value: ItemMO, at idx: Int)

    @objc(removeObjectFromItemsAtIndex:)
    @NSManaged public func removeFromItems(at idx: Int)

    @objc(insertItems:atIndexes:)
    @NSManaged public func insertIntoItems(_ values: [ItemMO], at indexes: NSIndexSet)

    @objc(removeItemsAtIndexes:)
    @NSManaged public func removeFromItems(at indexes: NSIndexSet)

    @objc(replaceObjectInItemsAtIndex:withObject:)
    @NSManaged public func replaceItems(at idx: Int, with value: ItemMO)

    @objc(replaceItemsAtIndexes:withItems:)
    @NSManaged public func replaceItems(at indexes: NSIndexSet, with values: [ItemMO])

    @objc(addItemsObject:)
    @NSManaged public func addToItems(_ value: ItemMO)

    @objc(removeItemsObject:)
    @NSManaged public func removeFromItems(_ value: ItemMO)

    @objc(addItems:)
    @NSManaged public func addToItems(_ values: NSOrderedSet)

    @objc(removeItems:)
    @NSManaged public func removeFromItems(_ values: NSOrderedSet)

}

extension DocumentMO : Identifiable {

}
