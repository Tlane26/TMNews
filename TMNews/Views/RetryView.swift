//
//  RetryView.swift
//  TMNews
//
//  Created by Tlanetzi Chavez Madero on 19/11/23.
//

import SwiftUI

struct RetryView: View {

    let text: String
    let retryAction: () -> ()
    
    var body: some View {
        VStack(spacing: 8){
            Text(text)
                .font(.callout)
                .multilineTextAlignment(.center)
            
            Button(action: retryAction){
                Text("Try again")
            }
            
        }
    }
     
}

#Preview {
    RetryView(text: "An Error Ocurred"){
        
    }
}
