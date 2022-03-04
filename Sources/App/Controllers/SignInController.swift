//
//  SignInController.swift
//  
//
//  Created by Thongchai Subsaidee on 4/3/22.
//

import Vapor

struct SignInController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        let signin = routes.grouped("signin")
        
        signin.get(use: login)
        
    }
    
    func login(req: Request) throws -> [String:String] {
        let user = try req.content.decode(User.self)
        let payload = Payload(
            subject: "Vapor",
            expiration: .init(value: .distantFuture),
            isAdmin: true,
            email: user.email,
            password: user.password
        )
        return try ["token": req.jwt.sign(payload)]
    }
    
    
    
}
