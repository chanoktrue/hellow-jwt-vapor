//
//  UserController.swift
//  
//
//  Created by Thongchai Subsaidee on 4/3/22.
//

import Vapor

struct UserController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        let users = routes.grouped("users")
        users.get(use: getUser)
    }
    
    
    func getUser(req: Request) throws -> [String: String] {
        let payload = try req.jwt.verify(as: Payload.self)

        return ["email": payload.email]
        
    }
}

