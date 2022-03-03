//
//  File.swift
//  
//
//  Created by Thongchai Subsaidee on 3/3/22.
//

import Vapor
import JWTKit
import Darwin

struct TestPayload: JWTPayload {
    
    enum CodingKeys: String, CodingKey {
        case subject = "sub"
        case expiration = "exp"
        case isAdmin = "admin"
    }
    
    var subject: SubjectClaim
    var expiration: ExpirationClaim
    var isAdmin: Bool
    
    func verify(using signer: JWTSigner) throws {
        try self.expiration.verifyNotExpired()
    }
}
