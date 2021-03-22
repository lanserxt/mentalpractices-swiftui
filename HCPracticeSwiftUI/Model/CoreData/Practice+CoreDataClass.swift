//
//  Practice+CoreDataClass.swift
//  HCPracticeSwiftUI
//
//  Created by Anton Gubarenko on 04.03.2021.
//
//

import Foundation
import CoreData

extension CodingUserInfoKey {
  static let managedObjectContext = CodingUserInfoKey(rawValue: "managedObjectContext")!
}

enum DecoderConfigurationError: Error {
  case missingManagedObjectContext
}


@objc(Practice)
public class Practice: NSManagedObject, Decodable {
    enum CodingKeys: CodingKey {
        case id, title, subtitle, icon, audio
     }

    required convenience public init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
          throw DecoderConfigurationError.missingManagedObjectContext
        }

        self.init(context: context)

        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int64.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.subtitle = try container.decode(String.self, forKey: .subtitle)
        self.icon = try container.decode(Icon.self, forKey: .icon)
        self.audio = try container.decode(Audio.self, forKey: .audio)
      }
}

extension Practice {
    class func uiSample() -> Practice {
        let practice = Practice()
        practice.title = "Practice Smaple"
        practice.subtitle = "Details with some large text"
        return practice
    }
}
