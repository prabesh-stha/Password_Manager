//
//  EmailViewModel.swift
//  Password_Manager
//
//  Created by Prabesh Shrestha on 24/07/2024.
//

import Foundation
import FirebaseAuth

final class EmailViewModel: ObservableObject
{
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showEmailSignIn: Bool = true
    
    func signIn() async throws
    {
        try await AuthenticationManager.shared.signInWithEmail(email: email, password: password)
    }
    
    func signUp() async throws
    {
        try await AuthenticationManager.shared.signUpWithEmail(email: email, password: password)
    }
}
