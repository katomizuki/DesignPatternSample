//
//  Iterator.swift
//  DesignPatternSample
//
//  Created by ミズキ on 2022/03/25.
//

import Foundation

protocol StudentModel {
    var name: String { get }
    var age: Int { get }
    var universityName: String { get }
    var motivation: String { get }
}

struct BachelorModel: StudentModel {
    let name: String
    let age: Int
    let universityName: String
    let motivation: String
}
protocol Aggregate {
    func createIterator() -> Iterator
}
class Bachelor: Aggregate {
    var models = [BachelorModel]()
    init() {
        models.append(BachelorModel(name: "山田", age: 22, universityName: "大学", motivation: "頑張ります"))
    }
    func createIterator() -> Iterator {
        return BachelorIterator(self)
    }
}
protocol Iterator {
    func hasNext() -> Bool
    func next() -> StudentModel?
}


class BachelorIterator: Iterator {
    private var  ba: Bachelor?
    private var index = 0
    init(_ bachelor: Bachelor) {
        self.ba = bachelor
    }
    
    func hasNext() -> Bool {
        guard let models = ba?.models else { return false }
        return !(index >= models.count)
    }
    
    func next() -> StudentModel? {
        guard let models = ba?.models else { return nil }
        let bachelor = models[index]
        index += 1
        return bachelor
    }
}
