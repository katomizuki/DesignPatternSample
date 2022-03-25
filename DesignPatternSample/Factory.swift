//
//  Factory.swift
//  DesignPatternSample
//
//  Created by ミズキ on 2022/03/26.
//

import Foundation

// オブジェクトを生成するためのprotocol
protocol OkinomiyakiStore {
    func create(type: Topping) -> Okonomiyaki
}

extension OkinomiyakiStore {
    func order(type: Topping) -> Okonomiyaki {
        let okonomiyaki = create(type: type)
        okonomiyaki.prepare()
        okonomiyaki.mix()
        okonomiyaki.bake()
        return okonomiyaki
    }
}
protocol Okonomiyaki {
    var name: String { get set }
}
extension Okonomiyaki {
    func prepare() {
           print("下処理")
       }

       func getName() -> String {
           return name
       }
    func bake() {
        
    }
    func mix() {
        
    }
}
class KansaiOkonomiyakiStore: OkinomiyakiStore {
    func create(type: Topping) -> Okonomiyaki {
        switch type {
        case .mix:
            return KansaiMixedOkonomiyaki()
        case .cheese:
            return KansaiMixedOkonomiyaki()
        case .mentaiko:
            return KansaiMixedOkonomiyaki()
        }
    }
}

enum Topping {
    case mix
    case cheese
    case mentaiko
}

/// ミックスお好み焼き〜関西風〜（他のお好み焼きも同様に作成する）
class KansaiMixedOkonomiyaki: Okonomiyaki {
    var name: String = "ミックスお好み焼き〜関西風〜"
}
