//
//  quizzView.swift
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
struct quizzView: View {
    @EnvironmentObject var funQuizzManager: FunQuizzManager
    
    var body: some View {
        VStack(spacing: 40) {
            HStack {
                Text("Fun Quizz RMIT")
                    .foregroundColor(Color("chineseyellow"))
                    .fontWeight(.heavy)
                
                Spacer()
                
                Text("\(funQuizzManager.index + 1) out of \(funQuizzManager.length)")
                    .foregroundColor(Color("chineseyellow"))
                    .fontWeight(.heavy)
            }
            
            ProgressTracker(progress: funQuizzManager.progress)
            
            VStack(alignment: .leading, spacing: 20) {
                Text(funQuizzManager.question)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(Color("chineseyellow"))
                
                ForEach(funQuizzManager.answerChoices, id: \.id) { answer in
                    AnswerContainer(answer: answer)
                        .environmentObject(funQuizzManager)
                }
            }
            
            Button {
                funQuizzManager.goToNextQuestion()
                playSound(sound: "interface", type: "mp3")
            } label: {
                MainButton(text: "Next", background: funQuizzManager.answerSelected ? Color("chineseyellow") : Color("paleaqua"))
            }
            .disabled(!funQuizzManager.answerSelected)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color("darkblue"))
        .navigationBarHidden(true)
        
    }
}


struct quizzView_Previews: PreviewProvider {
    static var previews: some View {
        quizzView()
            .environmentObject(FunQuizzManager())
    }
}
