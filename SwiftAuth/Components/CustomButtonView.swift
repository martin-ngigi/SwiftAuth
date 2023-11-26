//
//  CustomButtonView.swift
//  SwiftAuth
//
//  Created by Martin Wainaina on 26/11/2023.
//

import SwiftUI

struct CustomButtonView: View {
    var buttonName : String
    //var icon: String?
    var icon: String=""
    var onTap: () -> Void


    var body: some View {
        Button(action: onTap) {
                    HStack {
                        Text(buttonName)
                            .fontWeight(.semibold)
                        if(!icon.isEmpty){
                            Image(systemName: icon)
                        }

                    }
                    .foregroundStyle(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color(.systemBlue))
                .cornerRadius(15)
                .padding(.top, 24)
    }
}

struct CustomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonView(buttonName: "ButtonName",
                         icon: "arrow.right"
                         ,onTap: {
                        print("You clicked CustomButtonView")
        })
     
    }
}
