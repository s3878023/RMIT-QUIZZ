//
//  informationView.swift
//  Fun Quizz-1
/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Nguyen Duc Dai
  ID: s3878023
  Created  date: 19/08/2023
  Last modified: 06/09/2023
  Acknowledgement:
  https://opentdb.com/api_config.php
  https://designcode.io/quick-apps-swiftui-trivia-app-1
  https://designcode.io/quick-apps-swiftui-trivia-app-2
  https://designcode.io/quick-apps-swiftui-trivia-app-3
  https://designcode.io/quick-apps-swiftui-trivia-app-4
  https://chat.openai.com/
  https://www.flaticon.com/
  https://pixabay.com/sound-effects/
  https://www.epidemicsound.com/sound-effects/?_us=adwords&_usx=11440449526_sound%20effect%20download&utm_source=google&utm_medium=paidsearch&utm_campaign=11440449526&utm_term=sound%20effect%20download&gclid=Cj0KCQjwxuCnBhDLARIsAB-cq1ocpAypZVL6CuM_aquczghuF7qSmqBzmdP0VRUsxGeZ4QPPI3j6D_AaAsEbEALw_wcB
*/
import SwiftUI
import AVFoundation

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
