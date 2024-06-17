//
//  TriviaView.swift
//  TriviaGame


import SwiftUI

struct TriviaView: View {
    @EnvironmentObject var triviaManager: TriviaManager
    let coreDM: CoreDataManager
    @State private var persons: [Person] = [Person]()
    

    var body: some View {
        
        if triviaManager.reachedEnd {
            
            
            VStack(spacing:200) {
                HStack{
                    Spacer()
                    NavigationLink(destination: HighScoreView(coreDM: CoreDataManager())) {
                          Text("High Scores")
                        
                    }
                }.frame(alignment: .topLeading)

                VStack(spacing: 20){
                
                Text("Trivia Game")
                    .lilacTitle()

                Text("Congratulations, you completed the game! 🥳")
                
                Text("You scored \(triviaManager.score) out of \(triviaManager.length)")
                let score1 = triviaManager.score
                    HStack{
                NavigationLink(destination: ContentView()) {
                                    Text("Play Again")
                                }
                        Spacer()
                Button("Save") {
                    coreDM.saveScore(score: Int16(score1))
                }
                }
                    Spacer()
                Button {
                    exit(0);
                } label: {
                    PrimaryButton(text: "Exit")
                }
                }
                }
            .foregroundColor(Color("AccentColor"))
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(Color(red: 0.9299852252, green: 0.851382792, blue: 1))
            .navigationBarHidden(true)
        }else {
            QuestionView()
                .environmentObject(triviaManager)
        }
    }
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        
        TriviaView(coreDM: CoreDataManager())
            .environmentObject(TriviaManager())
    }
}
