//
//  LoginView.swift
//  SwiftAuth
//
//  Created by Martin Wainaina on 26/11/2023.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    
    var body: some View {
        NavigationStack{
            VStack{
                // Image
                Image("firebase-logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                
                // Form fields
                VStack{
                    InputView(text: $email,
                              title: "Email Address",
                              placeHolder: "name@example.com")
                        .autocapitalization(.none)
                    
                    InputView(text: $password,
                              title: "Password",
                              placeHolder: "Enter your password",
                              isSecuredField: true)
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                // Forgot password
                NavigationLink{

                } label: {
                    HStack(){
                        Spacer()
                        Text("Forgot password?")
                            .foregroundColor(.blue)
                            .underline()
                    }
                    .padding()
                }
                
                
                
                // Sign in button
                Button{
                    
                } label: {
                    HStack{
                        Text("SignIn")
                            .fontWeight(.semibold)
                        
                        Image(systemName: "arrow.right")
                    }
                    .foregroundStyle(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color(.systemBlue))
                .cornerRadius(15)
                .padding(.top, 24)
                
                Spacer()
                
                // Signup button
                NavigationLink{
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3){
                        Text("Don't have an account? ")
                        Text("SignUp")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 17))
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
