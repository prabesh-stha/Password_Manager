//
//  ContentView.swift
//  Password_Manager
//
//  Created by Prabesh Shrestha on 24/07/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var showSignIn: Bool = true
    var body: some View {
        ZStack{
            if !showSignIn
            {
                Text("Hello")
            }
        }
        .onAppear{
            let auth = try? AuthenticationManager.shared.getAuthenticatedUser()
            self.showSignIn = auth == nil ? true : false
        }
        .fullScreenCover(isPresented: $showSignIn, content: {
            NavigationStack{
                EmailView(showSignIn: $showSignIn)
            }
        })
    }
}

#Preview {
    ContentView()
}
