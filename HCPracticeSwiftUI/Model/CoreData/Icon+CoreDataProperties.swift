//
//  Icon+CoreDataProperties.swift
//  HCPracticeSwiftUI
//
//  Created by Anton Gubarenko on 04.03.2021.
//
//

import Foundation
import CoreData


extension Icon {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Icon> {
        return NSFetchRequest<Icon>(entityName: "Icon")
    }

    @NSManaged public var id: Int64
    @NSManaged public var type: String?
    @NSManaged public var title: String?
    @NSManaged public var url: String?

}

extension Icon : Identifiable {

}
