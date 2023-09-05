//
//  quizzView.swift
//  Fun Quizz
//
//  Created by Đại Đức on 01/09/2023.
//

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
