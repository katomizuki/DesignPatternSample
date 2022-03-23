//
//  StarategyPattern.swift
//  DesignPatternSample
//
//  Created by ミズキ on 2022/03/24.
//

import Foundation

// アルゴリズム部分を一部定義し、それらを簡単に交換可能なものにする。
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
