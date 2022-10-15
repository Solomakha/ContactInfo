//
//  ViewController.swift
//  ContactInfo
//
//  Created by Admin on 13.10.2022.
//

import UIKit
import Contacts

class ViewController: UIViewController {
    //Объявление таблицы
    @IBOutlet weak var tableView: UITableView!
    //Вызов модели групп из файла
    let model: GroupsModel = GroupsModel()
    //Структура для заполнения данных вытащинных из телефонной книги
    struct FetchedContact {
        var name: String
        var surname: String
        var phoneNumber: [String]
        var email: String
    }
    //Массив данных вытащинных из телефонной книги
    var fetchContacts = [FetchedContact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        //Регистрация кастомного View ячейки таблицы
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
        //Вызываю метод получения всех контактов
        do {
            try contactStore.enumerateContacts(with: fetchRequest, usingBlock: { contact, results in
                //Операции над получеными контактами
                
                let contactName = contact.givenName //имя
                let contactFamilyName = contact.familyName //фамилия
                let contactEmailAdress = contact.emailAddresses.first?.value ?? "" //Email
                let contactPhoneNumber: [String] = contact.phoneNumbers.map{ $0.value.stringValue} //номер телефона
                // заполняю массив данными полученными из телефонной книги
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
    //Указываю количество выводимых ячеек в таблице
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Количество ячеек равно количеству групп
        return model.group.count
    }
    //Вызываю кастомный View ячейки таблицы и заполняя элементы ячейки данными
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
        cell.grTitle.text = model.group[indexPath.row].groupsTitle
        cell.grImg.image = model.group[indexPath.row].groupsImg
        cell.contactCount.text = String("\(fetchContacts.count)")
        return cell
    }
    
}
