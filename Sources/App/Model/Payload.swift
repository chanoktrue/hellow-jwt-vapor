//
//  Payload.swift
//  
//
//  Created by Thongchai Subsaidee on 3/3/22.
//

import Vapor
import JWTKit
//import Darwin

struct Payload: JWTPayload {
    
    enum CodingKeys: String, CodingKey {
        case subject = "sub"
        case expiration = "exp"
        case isAdmin = "admin"
        case email = "email"
        case password = "pass"
    }
    
    var subject: SubjectClaim
    var expiration: ExpirationClaim
    var isAdmin: Bool
    var email: String
    var password: String
    
    func verify(using signer: JWTSigner) throws {
        try self.expiration.verifyNotExpired()
    }
}
