//
//  ContentView.swift
//  TriviaGame


import SwiftUI

struct ContentView: View {
    @StateObject var triviaManager = TriviaManager()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 300) {
                HStack{
                    Spacer()
                    NavigationLink(destination: HighScoreView(coreDM: CoreDataManager())) {
                          Text("High Scores")
                        
                    }
                }.frame(alignment: .topLeading)
                
                VStack(alignment:.center,spacing: 40) {
                    VStack{
                    Text("Trivia Game")
                        .lilacTitle()
                    }
                    Text("Are you ready to test out your trivia skills?")
                        .foregroundColor(Color("AccentColor"))
                    
                    NavigationLink(destination: InfoView(coreDM: CoreDataManager())) {
                                        Text("Let's Go!")
                                    }.buttonStyle(.borderedProminent)
                    
                }
                
//                NavigationLink(destination: InfoView(coreDM: CoreDataManager())) {
//                                    Text("Let's Go!")
//                                }
                
//                        NavigationLink(destination: HighScoreView(coreDM: CoreDataManager())) {
//                              Text("High Scores")
//                        }
                
            }
            
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(Color(red: 0.9299852252, green: 0.851382792, blue: 1))
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

