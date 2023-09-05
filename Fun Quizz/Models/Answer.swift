//
//  Answer.swift
//  Fun Quizz
//
//  Created by Đại Đức on 01/09/2023.
//

import Foundation

struct Answer: Identifiable {
    var id = UUID() // Setting the UUID ourselves inside of the model, because API doesn't return a unique ID for each answer
    var text: AttributedString
    var isCorrect: Bool
}
