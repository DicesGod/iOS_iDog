import UIKit
import CoreData

class DogViewController: UITableViewController {
    
    var dogs: [Dog] = []
    var breed = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //dogs = DogDao?.getAllDogs()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        self.navigationController?.popViewController(animated: true)
        
        dogs.append(Dog.init(breed: "Poddle", lifespan: 15))
        dogs.append(Dog.init(breed: "German Shepherd", lifespan: 13))
        dogs.append(Dog.init(breed: "Golden Retriever", lifespan: 12))
        dogs.append(Dog.init(breed: "Dachshund", lifespan: 16))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") {
            cell.textLabel?.text = dogs[indexPath.row].breed!
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "MainVC") as? DetailViewController {
            viewController.lifespanText = String(dogs[indexPath.row].lifespan)
        splitViewController?.showDetailViewController(viewController, sender: nil)
        }
        
        
        //Save dog
        
       userInteractionDao?.saveDog(withDog: dogs[indexPath.row].breed)
        
        print(dogs[indexPath.row].breed)
    }
//
//    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        let remove = UITableViewRowAction(style: .destructive, title: "Remove") { action, index in
//            if(userDao?.removeUser(withUsername: self.users[index.row].username!))! {
//                self.users.remove(at: index.row)
//                self.tableView.deleteRows(at: [index], with: .automatic)
//            }
//        }
//        remove.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
//        let edit = UITableViewRowAction(style: .normal, title: "Edit") {action, index in
//            print("Implement later!")
//        }
//        edit.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
//        return [remove, edit]
//    }
}
