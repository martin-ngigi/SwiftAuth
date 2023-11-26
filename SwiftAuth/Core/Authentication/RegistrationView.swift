//
//  RegistrationView.swift
//  SwiftAuth
//
//  Created by Martin Wainaina on 26/11/2023.
//

import SwiftUI

struct RegistrationView: View {
    @State private var fullName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            // Image
            Image("firebase-logo")
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 120)

            
            // Form fields
            VStack{
                //Full Name
                InputView(text: $fullName,
                          title: "Full Name",
                          placeHolder: "John Doe")
                
                // Email
                InputView(text: $email,
                          title: "Email Address",
                          placeHolder: "name@example.com")
                    .autocapitalization(.none)
                
                // Password
                InputView(text: $password,
                          title: "Password",
                          placeHolder: "Enter your password",
                          isSecuredField: true)
                
                // Confirm Password
                InputView(text: $confirmPassword,
                          title: "Password",
                          placeHolder: "Confirm your password",
                          isSecuredField: true)
                
                // Sign Up button
                CustomButtonView(buttonName: "Sign Up") {
                    print("DEBUG: clicked Sign Up")
                }
                
                Spacer()
                
                //
                Button{
                    dismiss()
                } label: {
                    HStack(spacing: 3){
                        Text("Already have an account? ")
                        Text("Sign In")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 17))
                }
                
            }
            .padding(.horizontal)
            .padding(.top, 12)
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
