import Vapor

func routes(_ app: Application) throws {

    
    app.get("me") { req -> HTTPStatus in
        let payload = try req.jwt.verify(as: Payload.self)
        print(payload)
        return .ok
    }
    
    app.get("login2") { req -> [String: String] in
        let user = try req.content.decode(User.self)
        
        print(user)
        
        let payload = Payload(
            subject: "Vapor",
            expiration: .init(value: .distantFuture),
            isAdmin: true,
            email: user.email,
            password: user.password
        )
        
        return try ["token": req.jwt.sign(payload)]
        
    }
    
    app.get("user") { req -> String in
        let payload = try req.jwt.verify(as: Payload.self)
        print(payload)
        return "name...."
    }
    
    try app.register(collection: SignInController())
    try app.register(collection: UserController())
}
