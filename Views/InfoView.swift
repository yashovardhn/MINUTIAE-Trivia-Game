//
//  InfoView.swift
//  TriviaGame
//
//  Created by Yashovardhn on 05/07/22.
//

import SwiftUI

struct InfoView: View {
    
    let coreDM: CoreDataManager
    @State private var persons: [Person] = [Person]()
    @State private var needsRefresh: Bool = false
        
    private func populatePersons() {
            persons = coreDM.getAllPerson()
        }
    @State private var namei = ""
    @State private var agei = 0
    @State private var emaili = ""
    var genderi = ["Male", "Female", "Other"]
    @State private var selectedIndex = 0
    
    
    @StateObject var triviaManager = TriviaManager()

    var body: some View {
            VStack(spacing: 40) {
            
        Text("Login")
            .lilacTitle()
                
                
        TextField("Username", text: $namei)
            .padding()
            .frame(width: 300, height: 50 )
            .background(Color.black.opacity(0.05))
            .cornerRadius(10)
                
        TextField("Email", text: $emaili)
            .padding()
            .frame(width: 300, height: 50 )
            .background(Color.black.opacity(0.05))
            .cornerRadius(10)

        Text("Age")
            Picker(selection: $agei, label: Text("Age")) {
                ForEach(0 ..< 100) { number in
                        Text("\(number)")
                                 }
                }.pickerStyle(MenuPickerStyle())
                
        
        Section {
                Picker(selection: $selectedIndex, label: Text("Select Gender")) {
                                ForEach(0 ..< genderi.count, id: \.self) {
                                    Text(self.genderi[$0])
                                }
                          }
                }.pickerStyle(SegmentedPickerStyle())
        
                    Spacer()
        
        HStack{
            
                Button("Save") {
                    coreDM.savePerson(name: namei, age: Int16(agei), gender: genderi[selectedIndex])
                }
            
            Spacer()
        
            NavigationLink {
                    
                TriviaView(coreDM: CoreDataManager())
                    .environmentObject(triviaManager)
                }label: {
            PrimaryButton(text: "Let's go!")
            }
        }
    }.padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .background(Color(red: 0.9299852252, green: 0.851382792, blue: 1))
            
}
}


struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(coreDM: CoreDataManager())
        
    }
}
