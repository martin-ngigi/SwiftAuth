//
//  AuthModelView.swift
//  SwiftAuth
//
//  Created by Martin Wainaina on 27/11/2023.
//

import Foundation
import Firebase

class AuthViewModel: ObservableObject{
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init(){
        
    }
    
    func signIn(withEmail email: String, password: String) async throws{
        print("DEBUG: clicked signIn ")
    }
    
    func createUser(withEmail email: String, password: String, fullName: String) async throws{
        print("DEBUG: clicked createUser")
    }
    
    func signOut(){
        print("DEBUG: clicked signOut")

    }
    
    func deleteAccount(){
        print("DEBUG: clicked deleteAccount")

    }
    
    func fetchUser(){
        
    }
}
