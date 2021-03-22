//
//  APIManager.swift
//  HCPracticeSwiftUI
//
//  Created by Anton Gubarenko on 04.03.2021.
//

import Foundation
import CoreData
import Combine

enum HTTPMethod: String {
    case get, post, put, delete, patch
}

typealias UserData = ResponseContainer<User>
typealias PracticesData = ResponseArrayContainer<Practice>

final class APIManager {
    
    init(viewContext: NSManagedObjectContext) {
        self.viewContext = viewContext
    }
    private var viewContext: NSManagedObjectContext
    
    //MARK:- General Request
    
    private let timeoutInterval = 60.0
    
    func makeRequest<T: Decodable>(url: String, httpMethod: HTTPMethod, typeOf: T.Type) -> AnyPublisher<T, NetworkError> {
        
        var request = URLRequest(url: URL(string: url, relativeTo: nil)!)
        request.httpMethod = httpMethod.rawValue.uppercased()
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(Constants.APIKeys.bearer)", forHTTPHeaderField: "Authorization")
        request.timeoutInterval = timeoutInterval
        
        let decoder = JSONDecoder()
        decoder.userInfo[CodingUserInfoKey.managedObjectContext] = viewContext
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .print()
            .map(\.data)
            .decode(type: typeOf, decoder: decoder)
            .mapError {NetworkError(error: $0)}
            .eraseToAnyPublisher()
    }
}



//MARK:- Profile
extension APIManager {
    
    func getUser() -> AnyPublisher<UserData, NetworkError> {
        makeRequest(url: APIInfo.userInfo,
                    httpMethod: .get,
                    typeOf: UserData.self)
        
    }
}

//MARK:- Practices
extension APIManager {
    
    func getPractices() -> AnyPublisher<PracticesData, NetworkError>{
        makeRequest(url: APIInfo.practices,
                    httpMethod: .get,
                    typeOf: PracticesData.self)
    }
}
