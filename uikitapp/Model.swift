//
//  Model.swift
//  uikitapp
//
//  Created by Josymarss on 25/10/24.
//

import Foundation

struct UserResponse: Codable {
    let data: [PersonResponse]
}

struct PersonResponse: Codable {
    let email: String
    let firstName: String
    let lastName: String
}
