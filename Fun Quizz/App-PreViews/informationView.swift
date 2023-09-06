//
//  informationView.swift
//  Fun Quizz
//
//  Created by Đại Đức on 06/09/2023.
//

import SwiftUI

struct informationView: View {

        @Environment(\.dismiss) var dismiss

        var body: some View {
            ZStack {
                Rectangle()
                    .fill(Color("zomp"))
                    .ignoresSafeArea()

                ScrollView(.vertical, showsIndicators: true) { // Enable vertical scrolling
                    VStack(alignment: .leading, spacing: 20) {
                        VStack{
                            Image(systemName: "person.fill")
                                .resizable()
                                .frame(width: 150, height: 150)
                                .foregroundColor(Color("chineseyellow"))
                            Text("NGUYEN DUC DAI")
                                .font(.title)
                                .fontWeight(.heavy)
                                .foregroundColor(Color("chineseyellow"))
                            Text("SID: S3878023")
                                .font(.title2)
                                .foregroundColor(Color("chineseyellow"))
                            Text("Course: COSC2659")
                                .font(.title2)
                                .foregroundColor(Color("chineseyellow"))
                            Text("Assignment 2: Quizz App")
                                .font(.title2)
                                .foregroundColor(Color("chineseyellow"))
                            
                            
                        }
                        
                            
                        
                    }
                    .padding(25) // Add padding to the content
                    .frame(maxWidth: .infinity)
                    .background(Color.white.cornerRadius(30)) // White background with corner radius
                    .padding(25) // Add padding to the entire white background
                }
            }
        }
    }


struct informationView_Previews: PreviewProvider {
    static var previews: some View {
        informationView()
    }
}
