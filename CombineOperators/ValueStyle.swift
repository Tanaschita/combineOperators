//
//  ValueStyle.swift
//  CombineOperators
//
//  Created by Natascha Fadeeva on 19.11.22.
//

import SwiftUI

struct ValueStyle {

    let fillColor: Color
    let borderColor: Color
    let textColor: Color

    static func font(for value: String) -> Font {
        if value.count > 2 {
            return .title
        }
        if value.count > 5 {
            return .body
        }
        return .largeTitle
    }

    static func style(for value: String) -> ValueStyle {
        let borderColor: Color
        let fillColor: Color
        var textColor: Color = .white

        switch value {
        case "|":
            borderColor = Color(hex: 0xFFFFFF, alpha: 0)
            fillColor = Color(hex: 0xFFFFFF, alpha: 0)
            textColor = Color(hex: 0x000000)
        case "nil":
            borderColor = Color(hex: 0xFFFFFF)
            fillColor = Color(hex: 0x677799)
        case "0":
            borderColor = Color(hex: 0xFFFFFF, alpha: 0)
            fillColor = Color(hex: 0xFFFFFF, alpha: 0)
            textColor = Color(hex: 0xFFFFFF, alpha: 0)
        case "1":
            borderColor = Color(hex: 0x7a6966)
            fillColor = Color(hex: 0x8f7975)
        case "2":
            borderColor = Color(hex: 0x965d51)
            fillColor = Color(hex: 0xb57062)
        case "3":
            borderColor = Color(hex: 0x80415f)
            fillColor = Color(hex: 0x9c5175)
        case "4":
            borderColor = Color(hex: 0x61876c)
            fillColor = Color(hex: 0x76a383)
        case "5":
            borderColor = Color(hex: 0x638079)
            fillColor = Color(hex: 0x7ea39b)
        case "6":
            borderColor = Color(hex: 0x6a4e7a)
            fillColor = Color(hex: 0x89679e)
        case "7":
            borderColor = Color(hex: 0x65808c)
            fillColor = Color(hex: 0x7695a3)
        case "8":
            borderColor = Color(hex: 0x8f4d4d)
            fillColor = Color(hex: 0xa65858)
        case "10":
            borderColor = Color(hex: 0x638079)
            fillColor = Color(hex: 0x7ea39b)
        default:
            return ValueStyle.style(for: String(Int.random(in: 5...8)))
        }

        return ValueStyle(fillColor: fillColor, borderColor: borderColor, textColor: textColor)
    }
}
