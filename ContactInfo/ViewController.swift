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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Вызываю функцию получения контактов
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        fetchAllContacts()
    }
    //Объявляю функцию которая будет получить все контакты с телефонной книги
    func fetchAllContacts(){
        //Получаю доступ к контактам
        let contactStore = CNContactStore()
        //Объявляю ключи которые буду получать из контактов
        let keys = [CNContactGivenNameKey, CNContactPhoneNumbersKey, CNContactEmailAddressesKey] as [CNKeyDescriptor]
        //Запрос на получение контактов
        let fetchRequest = CNContactFetchRequest(keysToFetch: keys)
        //Вызов метода получения всех контактов
        do {
            try contactStore.enumerateContacts(with: fetchRequest, usingBlock: { contact, results in
                //Операции над получеными контактами
                print("\(contact.givenName)")
                
                for number in contact.phoneNumbers {
                    switch number.label{
                        case CNLabelPhoneNumberMobile:
                        print("- Mobile: \(number.value.stringValue)")
                    case CNLabelPhoneNumberMain:
                        print("- Main: \(number.value.stringValue)")
                    default:
                        print("- Other: \(number.value.stringValue)")
                }
                    //print("- \(number.value.stringValue)")
                }
                
                for email in contact.emailAddresses {
                    
                    print("Email: \(email.value)")
                    
                }
                
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
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
}
