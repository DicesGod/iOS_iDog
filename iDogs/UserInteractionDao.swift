import UIKit
import CoreData

class UserInteractionDao {
    let appDelegate: AppDelegate!
    
    init(withAppDelegate appDelegate: AppDelegate) {
        self.appDelegate = appDelegate
    }
    
    func getManagedContext() -> NSManagedObjectContext? {
        return appDelegate?.persistentContainer.viewContext
    }

    func getDog(breed: String) -> Int {
        if let dogs = getAllDogs(withAttributeName: "breed", andAttributeValue: breed) {
            print("Minh")
            return dogs.count
        }
        else{
            return 0
        }
    }
    
    func getAllDogs(withAttributeName attributeName: String, andAttributeValue attributeValue: String)-> [UserInteraction]? {
        if let context = getManagedContext() {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserInteraction")
             fetchRequest.predicate = NSPredicate(format: "\(attributeName) = %@", attributeValue)
            do {
                return try context.fetch(fetchRequest) as? [UserInteraction]
            } catch {
                print("[ERROR] Cannot fetch from CoreData!")
                return nil
            }
        } else {
            print("[ERROR] Cannot communicate with CoreData!")
            return nil
        }
    }
    
    func saveDog(withDog breed: String) -> Bool {
        if let context = getManagedContext() {
            let saveddog = UserInteraction(context: context)
            saveddog.breed = breed
            do {
                try context.save()
                return true
            } catch {
                print("[ERROR] Cannot save to CoreData!")
                return false
            }
        } else {
            print("[ERROR] Cannot communicate with CoreData!")
            return false
            }
        }
    }
