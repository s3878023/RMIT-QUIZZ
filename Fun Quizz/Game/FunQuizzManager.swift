//
//  FunQuizzManager.swift
//  Fun Quizz
//
//  Created by Đại Đức on 01/09/2023.
//
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
        guard let url = URL(string: "https://opentdb.com/api.php?amount=10") else { fatalError("The URL is missing") }
        
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

