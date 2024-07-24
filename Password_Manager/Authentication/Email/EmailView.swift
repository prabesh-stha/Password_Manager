//
//  EmailView.swift
//  Password_Manager
//
//  Created by Prabesh Shrestha on 24/07/2024.
//

import SwiftUI

struct EmailView: View {
    @StateObject private var emailvm = EmailViewModel()
    @Binding var showSignIn: Bool
    
    var body: some View {
        VStack(alignment:.leading ){
            Text("Email")
                .font(.title)
                .bold()
                .padding(.leading)
            TextField("Enter the Email", text: $emailvm.email)
                .padding()
                .background(Color.gray.opacity(0.4))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Text("Password")
                .font(.title)
                .bold()
                .padding(.leading)
            SecureField("Enter the Password", text: $emailvm.password)
                .padding()
                .background(Color.gray.opacity(0.4))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Button(action: {
                if(emailvm.showEmailSignIn){
                    Task{
                        do{
                            try await emailvm.signIn()
                            showSignIn = false
                            return
                        }catch{
                            print(error)
                        }
                    }
                }else{
                    Task{
                        do{
                            try await emailvm.signUp()
                            showSignIn = false
                            return
                        }catch{
                            print(error)
                        }
                    }
                }
            }, label: {
                Text(emailvm.showEmailSignIn ? "Sign In": "Sign Up")
                    .font(.headline)
                    .foregroundStyle(Color.white)
                    .frame(height: 55)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
            })
            
              
            
        }.padding()
        Button(action: {
            emailvm.showEmailSignIn.toggle()
        }, label: {
            Text(emailvm.showEmailSignIn ? "New User?" : "Already a user?")
                .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        })
        Spacer()
            .navigationTitle(emailvm.showEmailSignIn ? "Sign In" : "Sign Up").navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    NavigationStack{
        EmailView(showSignIn: .constant(false))
    }
}
