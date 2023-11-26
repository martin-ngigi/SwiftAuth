//
//  InputView.swift
//  SwiftAuth
//
//  Created by Martin Wainaina on 26/11/2023.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    var title: String
    var placeHolder: String
    var isSecuredField = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12){
            Text(title)
                .foregroundStyle(Color(.darkGray))
                .fontWeight(.semibold)
                .font(.system(size: 18))
                .font(.footnote)
            
            if isSecuredField {
                SecureField(placeHolder, text: $text)
                    .font(.system(size: 18))
            }
            else{
                TextField(placeHolder, text: $text)
                    .font(.system(size: 18))
            }
            
            Divider()
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(text: .constant(""), title: "Email Address", placeHolder: "name@example.com")
    }
}
