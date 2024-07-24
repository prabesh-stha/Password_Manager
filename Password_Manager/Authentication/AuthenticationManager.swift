//
//  AuthenticationManager.swift
//  Password_Manager
//
//  Created by Prabesh Shrestha on 24/07/2024.
//

import Foundation
import FirebaseAuth

final class AuthenticationManager
{
    static let shared = AuthenticationManager()
    private init(){}
    
    func getAuthenticatedUser() throws -> AuthenticationModel{
        guard let user = Auth.auth().currentUser else{
             throw URLError(.badURL)
        }
        
        return AuthenticationModel(user: user)
    }
    
    // MARK: SIGN IN EMAIL
    
    @discardableResult
    func signUpWithEmail(email:String, password: String) async throws -> AuthenticationModel
    {
        let authUser = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthenticationModel(user: authUser.user)
    }
    
    @discardableResult
    func signInWithEmail(email: String, password: String) async throws -> AuthenticationModel
    {
        let authUser = try await Auth.auth().signIn(withEmail: email, password: password)
        return AuthenticationModel(user: authUser.user)
    }
}
