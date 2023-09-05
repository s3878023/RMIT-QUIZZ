//
//  FunQuizzView.swift
//  Fun Quizz
//
//  Created by Đại Đức on 01/09/2023.
//

//import SwiftUI
//import AVFoundation
//
//struct FunQuizzView: View {
//    @EnvironmentObject var funQuizzManager : FunQuizzManager
//    var body: some View {
//        //checking if the user reaches the end and start to pop up the ending game phase
//        if funQuizzManager.reachedEnd {
//            VStack(spacing: 20) {
//                Text("Fun Quizz RMIT")
//                    .font(.title)
//                    .bold()
//                Text("Congratulations, you completed the game! 🥳")
//                    .bold()
//
//                Text("You scored \(funQuizzManager.score) out of \(funQuizzManager.length)")
//                    .bold()
//
//                Button {
//                    Task.init {
//                        await funQuizzManager.fetchQuizz()
//                    }
//                } label: {
//                    MainButton(text: "Play again")
//                }
//            }
//            .foregroundColor(Color("chineseyellow"))
//            .padding()
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(Color("darkblue"))
//            //adding the ending music running on the background
//            .onAppear {
//                DispatchQueue.main.asyncAfter(deadline: .now() ) {playSound(sound: "victory", type: "mp3")}
//            }
//
//        } else {
//            quizzView()
//                .environmentObject(funQuizzManager)
//        }
//    }
//}
//struct FunQuizzView_Previews: PreviewProvider {
//    static var previews: some View {
//        FunQuizzView()
//            .environmentObject(FunQuizzManager())
//    }
//}
//

import SwiftUI

struct FunQuizzView: View {
    @EnvironmentObject var funQuizzManager: FunQuizzManager
    @State private var userName = ""
    @State private var userScores: [String: Int] = [:]
    @State private var showScoresView = false
    @State private var shouldDismissScoresView = false // New state to control sheet dismissal

//     Use UserDefaults to store the user's name and userScores dictionary
    @AppStorage("userName") private var savedUserName = ""
    @AppStorage("userScores") private var savedUserScoresData = Data()

    var body: some View {
        NavigationView {
            if funQuizzManager.reachedEnd {
                VStack(spacing: 20) {
                    Text("Fun Quizz")
                        .font(.title)
                        .bold()
                        .font(.system(size: 33))
                        .padding(.top, 90)
                    
                    Text("Press The Icon To")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 33))
                        .bold()
                        .frame(
                            maxWidth: .infinity,
                            maxHeight: .infinity,
                            alignment: .center)
                        .padding(.bottom, -30)
                    
                    Text("Enter The Hall Of Fame")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 33))
                        .bold()
                        .frame(
                            maxWidth: .infinity,
                            maxHeight: .infinity,
                            alignment: .center)
                    
                    Button {
                        showScoresView.toggle()
                    } label: {
                        Image("ranking")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .padding()
                    }
                    
                    
                    Text("Save Your Score To Enter The Hall Of Fame")
                        .bold()
                        .fontWeight(.heavy)
                        .font(.system(size: 16))

                    TextField("Enter your name", text: $userName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .padding(.top, -15)
                        .foregroundColor(.black)
                    
                    Text("You scored \(funQuizzManager.score) out of \(funQuizzManager.length)")
                        .bold()
                        .foregroundColor(Color("paleaqua"))
                        .font(.system(size: 24))
                        .fontWeight(.heavy)
                    
                    
                    
                    Button{
                        saveUserScore()
                    } label: {
                        subButton(text: "save your record")
                    }
                    
                    
                    Button {
                        Task.init {
                            await funQuizzManager.fetchQuizz()
                        }
                    } label: {
                        MainButton(text:"Play Again")
                    }

                    
                }
                .foregroundColor(Color("chineseyellow"))
                .padding(.bottom, 90)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("darkblue"))
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                        // playSound(sound: "victory", type: "mp3")
                    }
                }
            } else {
                quizzView()
                    .environmentObject(funQuizzManager)
            }
        }
        .sheet(isPresented: $showScoresView) {
            ScoresView(userScores: $userScores, shouldDismiss: $shouldDismissScoresView) // Pass shouldDismiss binding
        }
        .onChange(of: shouldDismissScoresView) { newValue in
            if newValue {
                showScoresView = false
                shouldDismissScoresView = false
            }
        }
    }

    func saveUserScore() {
        let userScore = funQuizzManager.score

        // Update the userScores dictionary with the user's name and score
        userScores[userName] = userScore

        // Save the user's name and userScores dictionary using UserDefaults
        savedUserName = userName
        if let data = try? JSONEncoder().encode(userScores) {
            savedUserScoresData = data
        }
    }
}

struct FunQuizzView_Previews: PreviewProvider {
    static var previews: some View {
        FunQuizzView()
            .environmentObject(FunQuizzManager())
    }
}

struct ScoresView: View {
    @Binding var userScores: [String: Int]
    @Binding var shouldDismiss: Bool // Binding to control sheet dismissal

    var body: some View {
        NavigationView {
            List {
                ForEach(userScores.sorted(by: { $0.value > $1.value }), id: \.key) { name, score in
                    HStack {
                        Text(name)
                            .font(.headline)
                            .foregroundColor(Color("jacarta")) // Text color
                        Spacer()
                        Text("\(score)")
                            .font(.headline)
                            .foregroundColor(Color("jacarta")) // Text color
                    }
                    .padding(.vertical, 8) // Vertical padding
                }
                .listRowBackground(Color("chineseyellow")) // Background color of each row
            }
            .background(Color("jacarta")) // Background color of the entire list
            .navigationBarTitle("Hall of Fame")
        }
    }
}