//
//  User.swift
//  Authentication
//
//  Created by Айдар Оспанов on 16.02.2023.
//

import UIKit

struct User {
    let auth: Auth
    let person: Person
    
    static func getUser() -> User {
            User(
                auth: Auth(login: "Jinx", password: "123"),
                person: Person(
                    nickName: "Джинкс",
                    name: "Паудер",
                    kind: .hybrid,
                    position: "Преступница",
                    ogirin: "Заун (нижний район Пилтовера)",
                    description: description,
                    photo: UIImage(named: "Jinx"))
            )
    }
}

struct Auth {
    let login: String
    let password: String
}

struct Person {
    let nickName: String
    let name: String
    let kind: Kind
    let position: String
    let ogirin: String
    let description: String?
    let photo: UIImage?
}

enum Kind: String {
    case human = "Человек"
    case mutant = "Мутант"
    case hybrid = "Гибрид"
}

let description = "Джинкс, полоумная и безрассудная преступница из Зауна, привыкла сеять разрушения, не заботясь о последствиях. Вооружившись целым арсеналом смертоносных средств, она устраивает самые громкие взрывы и самые дерзкие диверсии, оставляя за собой разгром и панику. Джинкс презирает скуку – и поэтому всегда рада учинить хаос и кромешный ад, где бы она ни оказалась»."
