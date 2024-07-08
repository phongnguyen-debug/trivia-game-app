//
//  ContentView.swift
//  trivia-game-app
//
//  Created by Pham Thi Thu Ha on 03/07/2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                VStack(spacing: 20) {
                    Text("Let choice level")
                        .lilacTitle()
                    Text("Please choice your level to start game.")
                        .foregroundColor(Color("AccentColor"))
                }
                NavigationLink {
                    LevelView(level: "easy")
                } label: {
                    PrimaryButton(text: "Easy Level")
                }
                NavigationLink {
                    LevelView(level: "medium")
                } label: {
                    PrimaryButton(text: "Medium Level")
                }
                NavigationLink {
                    LevelView(level: "hard")
                } label: {
                    PrimaryButton(text: "Hard Level")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.84705882355294118))
        }
        .navigationBarHidden(true)
    }    
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
