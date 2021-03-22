//
//  Audio+CoreDataProperties.swift
//  HCPracticeSwiftUI
//
//  Created by Anton Gubarenko on 04.03.2021.
//
//

import Foundation
import CoreData


extension Audio {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Audio> {
        return NSFetchRequest<Audio>(entityName: "Audio")
    }

    @NSManaged public var id: Int64
    @NSManaged public var type: String?
    @NSManaged public var title: String?
    @NSManaged public var length: String?
    @NSManaged public var url: String?

}

extension Audio : Identifiable {

}
