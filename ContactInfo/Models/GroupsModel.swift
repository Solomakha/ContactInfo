//
//  GroopsModel.swift
//  ContactInfo
//
//  Created by Admin on 14.10.2022.
//

import Foundation
import UIKit

//Структура групп на которые необходимо отсортировать контакты
struct GroupsContent{
    var groupsTitle: String //заголовок групп
    var groupsImg: UIImage? //иконка групп
}

class GroupsModel{
    var group = [GroupsContent]() //массив груп
    //Вызов функции заполнения категорий групп
    init(){
        data()
    }
    //Массив иконок
    var logoImage :[UIImage?] = []
    
    func data(){
        //Заполнение массива иконок
        logoImage.append(UIImage(systemName: "person.crop.circle"))
        logoImage.append(UIImage(systemName: "person.3"))
        logoImage.append(UIImage(systemName: "phone"))
        logoImage.append(UIImage(systemName: "person.fill.questionmark.rtl"))
        logoImage.append(UIImage(systemName: "iphone.homebutton.slash"))
        logoImage.append(UIImage(systemName: "mail"))
        //Заполнения категорий
        let gr1 = GroupsContent(groupsTitle: "Контакты", groupsImg: logoImage[0])
        let gr2 = GroupsContent(groupsTitle: "Повторяющиеся имена", groupsImg: logoImage[1])
        let gr3 = GroupsContent(groupsTitle: "Дубликаты номеров", groupsImg: logoImage[2])
        let gr4 = GroupsContent(groupsTitle: "Без имени", groupsImg: logoImage[3])
        let gr5 = GroupsContent(groupsTitle: "Нет номера", groupsImg: logoImage[4])
        let gr6 = GroupsContent(groupsTitle: "Нет електронной почты", groupsImg: logoImage[5])
        //Запись заполненных категорий в массив групп
        self.group = [gr1, gr2, gr3, gr4, gr5, gr6]
       
    }
}
