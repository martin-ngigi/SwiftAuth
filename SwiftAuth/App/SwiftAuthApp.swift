//
//  SwiftAuthApp.swift
//  SwiftAuth
//
//  Created by Martin Wainaina on 26/11/2023.
//

import SwiftUI

@main
struct SwiftAuthApp: App {
    /**
     StateObject has be initialized every time its being used,
     EnvironmentObject is initialized only once and can be used through out.
     */
    
    @StateObject var viewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
