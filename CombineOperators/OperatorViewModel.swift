//
//  OperatorViewModel.swift
//  CombineOperators
//
//  Created by Natascha Fadeeva on 19.11.22.
//

import Foundation

struct OperatorViewModel {
    let p1: [String]
    let p2: [String]?
    let operatorDescription: String
    let output: [String]

    init(p1: [String], p2: [String]? = nil, op: String, out: [String]) {
        self.p1 = p1
        self.p2 = p2
        self.operatorDescription = op
        self.output = out
    }

    // MARK: Mapping Elements

    static var map: OperatorViewModel {
        return OperatorViewModel(p1: ["1", "2", "3", "4"], op: ".map { $0 * 2 }", out:  ["2", "4", "6", "8"])
    }

    static var replaceNil: OperatorViewModel {
        return OperatorViewModel(p1: ["1", "2", "-1", "4"], op: ".replaceNil(with: 5)", out:  ["1", "2", "5", "4"])
    }

    static var scan: OperatorViewModel {
        return OperatorViewModel(p1: ["1", "2", "3", "4"], op: ".scan(0) { $0 + $1 }", out:  ["1", "3", "6", "10"])
    }


    // MARK: Filter Elements

    static var filter: OperatorViewModel {
        return OperatorViewModel(p1: ["1", "2", "3", "4"], op: ".filter { $0 % 2 == 1 }", out:  ["1", "0", "3", "0"])
    }

    static var compactMap: OperatorViewModel {
        return OperatorViewModel(p1: ["1", "2", "nil", "4"], op: ".compactMap { $0 }", out:  ["1", "2", "0", "4"])
    }

    static var removeDuplicates: OperatorViewModel {
        return OperatorViewModel(p1: ["1", "3", "3", "1"], op: ".removeDuplicates()", out:  ["1", "3", "0", "1"])
    }

    // MARK: Reducing Elements

    static var collect: OperatorViewModel {
        return OperatorViewModel(p1: ["1", "2", "3", "|"], op: "collect(2)", out:  ["0", "[1, 2]", "0", "[3]"])
    }

    static var ignoreOutput: OperatorViewModel {
        return OperatorViewModel(p1: ["1", "2", "3", "-2"], op: "ignoreOutput()", out:  ["0", "0", "0", "-2"])
    }

    static var reduce: OperatorViewModel {
        return OperatorViewModel(p1: ["1", "2", "3", "|"], op: ".reduce(0) { $0 + $1 }", out:  ["0", "0", "0", "6"])
    }

    // MARK: Mathematical Operations

    static var count: OperatorViewModel {
        return OperatorViewModel(p1: ["1", "8", "6", "-2"], op: ".count()", out:  ["0", "0", "0", "3"])
    }

    static var max: OperatorViewModel {
        return OperatorViewModel(p1: ["1", "8", "3", "-2"], op: ".max()", out:  ["0", "0", "0", "8"])
    }

    static var mp1: OperatorViewModel {
        return OperatorViewModel(p1: ["1", "8", "3", "-2"], op: ".min()", out:  ["0", "0", "0", "1"])
    }

    // MARK: Matching Operators

    static var contains: OperatorViewModel {
        return OperatorViewModel(p1: ["2", "1", "7", "6"], op: ".contains { $0 > 4 }", out:  ["0", "0", "true", "|"])
    }

    static var allSatisfyFalse: OperatorViewModel {
        return OperatorViewModel(p1: ["6", "1", "7", "5"], op: ".allSatisfy { $0 > 4 }", out:  ["0", "false", "|", "0"])
    }

    static var allSatisfyTrue: OperatorViewModel {
        return OperatorViewModel(p1: ["7", "8", "6", "|"], op: ".allSatisfy { $0 > 4 }", out:  ["0", "0", "0", "true"])
    }

    // MARK: Sequence Operators

    static var dropFirst: OperatorViewModel {
        return OperatorViewModel(p1: ["1", "2", "3", "4"], op: ".dropFirst(2)", out:  ["0", "0", "3", "4"])
    }

    static var dropWhile: OperatorViewModel {
        return OperatorViewModel(p1: ["1", "2", "6", "1"], op: ".drop(while: { $0 < 3 })", out:  ["0", "0", "6", "1"])
    }

    static var append: OperatorViewModel {
        return OperatorViewModel(p1: ["1", "2", "|", "0"], op: ".append(6, 7)", out:  ["1", "2", "6", "7"])
    }

    static var prepend: OperatorViewModel {
        return OperatorViewModel(p1: ["1", "2", "0", "0"], op: ".prepend(3, 4)", out:  ["3", "4", "1", "2"])
    }

    static var prefix: OperatorViewModel {
        return OperatorViewModel(p1: ["1", "2", "3", "4"], op: ".prefix(2)", out:  ["1", "2", "|", "0"])
    }

    static var prefixWhile: OperatorViewModel {
        return OperatorViewModel(p1: ["1", "2", "3", "1"], op: ".prefix(while: { $0 < 3 })", out:  ["1", "2", "|", "0"])
    }

    // MARK: Selecting Operators


    static var first: OperatorViewModel {
        return OperatorViewModel(p1: ["1", "2", "3", "4"], op: ".first()", out:  ["1", "|", "0", "0"])
    }

    static var firstWhere: OperatorViewModel {
        return OperatorViewModel(p1: ["1", "2", "5", "8"], op: ".first { $0 > 3 }", out:  ["0", "0", "5", "|"])
    }

    static var last: OperatorViewModel {
        return OperatorViewModel(p1: ["1", "2", "3", "|"], op: ".last()", out:  ["0", "0", "0", "3"])
    }

    static var lastWhere: OperatorViewModel {
        return OperatorViewModel(p1: ["1", "2", "5", "|"], op: ".last { $0 < 3 }", out:  ["0", "0", "0", "2"])
    }

    static var outputAt: OperatorViewModel {
        return OperatorViewModel(p1: ["1", "2", "3", "4"], op: ".output(at: 2)", out:  ["0", "0", "3", "|"])
    }

    static var outputIn: OperatorViewModel {
        return OperatorViewModel(p1: ["1", "2", "3", "4"], op: ".output(p1: (1...2))", out:  ["0", "2", "3", "|"])
    }

    // MARK: Republishing Operators

    static var combineLatest: OperatorViewModel {
        return OperatorViewModel(p1: ["1", "0", "3", "0"], p2: ["0", "5", "0", "7"],  op: "p1.combineLatest(p2)", out:  ["0", "(1, 5)", "(5, 3)", "(3, 7)"])
    }

    static var merge: OperatorViewModel {
        return OperatorViewModel(p1: ["1", "0", "3", "4"], p2: ["0", "5", "0", "0"],  op: "p1.merge(p2)", out:  ["1", "5", "3", "4"])
    }

    static var zip: OperatorViewModel {
        return OperatorViewModel(p1: ["1", "0", "3", "0"], p2: ["0", "5", "0", "7"],  op: "p1.zip(p2)", out:  ["0", "(1, 5)", "0", "(3, 7)"])
    }


    static var flatMap: OperatorViewModel {
        return OperatorViewModel(p1: ["[1, 2]", "0", "[3]", "[4]"], op: "flatMap { $0.publisher }", out:  ["1", "2", "3", "4"])
    }

    static var switchToLatest: OperatorViewModel {
        return OperatorViewModel(p1: ["1", "2", "0", "4"], p2: ["0", "0", "5", "0"], op: "switchToLatest()", out:  ["1", "2", "5", "0"])
    }

}
