//
//  subButton.swift
//  Fun Quizz
//
//  Created by Đại Đức on 04/09/2023.
//

import AVFoundation

import SwiftUI

struct subButton: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.title)
            .fontWeight(.heavy)
            .padding()
            .padding(.horizontal)
            .background(Color("paleyellow"))
            .cornerRadius(30)
            .shadow(radius: 10)
            .foregroundColor(Color("jacarta"))
        
            
    }
}

struct subButton_Previews: PreviewProvider {
    static var previews: some View {
        subButton(text: "Next")
    }
}
