//
//  Untitled.swift
//  OverlapStack
//
//  Created by Nayanda Haberty on 10/01/25.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import SwiftUI
import OverlapStack

struct OverlapCardView: View {
    
    var colors: [DemoItem] = .dummies
    
    @State var selectedId: Int?
    
    var body: some View {
        OverlapHStack {
            Text("Card 1")
                .frame(width: 210, height: 120)
                .background(Color.purple)
                .cornerRadius(10)
            Text("Card 1")
                .frame(width: 225, height: 130)
                .background(Color.blue)
                .cornerRadius(10)
            Text("Card 1")
                .frame(width: 240, height: 140)
                .background(Color.cyan)
                .cornerRadius(10)
            Text("Card 2")
                .frame(width: 255, height: 150)
                .background(Color.green)
                .cornerRadius(10)
                .expandOverlap(true, trailing: 15)
            Text("Card 3")
                .frame(width: 270, height: 160)
                .background(Color.yellow)
                .cornerRadius(10)
            Text("Card 4")
                .frame(width: 285, height: 170)
                .background(Color.orange)
                .cornerRadius(10)
            Text("Card 5")
                .frame(width: 300, height: 180)
                .background(Color.red)
                .cornerRadius(10)
        }
    }
}

struct DemoItem: Hashable, Identifiable {
    let id: Int
    let color: Color
}

extension Array where Element == DemoItem {
    static var dummies: [DemoItem] {
        let base: [Color] = [.red, .orange, .yellow, .green, .cyan, .blue, .purple]
        let repeatedBases: [Color] = base + base + base + base + base + base + base
        return repeatedBases
            .enumerated()
            .map { DemoItem(id: $0.offset, color: $0.element)}
    }
}

#Preview {
    OverlapCardView()
}
