//
//  AdapterPattern.swift
//  DesignPatternSample
//
//  Created by ミズキ on 2022/03/25.
//

import Foundation
import UIKit
protocol BaseballPlayer {
    func throwing()
    func hitting()
}


class PowerHitter {
    func homeRun() {
        print("ホームラン")
    }
}
// オブジェクトアダプター
class PowerHitterAdaptor: BaseballPlayer {
    let player: PowerHitter

    init(player: PowerHitter) {
        self.player = player
    }

    func throwing() {
        print("送球")
    }

    func hitting() {
        player.homeRun()
    }
}

class AcePitcher {
    /// 投球
    func fastBall() {
        print("豪速球")
    }
}

// クラスアダプター
class AcePitcherAdaptor: AcePitcher, BaseballPlayer {
    func throwing() {
        super.fastBall()
    }

    func hitting() {
        print("打撃")
    }
}

class AdaptorViewController: UIViewController {

    let powerHitter = PowerHitter()

    var pitcherAdaptor: BaseballPlayer?
    var hitterAdaptor: BaseballPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()

        hitterAdaptor = PowerHitterAdaptor(player: powerHitter)
        pitcherAdaptor = AcePitcherAdaptor()
    }

    // throwingButtonも同様
    func didTapHittingButton(_ sender: Any) {
        guard let adaptor = hitterAdaptor else {
            return
        }
        adaptor.hitting()
        adaptor.throwing()
    }
}
