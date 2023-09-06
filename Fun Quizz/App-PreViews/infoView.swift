//
//  infoView.swift
//  Fun Quizz
//
//  Created by Đại Đức on 03/09/2023.
//


import SwiftUI
import AVFoundation

struct infoView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("chineseyellow"))
                .ignoresSafeArea()

            ScrollView(.vertical, showsIndicators: true) { // Enable vertical scrolling
                VStack(alignment: .leading, spacing: 20) {
                    VStack{
                        Text("The game rule is very simple, the first view the user gets to see is the welcome view like below.")
                            .foregroundColor(Color("chineseyellow"))
                        
                        Image("content")
                            .resizable()
                            .frame(width: 150, height: 280)
                        
                        Text("From image of the main view above, the user can press the let's go button in order to proceed to the game and start to play. Or they can press the info button, rules and setting in order to view the information, check the rules or change the settings \n\nHowever the player must be reminded that if they hit the answer, it will immediatly show if they are correct or wrong so be careful with your answer")
                            .foregroundColor(Color("chineseyellow"))
                        HStack{
                            Image("rightQuizz")
                                .resizable()
                                .frame(width: 150, height: 280)
                            Image("wrongQuizz")
                                .resizable()
                                .frame(width: 150, height: 280)
                        }
                        Text("\nAfter the player finish the game, the game will reach the final stage of the game that leads the player to see their score and then save the progress to see where they are on the Hall Of Fame. \n\nBy pressing the leaderboard icon, the player will be direct to the page Hall Of Fame where the system save the player list in ordered")
                            .foregroundColor(Color("chineseyellow"))
                        HStack{
                            Image("finish")
                                .resizable()
                                .frame(width: 150, height: 280)
                            Image("halloffame")
                                .resizable()
                                .frame(width: 150, height: 280)
                        }
                    }
                    
                        
                    
                }
                
                .padding(25) // Add padding to the content
                .frame(maxWidth: .infinity)
                .background(Color.white.cornerRadius(30)) // White background with corner radius
                .padding(25) // Add padding to the entire white background
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now()) {playSound(sound: "sweat", type: "mp3")}
        }
    }

    struct infoView_Previews: PreviewProvider {
        static var previews: some View {
            infoView()
        }
    }
}
