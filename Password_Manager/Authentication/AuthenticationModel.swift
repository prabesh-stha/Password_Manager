//
//  AuthenticationModel.swift
//  Password_Manager
//
//  Created by Prabesh Shrestha on 24/07/2024.
//

import Foundation
import FirebaseAuth

struct AuthenticationModel{
    let uid: String
    let email: String?
    let displayName: String?
    
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.displayName = user.displayName
    }
}
