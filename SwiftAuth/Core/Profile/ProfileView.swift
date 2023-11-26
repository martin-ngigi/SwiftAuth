//
//  ProfileView.swift
//  SwiftAuth
//
//  Created by Martin Wainaina on 26/11/2023.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        List{
            Section{
                HStack {
                    Text("MW")
                        .font(.title)
                        .fontWeight(.semibold)
                        .frame(width: 72, height: 72)
                        .foregroundStyle(.white)
                        .background(Color(.systemGray))
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 4){
                        Text("Martin Wainaina")
                            .fontWeight(.semibold)
                            .font(.subheadline)
                            .padding(.top, 4)
                        
                        Text("martin@gmail.com")
                            .font(.footnote)
                            .accentColor(.gray) // SwiftUI Changes email color, so this will prevent it from changing the color
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
                    print("DEBUG: Clicked Sign Out")
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
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
