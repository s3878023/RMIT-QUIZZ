//
//  FunQuizz.swift
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
import Foundation

struct FunQuizz: Decodable {
    var results: [Result]
    
    struct Result: Decodable, Identifiable {
        // We need to set the ID inside of the closure, because the API doesn' return us an ID for each result
        var id: UUID {
            UUID()
        }
        var category: String
        var type: String
        var difficulty: String
        var question: String
        var correctAnswer: String
        var incorrectAnswers: [String]
        
        // Custom coding key, not included in the API response, so we need to set it inside the closure
        var formattedQuestion: AttributedString {
            do {
                // Formatting the question with AttributedString, because API might return some markdown text - which will be hard to read if we keep the string as is
                return try AttributedString(markdown: question)
            } catch {
                // If we run into an error, return an empty string
                print("Error setting formattedQuestion: \(error)")
                return ""
            }
        }
        // Custom coding key, not included in the API response, so we need to set it inside the closure

        var answers: [Answer] {
            do {
                // Formatting all answer strings into AttributedStrings and creating an instance of Answer for each
                let correct = [Answer(text: try AttributedString(markdown: correctAnswer), isCorrect: true)]
                let incorrects = try incorrectAnswers.map { answer in
                    Answer(text: try AttributedString(markdown: answer), isCorrect: false)
                }
                
                // Merging the correct and incorrect arrays together
                let allAnswers = correct + incorrects
                
                // Shuffling the answers so the correct answer isn't always the first answer of the array
                return allAnswers.shuffled()
            } catch {
                // If we run into an error, return an empty array
                print("Error setting answers: \(error)")
                return []
            }
        }
    }
}
