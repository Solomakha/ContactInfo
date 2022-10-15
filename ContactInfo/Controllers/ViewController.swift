//
//  ViewController.swift
//  ContactInfo
//
//  Created by Admin on 13.10.2022.
//

import UIKit
import Contacts

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let model: GroupsModel = GroupsModel()
    
    struct FetchedContact {
        var name: String
        var surname: String
        var phoneNumber: [String]
        var email: String
    }
    
    var fetchContacts = [FetchedContact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let nib = UINib(nibName: "MyTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "MyTableViewCell")
        
        //Вызываю функцию получения контактов
        fetchAllContacts()
    }
    //Объявляю функцию которая будет получить все контакты с телефонной книги
    func fetchAllContacts(){
        //Получаю доступ к контактам
        let contactStore = CNContactStore()
        //Объявляю ключи которые буду получать из контактов
        let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey, CNContactEmailAddressesKey] as [CNKeyDescriptor]
        //Запрос на получение контактов
        let fetchRequest = CNContactFetchRequest(keysToFetch: keys)
        //Вызов метода получения всех контактов
        do {
            try contactStore.enumerateContacts(with: fetchRequest, usingBlock: { contact, results in
                //Операции над получеными контактами
                
                let contactName = contact.givenName
                let contactFamilyName = contact.familyName
                let contactEmailAdress = contact.emailAddresses.first?.value ?? ""
                let contactPhoneNumber: [String] = contact.phoneNumbers.map{ $0.value.stringValue}
           
                self.fetchContacts.append(FetchedContact(name: contactName, surname: contactFamilyName, phoneNumber: contactPhoneNumber, email: String("\(contactEmailAdress)")))
               
            })
        }
        
        catch {
            //Вывод ошибки если что-то пошло не по плану
            print("Something go wrong")
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.group.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
        cell.grTitle.text = model.group[indexPath.row].groupsTitle
        cell.grImg.image = model.group[indexPath.row].groupsImg
        cell.contactCount.text = String("\(fetchContacts.count)")
        return cell
    }
    
}
