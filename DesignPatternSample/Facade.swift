//
//  Facade.swift
//  DesignPatternSample
//
//  Created by ミズキ on 2022/03/25.
//

import Foundation
import UIKit

protocol HomeAppliances {
    static func turnON()
    static func turnOFF()
}

class TV: HomeAppliances {
    static func turnON() {
        print("つける")
    }
    
    static func turnOFF() {
         print("消す")
    }
}


class SmartSpeaker {
    func turnONAll() {
        TV.turnON()
    }
    
    func turnOFFALL() {
        TV.turnOFF()
    }
}

class FacadeViewController:UIViewController {
    private let smartSpeaker = SmartSpeaker()
    private let uiSwitch: UISwitch = {
        return UISwitch()
    }()
    
    func didToggle(_ toggle: Bool) {
        if toggle {
            smartSpeaker.turnONAll()
        } else {
            smartSpeaker.turnOFFALL()
        }
    }
}
