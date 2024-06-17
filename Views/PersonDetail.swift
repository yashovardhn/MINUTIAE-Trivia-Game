//
//  PersonDetail.swift
//  TriviaGame
//
//  Created by Yashovardhn on 05/08/22.
//

import SwiftUI

struct PersonDetail: View {
    let person: Person
    let coreDM: CoreDataManager
    @State private var needsRefresh: Bool = false
    @State private var personage: Int = 0
    @State private var personscore: Int = 0
    @State private var persongender: String = ""
    
    var body: some View {
        VStack{
            let personage = Int(person.age)
            let personscore = Int(person.score)
            let persongender = person.gender ?? ""
            List{
                Text("Age: \(personage)")
                Text("Gender: \(persongender)")
                Text("Score: \(personscore)")
                            
                    
                
                
                
            }.listStyle(PlainListStyle())
                .accentColor(needsRefresh ?.white: .black)
                

        }
    }
}

struct PersonDetail_Previews: PreviewProvider {
    static var previews: some View {
        let person = Person()
        PersonDetail(person: person, coreDM: CoreDataManager())
    }
}
