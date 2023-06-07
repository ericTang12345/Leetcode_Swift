//
//  13. Roman to Integer.swift
//  
//
//  Created by ShaoHuan Tang on 2023/3/5.
//

import Foundation

class Solution {
    
    func romanToInt(_ s: String) -> Int {
        var romanNumerals: [RomanNumeral] = .init(s)
        var num = 0
        while romanNumerals.isEmpty != true {
            if romanNumerals.count == 1 {
                num += romanNumerals[0].value
                romanNumerals.removeFirst()
                break
            }
            
            if romanNumerals[0].needsContinuationCalculation(next: romanNumerals[1]) {
                num += romanNumerals[1].value - romanNumerals[0].value
                romanNumerals.removeFirst()
                romanNumerals.removeFirst()
            } else {
                num += romanNumerals[0].value
                romanNumerals.removeFirst()
            }
        }

        return num
    }
}

enum RomanNumeral: String {
    case i = "I"
    case v = "V"
    case x = "X"
    case l = "L"
    case c = "C"
    case d = "D"
    case m = "M"
    
    var value: Int {
        switch self {
        case .i: return 1
        case .v: return 5
        case .x: return 10
        case .l: return 50
        case .c: return 100
        case .d: return 500
        case .m: return 1000
        }
    }
    
    func needsContinuationCalculation(next: RomanNumeral) -> Bool {
        switch self {
        case .i:
            return next == .v || next == .x
        case .x:
            return next == .l || next == .c
        case .c:
            return next == .d || next == .m
        default:
            return false
        }
    }
}

extension Array where Element == RomanNumeral {
    
    init(_ s: String) {
        self.init()
        var romanNumerals: [RomanNumeral] = []
        for char in s {
            if let romanNumeral = RomanNumeral(rawValue: String(char)) {
                romanNumerals.append(romanNumeral)
            }
        }
        self = romanNumerals
    }
}
