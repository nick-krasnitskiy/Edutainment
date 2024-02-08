//
//  ContentView.swift
//  Edutainment
//
//  Created by Nick Krasnitskiy on 07.02.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isGameActive = false
    @State private var multipleTable: Int = 2
    @State private var questionAmount: Int = 5
    @State private var answer: Int? = nil
    
    let numberOfQuestions = [5, 10, 20]
    
    var body: some View {
        
        if isGameActive {
            NavigationStack {
                VStack(spacing: 15) {
                    Text("What is \(multipleTable) x \(Int.random(in: 1...multipleTable)) ?")
                        .font(.title)
                    TextField("Enter your answer",  value: $answer, format: .number)
                        .multilineTextAlignment(.center)
                }
                .toolbar {
                    Button("Change settings") { isGameActive = false }
                }
            }
        } else {
            NavigationStack {
                List {
                    Section ("Choose the type of multiplication table") {
                        
                        Stepper("\(multipleTable) multiplication table", value: $multipleTable, in: 2...12)
                    }
                    
                    Section ("Chose the number of questions") {
                        Picker("", selection: $questionAmount) {
                            ForEach(numberOfQuestions, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    
                    Section ("Save setting") {
                        Button ("Save and Play") { isGameActive = true }
                    }
                }
                .listStyle(.grouped)
                .navigationTitle("Game settings")
            }
        }
    }
}

#Preview {
    ContentView()
}
