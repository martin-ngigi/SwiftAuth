//
//  User.swift
//  SwiftAuth
//
//  Created by Martin Wainaina on 26/11/2023.
//

import Foundation

struct User: Identifiable, Codable{
    let id: String
    let fullName: String
    let email: String
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullName){
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        // else
        return ""
    }
}

extension User{
    static var MOCK_USER = User(id: NSUUID().uuidString, fullName: "Test User", email: "test@gmail.com")
}
