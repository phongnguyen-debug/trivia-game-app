//
//  LevelView.swift
//  trivia-game-app
//
//  Created by Pham Thi Thu Ha on 07/07/2024.
//

import SwiftUI

struct LevelView: View {
    @State var level: String
    @StateObject var triviaManager = TriviaManager()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                VStack(spacing: 20) {
                    Text("Trivia Game")
                        .lilacTitle()
                    Text("Are you ready to test your trivia skills?")
                        .foregroundColor(Color("AccentColor"))
                }
                NavigationLink {
                    TriviaView()
                        .environmentObject(triviaManager)
                } label: {
                    PrimaryButton(text: "Let's go with level \(level)!")
                }
            }
            .onAppear() {
                Task.init() {
                    await triviaManager.fetchTrivia(level: level)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.84705882355294118))
        }.navigationBarHidden(true)
    }
}

struct LevelView_Previews: PreviewProvider {
    static var previews: some View {
        LevelView(level: "")
    }
}
