//
//  BadgeBackground.swift
//  Landmarks
//
//  Created by MGBook on 2020/4/14.
//  Copyright © 2020 MGBook. All rights reserved.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                //view 不是正方形时，使用几何体最小的的两个维度可以在保证宽高比
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                // xScale 和 xOffset 调整变量将徽章置于其几何体中心
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1 - xScale)) / 2
                width *= xScale
                
                path.move(
                    to: CGPoint(
                        x: xOffset + width * 0.95,
                        y: height * (0.20 + HexagonParameters.adjustment)
                    )
                )
                
                HexagonParameters.points.forEach {
                    path.addLine(
                        to: .init(
                            x: xOffset + width * $0.useWidth.0 * $0.xFactors.0,
                            y: height * $0.useHeight.0 * $0.yFactors.0
                        )
                    )
                    
                    path.addQuadCurve(
                        to: .init(
                            x: xOffset + width * $0.useWidth.1 * $0.xFactors.1,
                            y: height * $0.useHeight.1 * $0.yFactors.1
                        ),
                        control: .init(
                            x: xOffset + width * $0.useWidth.2 * $0.xFactors.2,
                            y: height * $0.useHeight.2 * $0.yFactors.2
                        )
                    )
                }
            }
            .fill(
                //背景的纯黑色改成渐变色
                // Color.black
                LinearGradient(
                    gradient: .init(colors: [Self.gradientStart, Self.gradientEnd]),
                    startPoint: .init(x: 0.5, y: 0),
                    endPoint: .init(x: 0.5, y: 0.6)
            ))
                //即使徽章的父项不是正方形，也可以通过保持1：1的宽高比，让徽章处于视图中心的位置
                .aspectRatio(1, contentMode: .fit)
        }
    }
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
}


struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}
