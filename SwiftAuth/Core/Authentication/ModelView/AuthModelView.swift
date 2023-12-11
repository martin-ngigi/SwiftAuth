//
//  AuthModelView.swift
//  SwiftAuth
//
//  Created by Martin Wainaina on 27/11/2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

protocol AuthenticationFormProtocol{
    var formIsValid: Bool { get }
}

@MainActor // publish all UI updates back to main thread
class AuthViewModel: ObservableObject{
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init(){
        // Store current logged in  user in the local storage
        self.userSession = Auth.auth().currentUser
        
        Task{
            await fetchUser()
        }
    }
    
    func signIn(withEmail email: String, password: String) async throws{
        do{
            print("DEBUG: clicked signIn ")
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            //print("DEBUG: clicked signIn \(result) ")
            self.userSession = result.user
            await fetchUser()
        }
        catch{
            print("DEBUG: Failed to signin with error \(error.localizedDescription) ")
        }
    }
    
    func createUser(withEmail email: String, password: String, fullName: String) async throws{
        print("DEBUG: clicked createUser")
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullName: fullName, email: email)
            let encodedUser =  try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        } catch{
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    func signOut(){
        print("DEBUG: clicked signOut")
        do{
            try Auth.auth().signOut() // signs out user on backend
            self.userSession = nil // wipes out user session and takes us back to login screen
            self.currentUser = nil // wipes out current user data model
        }
        catch{
            print("DEBUG: Failed to signOut with error \(error.localizedDescription)")
        }

    }
    
    func deleteAccount(){
        print("DEBUG: clicked deleteAccount")

    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else {
            print("DEBUG: fetchUser Failed to fetch user uid")
            return
        }
        
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else {
            print("DEBUG: fetchUser Failed to fetch user data")
            return
        }
        self.currentUser = try? snapshot.data(as: User.self)
        print("DEBUG: fetchUser current user is: \(self.currentUser)")
    }
}
