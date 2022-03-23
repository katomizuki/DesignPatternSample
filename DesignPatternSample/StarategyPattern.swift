//
//  StarategyPattern.swift
//  DesignPatternSample
//
//  Created by ミズキ on 2022/03/24.
//

import Foundation

// アルゴリズム部分(戦略)を一部定義し、それらを簡単に交換可能なものにする。
protocol FlyBehaivor {
    static func fly()
}

class FlyNormal: FlyBehaivor {
    static func fly() {
        print("ノーマルな飛行")
    }
}

class FlyNoFly: FlyBehaivor {
    static func fly() {
        print("飛ばない")
    }
}

class FlyBallon: FlyBehaivor {
    static func fly() {
        print("風船でとぶ")
    }
}


struct Pokemon {
    enum FlyType {
        case normal
        case noFly
        case ballon
    }
    
    private var type: FlyType?
    
    mutating func setFlyType(with type: FlyType = .normal) {
        self.type = type
    }
    
    func fly() {
        guard let type = type else {
            return
        }
        
        switch type {
        case .normal:
            return FlyNormal.fly()
        case .noFly:
            return FlyNoFly.fly()
        case .ballon:
            return FlyBallon.fly()
        }

    }
}

// 呼び出し側ではsetFlyTypeでenumを変えるだけでfly()というアルゴリズムの挙動を交換できる

// 共通戦略 (アルゴリズム)
protocol Strategy {
    func getHand() -> Int
}

// 個別のアルゴリズム
struct RockStrategy: Strategy {
    func getHand() -> Int {
        return 2
    }
    
    
}

struct RandomStrategy: Strategy {
    func getHand() -> Int {
        return 1
    }
}

struct Player {
    let name: String
    let strategy: Strategy
    
    public func getHandFromStrategy() -> Int {
        return strategy.getHand()
    }
}

struct Game {
    static func fight(player1: Player, player2: Player) -> String {
        if player1.getHandFromStrategy() == player2.getHandFromStrategy() {
            return "Draw"
        }
        
        if (player1.getHandFromStrategy() + 1) % 3 == player2.getHandFromStrategy() {
            return "win"
        }
        
        return "lose"
    }
}
// 実際に呼び出す strategyを入れ替えるだけでアルゴリズムを差し替えられる。
//Game.fight(player1: Player(name: "", strategy: RockStrategy()), player2: Player(name: "", strategy: RandomStrategy()))
