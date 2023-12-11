//
//  ProfileView.swift
//  SwiftAuth
//
//  Created by Martin Wainaina on 26/11/2023.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        if let user = viewModel.currentUser{
            List{
                Section{
                    HStack {
                        //Text(User.MOCK_USER.initials)
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .frame(width: 72, height: 72)
                            .foregroundStyle(.white)
                            .background(Color(.systemGray3))
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 4){
                            Text(user.fullName)
                                .fontWeight(.semibold)
                                .font(.subheadline)
                                .padding(.top, 4)
                            
                            Text(user.email)
                                .font(.footnote)
                                //.accentColor(.gray) // SwiftUI Changes email color, so this will prevent it from changing the color
                                .foregroundStyle(.gray)
                        }
                    }
                }
                
                // General
                Section("General"){
                    HStack {
                        SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
                        Spacer()
                        
                        Text("1.0.0")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                }
                
                // Account
                Section("Account"){
                    // Sign Out
                    Button{
                        viewModel.signOut()
                    } label: {
                        SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: .red)
                    }
                    
                    // Delete account
                    Button{
                        print("DEBUG: Clicked Delete account")
                    } label: {
                        SettingsRowView(imageName: "xmark.circle.fill", title: "Delete account", tintColor: .red)
                    }
                }
            }
        }
        else{
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
