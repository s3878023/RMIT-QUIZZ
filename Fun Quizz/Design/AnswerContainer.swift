//
//  AnswerContainer.swift
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
import AVFoundation
import SwiftUI

struct AnswerContainer: View {
    @EnvironmentObject var funQuizzManager: FunQuizzManager
    var answer: Answer
    @State private var isSelected = false
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "circle.fill")
                .font(.caption)
            
            Text(answer.text)
                .bold()
            
            if isSelected {
                Spacer()
                
                Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill")
                    .foregroundColor(answer.isCorrect ? .green : .red)
                
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(funQuizzManager.answerSelected ? (isSelected ? Color("chineseyellow") : .gray) : Color("chineseyellow"))
        .background(.white)
        .cornerRadius(10)
        .shadow(color: isSelected ? answer.isCorrect ? .green : .red : .gray, radius: 5, x: 0.5, y: 0.5)
        .onTapGesture {
            if !funQuizzManager.answerSelected {
                isSelected = true
                funQuizzManager.selectAnswer(answer: answer)
                if answer.isCorrect {
                        playSound(sound: "correct2", type: "mp3")
                } else {
                        playSound(sound: "wrong2", type: "mp3")
                }
            }
        }
    }
}

struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerContainer(answer: Answer(text: "Single", isCorrect:  false))
            .environmentObject(FunQuizzManager())
    }
}
