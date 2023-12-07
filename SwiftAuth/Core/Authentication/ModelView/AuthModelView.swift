//
//  AuthModelView.swift
//  SwiftAuth
//
//  Created by Martin Wainaina on 27/11/2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

@MainActor // publish all UI updates back to main thread
class AuthViewModel: ObservableObject{
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init(){
        // Store current logged in  user in the local storage
        self.userSession = Auth.auth().currentUser
    }
    
    func signIn(withEmail email: String, password: String) async throws{
        print("DEBUG: clicked signIn ")
    }
    
    func createUser(withEmail email: String, password: String, fullName: String) async throws{
        print("DEBUG: clicked createUser")
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullName: fullName, email: email)
            let encodedUser =  try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            
        } catch{
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
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
