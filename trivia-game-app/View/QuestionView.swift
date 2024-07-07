//
//  QuestionView.swift
//  trivia-game-app
//
//  Created by Pham Thi Thu Ha on 03/07/2024.
//

import SwiftUI

struct QuestionView: View {
    @StateObject var triviaManager = TriviaManager()
    var body: some View {
        if triviaManager.reachEnd {
            VStack(spacing: 20) {
                Text("Trivia Game")
                    .lilacTitle()
                
                Text("Congratulation !!! you completed the game")
                Text("Your scored \(triviaManager.score) out of length \(triviaManager.length)")
                
                Button {
                    Task.init() {
                        await triviaManager.fetchTrivia()
                    }
                } label: {
                    PrimaryButton(text: "Play again!!")
                }
            }
            .foregroundColor(Color("AccentColor"))
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.84705882355294118))
        } else {
            VStack(spacing: 40) {
                HStack {
                    Text("Trivia Game")
                        .lilacTitle()
                    Spacer()
                    Text("\(triviaManager.index + 1) out of \(triviaManager.length)")
                        .foregroundColor(Color("AccentColor"))
                        .fontWeight(.heavy)
                }
                ProgressBar(progress: triviaManager.progress)
                
                VStack(alignment: .leading, spacing: 20) {
                    Text(triviaManager.question)
                        .font(.system(size: 20))
                        .bold()
                        .foregroundColor(.gray)
                    ForEach(triviaManager.answerChoices, id: \.id) { answer in
                        AnswerRow(answer: answer)
                            .environmentObject(triviaManager)
                    }
                }
                if triviaManager.answerSelected {
                    Button {
                        triviaManager.gotoNextQuestion()
                    } label: {
                        PrimaryButton(text: "Next", background: triviaManager.answerSelected ? Color("AccentColor") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
                    }
                }
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.84705882355294118))
            .navigationBarHidden(true)
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
