//
//  User.swift
//  
//
//  Created by Thongchai Subsaidee on 4/3/22.
//

import Vapor

struct User: Content {
    let id: UUID?
    let email: String
    let password: String
}
