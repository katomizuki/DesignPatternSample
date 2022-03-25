

protocol Ramenn {
    func createSoup() -> String
    func createNoodle() -> String
    func createGrilledPork() -> String
    func createOtherTopping() -> Any
}

enum RamenType {
    case Miso
    case Shoyu
    case Sio
    case Tonkotu
    case Jiro
}

// Factoryクラスを作るFactoryクラス
class RamenFactory: Ramen {
    func createRamen(type: RamenType) -> RamenFactory {
        switch type {
        case .Miso:
            return MisoRamenFactory()
        case .Shoyu:
            return ShoyuRamenFactory()
        case .Sio:
            return SioRamenFactory()
        case .Tonkotu:
            return TonkotuRamenFacroty()
        case .Jiro:
            return JiroRamenFactory()
        }
    }
    func createSoup(material: String) -> String {
            fatalError("must be overridden")
        }
        
        func createNoodle(flour: String) -> String {
            fatalError("must be overridden")
        }
        
        func createGrilledPork(pork: String) -> String {
            fatalError("must be overridden")
        }
        
        func createOtherTopping(topping: Any) -> Any {
            fatalError("must be overridden")
        }
}

class MisoRamenFactory: RamenFactory {
    override func createSoup(material: String) -> String {
           //秘伝のスープを作成する処理
           return "秘伝のこってり\(material)スープ"
       }
       
       override func createNoodle(flour: String) -> String {
           //自家製面を作る処理
           return "\(flour)で作った自家製麺!!"
       }
       
       override func createGrilledPork(pork: String) -> String {
           //焼豚を作るいろんな処理
           return "\(pork)をじっくり熟成させた焼豚"
           
       }
       
       override func createOtherTopping(topping: Any) -> Any {
           //トッピングを作る処理
           return "\(topping)をトッピング!"
       }
}
class ShoyuRamenFactory: RamenFactory {}
class SioRamenFactory: RamenFactory {}
class TonkotuRamenFacroty: RamenFactory {}
class JiroRamenFactory: RamenFactory {}

let ramenCock = RamenFactory()
let s = ramenCock.createRamen(type: .Miso).createSoup(material: "")
