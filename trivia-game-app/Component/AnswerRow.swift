//
//  AnswerRow.swift
//  trivia-game-app
//
//  Created by Pham Thi Thu Ha on 03/07/2024.
//

import SwiftUI

struct AnswerRow: View {
    var answer: Answer
    @State var isSelected = false
    @EnvironmentObject var triviaManager: TriviaManager
    
    var green = Color(hue: 0.437, saturation: 0.711, brightness: 0.711)
    var red = Color(hue: 0.71, saturation: 0.094, brightness: 0.1)
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "circle.fill")
            Text(answer.text)
            
            if isSelected {
                Spacer()
                Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill")
                    .foregroundColor(answer.isCorrect ? green : red)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(triviaManager.answerSelected ? (isSelected ? Color("AccentColor") : .gray) : Color("AccentColor"))
        .background(.white)
        .shadow(color: isSelected ? (answer.isCorrect ? .green : .red) : .gray, radius: 5, x: 0.5, y: 0.5)
        .onTapGesture {
            if !triviaManager.answerSelected {
                isSelected = true
                triviaManager.selectAnswer(answer: answer)
                triviaManager.setAnswerSelected(seleted: true)
            }
        }
    }
}

struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(answer: Answer(text: "Single", isCorrect: false))
            .environmentObject(TriviaManager())
    }
}
