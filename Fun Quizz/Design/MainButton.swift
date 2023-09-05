//
//  MainButton.swift
//  Fun Quizz
//
//  Created by Đại Đức on 01/09/2023.
//
import AVFoundation

import SwiftUI

struct MainButton: View {
    var text: String
    var background: Color =  Color("chineseyellow")
    var body: some View {
        Text(text)
            .font(.title)
            .fontWeight(.heavy)
            .padding()
            .padding(.horizontal)
            .background(background)
            .cornerRadius(30)
            .shadow(radius: 10)
            .foregroundColor(Color("jacarta"))
    }
}

struct MainButton_Previews: PreviewProvider {
    static var previews: some View {
        MainButton(text: "Next")
    }
}
