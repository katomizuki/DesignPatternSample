//
//  CommandPattern.swift
//  DesignPatternSample
//
//  Created by ミズキ on 2022/03/25.
//

import Foundation

// command(操作)を作成し、そのレシーバー(クライアント側)を設定する
// 具体的なCommandを作成し、そのレシーバーの設定をする

/// 抽象操作プロトコル
protocol Command {
    var receiver: Receiver { get }
    func execute()
}

///　抽象操作クライアント
protocol Receiver {
    var name: String { get }
    func action(by commandType: CommandType)
}
// 操作のenum
enum CommandType {
    case A
    case B
}
// 実際に　Receiverを移譲する
class Ore: Receiver {
    var name: String = "ｍizuki"
    
    func action(by commandType: CommandType) {
        let commandText: String
        switch commandType {
        case .A:
            commandText = "A"
        case .B:
            commandText = "B"
        }
        print(name,commandText)
    }
}
// 具体的なジャンプクラス
class JumpCommand: Command {
    var receiver: Receiver
    
    init(receiver: Receiver) {
        self.receiver = receiver
    }
    
    func execute() {
        receiver.action(by: .A)
    }
}

class FireballCommand: Command {
    var receiver: Receiver

    init(receiver: Receiver) {
        self.receiver = receiver
    }
    
    func execute() {
        receiver.action(by: .B)
    }
}

// Command(操作）を保持しており、呼び出されたコマンドを実際に実行する
class CommandInvoker {
    private var commands: [Command] = []
    
    func addCommand(with command: Command) {
        commands.append(command)
    }
    
    func removeAllCommands() {
        commands.removeAll()
    }
    
    func execute() {
        for command in commands {
            command.execute()
        }
    }
}
