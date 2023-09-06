//
//  ContentView.swift
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
struct ContentView: View {
    @StateObject var funQuizzManager = FunQuizzManager()
    @State var showInfoView = false
    @State var showInformationView = false // New state variable for information popup
    @State var showSettingView = false
    @AppStorage("isDarkMode") private var isDarkMode = false

    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 40) {
                    VStack(spacing: 20) {
                        Image("trophy")
                            .resizable()
                            .frame(width: 250, height: 250)
                            .padding(.bottom, 60)

                        Text("Welcome To Fun Quizz")
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(Color("paleaqua"))

                        Text("Quiz Your Way to the Top!")
                            .foregroundColor(Color("paleaqua"))
                            .fontWeight(.heavy)
                    }
                    NavigationLink {
                        FunQuizzView()
                            .environmentObject(funQuizzManager)
                    } label: {
                        MainButton(text: "Let's go!")
                    }
                    HStack {
                        Button {
                            // Show the information popup
                            showInformationView = true
                        } label: {
                            Image("info")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .padding()
                        }
                        Button {
                            // Show the infoView
                            showInfoView = true
                        } label: {
                            Image("book")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .padding()
                        }
                        Button {
                            // Show the infoView
                            showSettingView = true
                        } label: {
                            Image("gear")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .padding()
                        }
                        Button(action: {
                            // Toggle dark mode
                            isDarkMode.toggle()
                        }) {
                            Image(isDarkMode ? "dark" : "light")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .padding()
                        }
                        
                        
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
                .background(Color("jacarta"))
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                         playSound(sound: "goodmorning", type: "mp3")
                    }
                }
            }
            .sheet(isPresented: $showInfoView) {
                infoView()
            }

            // Information Popup
            .sheet(isPresented: $showInformationView) {
                informationView()
            }
            .sheet(isPresented: $showSettingView) {
                settingView()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .preferredColorScheme(isDarkMode ? .dark : .light) // Set the preferred color scheme
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

