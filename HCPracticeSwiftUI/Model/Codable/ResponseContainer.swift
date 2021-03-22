//
//  ResponseContainer.swift
//  HCPracticeSwiftUI
//
//  Created by Anton Gubarenko on 04.03.2021.
//

import Foundation

struct ResponseContainer<T: Decodable>: Decodable {
    let success: Bool
    let status: Int
    let message: String
    let data: T
}
