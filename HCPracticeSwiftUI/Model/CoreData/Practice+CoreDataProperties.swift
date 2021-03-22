//
//  Practice+CoreDataProperties.swift
//  HCPracticeSwiftUI
//
//  Created by Anton Gubarenko on 04.03.2021.
//
//

import Foundation
import CoreData


extension Practice {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Practice> {
        return NSFetchRequest<Practice>(entityName: "Practice")
    }

    @NSManaged public var id: Int64
    @NSManaged public var title: String?
    @NSManaged public var subtitle: String?
    @NSManaged public var icon: Icon?
    @NSManaged public var audio: Audio?

}

extension Practice : Identifiable {

}

extension Practice : Codable {

}
