//
//  TriviaView.swift
//  trivia-game-app
//
//  Created by Pham Thi Thu Ha on 03/07/2024.
//

import SwiftUI

struct TriviaView: View {
    @StateObject var triviaManager = TriviaManager()
    var body: some View {
        QuestionView()
            .environmentObject(triviaManager)
    }
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView()
    }
}
