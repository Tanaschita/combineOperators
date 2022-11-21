//
//  Triangle.swift
//  CombineOperators
//
//  Created by Natascha Fadeeva on 19.11.22.
//

import SwiftUI

struct ArrowView: View {

    private func arrowPath() -> Path {
        Path { path in
            path.move(to: .zero)
            path.addLine(to: .init(x: -10.0, y: 5.0))
            path.addLine(to: .init(x: -10.0, y: -5.0))
            path.closeSubpath()
        }
    }

    var body: some View {
        HStack(spacing: 0) {
            Rectangle()
                .fill(.black)
                .frame(width: 500, height: 3)
            Triangle()
                .fill(.black)
                .frame(width: 10, height: 10)
        }
    }
}

struct Triangle: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        return path
    }
}
