//
//  GroopsModel.swift
//  ContactInfo
//
//  Created by Admin on 14.10.2022.
//

import Foundation

struct GroupsContent{
    var groupsTitle: String
    var groupsImg: String
    
}

class GroupsModel{
    var group = [GroupsContent]()
    
    init(){
        data()
    }
    
    func data(){
        let gr1 = GroupsContent(groupsTitle: "Контакты", groupsImg: "")
        let gr2 = GroupsContent(groupsTitle: "Повторяющиеся имена", groupsImg: "")
        let gr3 = GroupsContent(groupsTitle: "Дубликаты номеров", groupsImg: "")
        let gr4 = GroupsContent(groupsTitle: "Без имени", groupsImg: "")
        let gr5 = GroupsContent(groupsTitle: "Нет номера", groupsImg: "")
        let gr6 = GroupsContent(groupsTitle: "Нет електронной почты", groupsImg: "")
        
        self.group = [gr1, gr2, gr3, gr4, gr5, gr6]
       
    }
}
