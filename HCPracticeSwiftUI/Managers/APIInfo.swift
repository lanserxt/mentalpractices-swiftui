//
//  APIInfo.swift
//  HCPracticeSwiftUI
//
//  Created by Anton Gubarenko on 04.03.2021.
//

struct APIInfo {
    
    static var apiUrl: String {
        "https://dev.humancosmos.app/api/v1/"
    }
    
    static var userInfo: String {
        APIInfo.apiUrl + "user"
    }
    
    static var practices: String {
        APIInfo.apiUrl + "practices"
    }
    
    static var practice: String {
        APIInfo.apiUrl + "practices/"
    }
}
