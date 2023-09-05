//
//  ContentView.swift
//  Fun Quizz
//
//  Created by Đại Đức on 01/09/2023.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @StateObject var funQuizzManager = FunQuizzManager()
    @State var showInfoView = false
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
                    }label: {
                        MainButton(text: "Let's go!")
                        
                    }
                    HStack{
                        
                        Button{
                            
                        }label:{
                            Image("info")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .padding()
                        }
                        
                        Button{
                            showInfoView = true
                        }label:{
                            Image("book")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .padding()
                        }
                        
                        Button{
                            
                        }label:{
                            Image("gear")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .padding()
                        }
                        
                    }
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
                .background(Color("jacarta"))
                //            .onAppear {
                //                DispatchQueue.main.asyncAfter(deadline: .now()) {playSound(sound: "goodmorning", type: "mp3")}
                //            }
            }
            .sheet(isPresented: $showInfoView){
                infoView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
