//
//  HighScoreView.swift
//  TriviaGame
//
//  Created by Yashovardhn on 05/08/22.
//

import SwiftUI

struct HighScoreView: View {
    let coreDM: CoreDataManager
    @State private var persons: [Person] = [Person]()
    @State private var needsRefresh: Bool = false
        
    private func populatePersons() {
            persons = coreDM.getAllPerson()
        }
    
    var body: some View {
        VStack{
        List {
            
            ForEach(persons, id: \.self) { person in
                NavigationLink(
                    destination: PersonDetail(person: person, coreDM: coreDM),
                    label: {
                        Text(person.name ?? "")
                    })
            }.onDelete(perform: { indexSet in
                indexSet.forEach { index in
                    let person = persons[index]
                    coreDM.deletePerson(person: person)
                    populatePersons()
                }
            })
            
        }.listStyle(PlainListStyle())
        .accentColor(needsRefresh ? .white: .black)
        
    }.padding()
        .navigationTitle("High Score")
    
        .onAppear(perform: {
        populatePersons()
    })
    }
}

struct HighScoreView_Previews: PreviewProvider {
    static var previews: some View {
        HighScoreView(coreDM: CoreDataManager())
    }
}
