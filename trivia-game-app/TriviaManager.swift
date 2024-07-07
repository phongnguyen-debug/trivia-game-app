//
//  TriviaManager.swift
//  trivia-game-app
//
//  Created by Pham Thi Thu Ha on 03/07/2024.
//

import Foundation
import SwiftUI

class TriviaManager: ObservableObject {
    private(set) var trivia: [Trivia.Result] = []
    @Published private(set) var length = 0
    @Published private(set) var index = 0
    @Published private(set) var reachEnd = false
    @Published private(set) var answerSelected = false
    @Published private(set) var question: AttributedString = ""
    @Published private(set) var answerChoices: [Answer] = []
    @Published private(set) var progress:CGFloat = 0.00
    @Published private(set) var score = 0
    
    init() {
        Task.init() {
            await fetchTrivia()
        }
    }
    
    func fetchTrivia() async {
        guard let url = URL(string: "https://opentdb.com/api.php?amount=10") else {fatalError("Missing URL")}
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
//            guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Data not found")}
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try jsonDecoder.decode(Trivia.self, from: data)
            DispatchQueue.main.sync {
                self.index = 0
                self.score = 0
                self.progress = 0.00
                self.reachEnd = false
                self.trivia = decodedData.results
                self.length = decodedData.results.count
                self.setQuestion()
            }
        } catch {
            print("Error fetching data: \(error)")
        }
    }
    
    func gotoNextQuestion() {
        if index + 1 < length {
            index += 1
            setQuestion()
        } else {
            reachEnd = true
        }
    }
    
    func setQuestion() {
        answerSelected = false
        progress = CGFloat(Double(index + 1) / Double(length) * 350)
        
        if index < length {
            let currentTriviaQuestion = trivia[index]
            question = currentTriviaQuestion.formattedQuestion
            answerChoices = currentTriviaQuestion.answers
        }
    }
    
    func selectAnswer(answer: Answer, selected: Bool) {
        if answer.isCorrect {
            score += 1
        }
        answerSelected = selected
    }
}
