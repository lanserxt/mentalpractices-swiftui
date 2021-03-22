//
//  Icon+CoreDataClass.swift
//  HCPracticeSwiftUI
//
//  Created by Anton Gubarenko on 04.03.2021.
//
//

import Foundation
import CoreData

@objc(Icon)
public class Icon: NSManagedObject, Decodable {
    enum CodingKeys: CodingKey {
        case id, type, title, url
     }

    required convenience public init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
          throw DecoderConfigurationError.missingManagedObjectContext
        }

        self.init(context: context)

        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int64.self, forKey: .id)
        self.type = try container.decode(String.self, forKey: .type)
        self.title = try container.decode(String.self, forKey: .title)
        self.url = try container.decode(String.self, forKey: .url)
      }
}
