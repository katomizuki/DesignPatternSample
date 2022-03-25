//
//  StatePattern.swift
//  DesignPatternSample
//
//  Created by ミズキ on 2022/03/26.
//

import Foundation
import UIKit

protocol State {
    func run()
    func stop()
}

class ParkingState: State {
    func run() {
        
    }
    func stop() {
        
    }
}

class BackState: State {
    func run() {
        
    }
    func stop() {
        
    }
}

class RunningState: State {
    func run() {
        
    }
    func stop() {
        
    }
}

class StateViewController: UIViewController {
    /// 停車状態
       private let parkingState = ParkingState()
       /// 戻る状態
       private let backState = BackState()
       /// 走行状態
       private let runningState = RunningState()

       /// 状態フラグ（初期値は停車状態）
       private var state: State = ParkingState()

       override func viewDidLoad() {
           super.viewDidLoad()

           setup()
       }

       // 各モードの切り替え

       @IBAction func didTapParkingButton(_ sender: Any) {
           setState(with: parkingState)

           // ボタンの色状態を変える処理は省略
       }

       @IBAction func didTapBackButton(_ sender: Any) {
           setState(with: backState)
       }

       @IBAction func didTapDriveButton(_ sender: Any) {
           setState(with: runningState)
       }

       // 各アクション

       @IBAction func didTapBreakButton(_ sender: Any) {
           state.stop()
       }

       @IBAction func didTapRunButton(_ sender: Any) {
           state.run()
       }

       /// 準備
       func setup() {
//           parkingButton.backgroundColor = .yellow
           setState(with: parkingState)
       }

       /// 状態をセット
       /// - Parameter state: State
       func setState(with state: State) {
           self.state = state
       }
}
