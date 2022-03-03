import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }

    app.get("hello") { req -> String in
        return "Hello, world!"
    }
    
    app.get("me") { req -> HTTPStatus in
        let payload = try req.jwt.verify(as: TestPayload.self)
        print(payload)
        return .ok
    }
    
    app.get("login") { req -> [String: String] in
        
        let payload = TestPayload(
            subject: "Vaport",
            expiration: .init(value: .distantFuture),
            isAdmin: true
        )
        
        return try ["token": req.jwt.sign(payload)]
        
    }
    
    
}
