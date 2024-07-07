//
//  PrimaryButton.swift
//  trivia-game-app
//
//  Created by Pham Thi Thu Ha on 03/07/2024.
//

import SwiftUI

struct PrimaryButton: View {
    var text: String = "Next"
    var background: Color = Color("AccentColor")
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .padding()
            .padding(.horizontal)
            .background(background)
            .cornerRadius(30)
            .shadow(radius: 10)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton()
    }
}
