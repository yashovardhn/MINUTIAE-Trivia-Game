import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "UserCoreData")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Core Data Store failed \(error.localizedDescription)")
            }
        }
    }
    
    func updatePerson() {
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
        }
        
    }
    
    func deletePerson(person: Person) {
        
        persistentContainer.viewContext.delete(person)
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to save context \(error)")
        }
        
    }
    
    func getAllPerson() -> [Person] {
        
        let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
        
    }
    
    func savePerson(name: String, age: Int16, gender: String) {
        
        let person = Person(context: persistentContainer.viewContext)
        person.name = name
        person.gender = gender
        person.age = age
        
        
        
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save Info \(error)")
        }
        
    }
    
    func saveScore(score: Int16) {
        
        let person = Person(context: persistentContainer.viewContext)
        person.score = score

        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save score \(error)")
        }
        
    }
    
}
