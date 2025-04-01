//
//  Person.swift
//  SwiftBook HomeWork 2.6
//
//  Created by Ярослав Шепелевский on 25.03.25.
//

import Foundation

struct Person {
    
    let name: String
    let surname: String
    let age: Int
    let education: String
    let location: String
    let aboutMe: String
    
    
    static func getPerson() -> Person {
        Person(
            name: "Yaroslav",
            surname: "Shepelevsky",
            age: 19,
            education: "Belarusian State University of Informatics and Radioelectronics",
            location: "Minsk, Belarus",
            aboutMe: "Ярослав Шепелевский родился 8 Апреля 2005 года в Шклове (Небольшой город Могилевской области, Беларусь). С детства увлекался математикой и решением алгоритмических задач и задач на логику. Профессионально увлекается плаванием, есть даже достижения на областных соревнованиях. В детстве муж тети рассказал про программирование и Ярослав решил что хочет быть программистом. Уже в 8 классе готовился к поступлению в БГУИР - главный информационно-технический университет в Беларуси. На данный момент он проходит обучение на 3-м курсе университета на специальности: 'Информационные системы и технологии'"
        )
    }
}
