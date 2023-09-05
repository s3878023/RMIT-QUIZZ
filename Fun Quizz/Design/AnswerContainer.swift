//
//  AnswerContainer.swift
//  Fun Quizz
//
//  Created by Đại Đức on 01/09/2023.
//
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
