//
//  FunQuizzManager.swift
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
import Foundation
import SwiftUI

class FunQuizzManager: ObservableObject {
    // Variables to set the quizz and length of the game
    private(set) var funquizz: [FunQuizz.Result] = []
    @Published private(set) var length = 0
    
    // Variables and settings for questions and answers
    @Published private(set) var index = 0
    @Published private(set) var question: AttributedString = ""
    @Published private(set) var answerChoices: [Answer] = []
    
    // Score and the progress of the player through the game
    @Published private(set) var score = 0
    @Published private(set) var progress: CGFloat = 0.00
    
    // check the selected answer and see if the question reach the end
    @Published private(set) var answerSelected = false
    @Published private(set) var reachedEnd = false
    
    // Call the fetchTrivia function on intialize of the class, asynchronously
    init() {
        Task.init {
            await fetchQuizz()
        }
    }
    
    // getting the information about the Quizz question from the database online
    func fetchQuizz() async {
        guard let url = URL(string: "https://opentdb.com/api.php?amount=15&difficulty=easy") else { fatalError("The URL is missing") }
        
        let urlRequest = URLRequest(url: url)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error fetching data") }

            let decoder = JSONDecoder()
           //convert the data from the API into formated information
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(FunQuizz.self, from: data)

            DispatchQueue.main.async {
                //reset the value incase the user start a new game
                self.index = 0
                self.score = 0
                self.progress = 0.00
                self.reachedEnd = false

                // Set new values for all variables
                self.funquizz = decodedData.results
                self.length = self.funquizz.count
                self.setQuestion()
            }
        } catch {
            print("Error fetching funquizz: \(error)")
        }
    }
    
    func goToNextQuestion() {
        if index + 1 < length {
            index += 1
            setQuestion()
        } else {
            reachedEnd = true
        }
    }
    
    func setQuestion() {
        answerSelected = false
        progress = CGFloat(Double((index + 1)) / Double(length) * 350)

        if index < length {
            let currentQuizzQuestion = funquizz[index]
            question = currentQuizzQuestion.formattedQuestion
            answerChoices = currentQuizzQuestion.answers
        }
    }
    
    func selectAnswer(answer: Answer) {
        answerSelected = true
        
        if answer.isCorrect {
            score += 1
        }
    }
}

