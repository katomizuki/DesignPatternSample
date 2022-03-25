//
//  Composite.swift
//  DesignPatternSample
//
//  Created by ミズキ on 2022/03/25.
//

import UIKit

protocol Component {
    func listup()
}

class Family: Component {
    var family = [Component]()
    private let familyName: String
    init(familyName: String) {
        self.familyName = familyName
    }
    
    func listup() {
        for person in family {
            person.listup()
        }
    }
}

class Person: Component {
    private let name: String
    init(name: String) {
        self.name = name
    }
    
    func listup() {
        
    }
}

class CompositeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupFamily()
    }

    /// 家族の設定
    func setupFamily() {
        let tanakaFamily = Family(familyName: "田中")
        tanakaFamily.family.append(Person(name: "田中一郎"))
        tanakaFamily.family.append(Person(name: "田中二郎"))
        tanakaFamily.family.append(Person(name: "田中三郎"))

        let suzukiFamily = Family(familyName: "鈴木")
        suzukiFamily.family.append(Person(name: "鈴木一花"))
        suzukiFamily.family.append(Person(name: "鈴木ニ菜"))
        suzukiFamily.family.append(Person(name: "鈴木三春"))
        // 婿入り
        let satoFamily = Family(familyName: "佐藤(旧姓)")
        satoFamily.family.append(Person(name: "佐藤一"))
        suzukiFamily.family.append(satoFamily)

        tanakaFamily.listup()
        print("=============")
        suzukiFamily.listup()
        print("=============")
    }
}
