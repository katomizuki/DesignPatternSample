//
//  DecoratorPattern.swift
//  DesignPatternSample
//
//  Created by ミズキ on 2022/03/24.
//

import Foundation
// デコレーターパターン、デコレートする。既にあるオブジェクトに責務を動的に付与することで単純な継承より柔軟に対応できる。
// 抽象クラス
class Menu {
    var description: String = "メニュー"
    
    func getDescription() -> String {
        return description
    }
    
    func cost() -> Int {
        fatalError()
    }
}
// Menuの具象クラス
class Ramen: Menu {
    override init() {
        super.init()
        description = "ラーメン"
    }
    
    override func cost() -> Int {
        return 600
    }
}
// デコレートを動的に変更しやすくするクラス 既存のオブジェクトデコレータでラップする
class Decorator: Menu {
    
    var menu: Menu

    init(menu: Menu) {
        self.menu = menu
    }
}
// 実際のデコレートの具象クラス。
class SeasonedEgg: Decorator {
    override func getDescription() -> String {
        return menu.getDescription() + ", 煮卵"
    }
    
    override func cost() -> Int {
        return menu.cost() + 80
    }
}

//var menu: Menu = Ramen()
//
//menu = SeasonedEgg(menu: menu)
//
//print(menu.getDescription(),menu.cost())


// Component
protocol CostHaving {
    // operation
    var cost: Double { get }
}

// Component
protocol IngredientsHaving {
    // operation
    var ingredients: [String] { get }
}

// Component
typealias BeverageDataHaving = CostHaving & IngredientsHaving

// ConcreteComponent
struct SimpleCoffee: BeverageDataHaving {
    // operation
    let cost: Double = 1.0
    let ingredients = ["Water", "Coffee"]
}

// Decoratorの抽象クラス（　プロトコル）
protocol BeverageHaving: BeverageDataHaving {
    // component
    var beverage: BeverageDataHaving { get }
}

// デコレータの具象クラス
struct Milk: BeverageHaving {
    // component
    let beverage: BeverageDataHaving
    // operation
    var cost: Double {
        return beverage.cost + 0.5
    }
    // operation
    var ingredients: [String] {
        return beverage.ingredients + ["Milk"]
    }
}

// デコレータの具象クラス
struct WhipCoffee: BeverageHaving {
    // component
    let beverage: BeverageDataHaving
    // operation
    var cost: Double {
        return beverage.cost + 0.5
    }
    // operation
    var ingredients: [String] {
        return beverage.ingredients + ["Whip"]
    }
}


// usage //
// 型推論に任せずに明示的に型を決定している。これによって、MilkもWhipCoffeeも同等に扱えるようにしている。ここでsampleCoffee型になってしまえば動的に使えないので、
//var someCoffee: BeverageDataHaving = SimpleCoffee()
//print("Cost: \(someCoffee.cost); Ingredients: \(someCoffee.ingredients)")
// Decoratorで既存のオブジェクト（someCoffee）をラップする
//someCoffee = Milk(beverage: someCoffee)
//print("Cost: \(someCoffee.cost); Ingredients: \(someCoffee.ingredients)")
//someCoffee = WhipCoffee(beverage: someCoffee)
//print("Cost: \(someCoffee.cost); Ingredients: \(someCoffee.ingredients)")
