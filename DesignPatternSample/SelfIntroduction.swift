//
//  SelfIntroduction.swift
//  DesignPatternSample
//
//  Created by ミズキ on 2022/03/25.
//

import Foundation
import UIKit

protocol SelfIntroduction {
    /// 名前
    func name()
    /// 職業
    func job()
}

extension SelfIntroduction {
    
    func introduction() {
        greet()
        enthusiasm()
    }
    
    func greet() {
        
    }
    func enthusiasm() {
        
    }
    
    
}

class Tanaka: SelfIntroduction {
    func name() {
        
    }
    
    func job() {
        
    }
    
    
}
class Yamada: SelfIntroduction {
    func name() {
        
    }
    
    func job() {
        
    }
    
    
}

class TemplateMethodViewController: UIViewController {
    /// 田中さん
    private let tanaka = Tanaka()
    /// 山田さん
    private let yamada = Yamada()

    func didTapTanakaButton(_ sender: Any) {
        tanaka.introduction()
    }

    func didTapYamadaButton(_ sender: Any) {
        yamada.introduction()
    }
}
