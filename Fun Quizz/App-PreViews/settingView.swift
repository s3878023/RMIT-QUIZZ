//
//  settingView.swift
//  Fun Quizz
//
//  Created by Đại Đức on 06/09/2023.
//

import SwiftUI
import AVFoundation

struct settingView: View {
    @State private var selectedGameMode: GameMode = .easy
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("paleaqua"))
                .ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: true) { // Enable vertical scrolling
                VStack(alignment: .leading, spacing: 20) {
                    VStack{
                        Text("Select Game Mode")
                            .font(.title)
                            .padding()
                        
                        HStack {
                            Button(action: {
                                selectedGameMode = .easy
                            }) {
                                Text("Easy")
                                    .font(.headline)
                                    .padding()
                                    .foregroundColor(selectedGameMode == .easy ? Color("chineseyellow") : .blue)
                                    .background(selectedGameMode == .easy ? Color("jacarta") : Color.clear)
                                    .cornerRadius(10)
                            }
                            
                            Button(action: {
                                selectedGameMode = .medium
                            }) {
                                Text("Medium")
                                    .font(.headline)
                                    .padding()
                                    .foregroundColor(selectedGameMode == .medium ? Color("chineseyellow") : .blue)
                                    .background(selectedGameMode == .medium ? Color("jacarta") : Color.clear)
                                    .cornerRadius(10)
                            }
                            
                            Button(action: {
                                selectedGameMode = .hard
                            }) {
                                Text("Hard")
                                    .font(.headline)
                                    .padding()
                                    .foregroundColor(selectedGameMode == .hard ? Color("chineseyellow") : .blue)
                                    .background(selectedGameMode == .hard ? Color("jacarta") : Color.clear)
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now()) {playSound(sound: "sweat", type: "mp3")}
            }
            .padding(25) // Add padding to the content
            .frame(maxWidth: .infinity)
            .background(Color.white.cornerRadius(30)) // White background with corner radius
            .padding(25) // Add padding to the entire white background
        }
    }
}


enum GameMode {
    case easy, medium, hard
}


struct settingView_Previews: PreviewProvider {
    static var previews: some View {
        settingView()
    }
}

