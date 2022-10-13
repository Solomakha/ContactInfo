//
//  ViewController.swift
//  ContactInfo
//
//  Created by Admin on 13.10.2022.
//

import UIKit
import Contacts

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
            })
        }
        
        catch {
            //Вывод ошибки если что-то пошло не по плану
            print("Something go wrong")
        }
    }
}

