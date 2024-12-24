//
//  OverlapVStack.swift
//  Pods
//
//  Created by Nayanda Haberty on 22/12/24.
//

import SwiftUI

public struct OverlapVStack<Content>: View where Content: View {
    
    let alignment: OverlapStackAlignment
    let direction: OverlapDirection
    let defaultOverlapOffset: CGFloat
    
    private let content: () -> Content
    
    public var body: some View {
        OverlapVStackLayout(alignment: alignment, direction: direction, defaultOverlapOffset: defaultOverlapOffset) {
            content()
        }
    }
    
    public init(
        alignment: OverlapStackAlignment = .centered,
        direction: OverlapDirection = .lastOnTop,
        overlapOffset: CGFloat = 24,
        @ViewBuilder content: @escaping () -> Content) {
            self.alignment = alignment
            self.direction = direction
            self.content = content
            self.defaultOverlapOffset = overlapOffset
        }
}

// MARK: Preview
#if DEBUG

private func vStack(alignment: OverlapStackAlignment) -> some View {
    ScrollView(.vertical) {
        OverlapVStack(alignment: alignment) {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.red)
                .frame(width: 300, height: 100)
                .shadow(radius: 9)
                .alignmentOffset(12)
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.orange)
                .frame(width: 300, height: 100)
                .shadow(radius: 9)
                .alignmentOffset(-12)
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.yellow)
                .frame(width: 300, height: 100)
                .shadow(radius: 9)
                .overlapOffset(12)
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.green)
                .frame(width: 300, height: 100)
                .shadow(radius: 9)
                .expanded(true, leading: 12, trailing: 12)
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.cyan)
                .frame(width: 300, height: 100)
                .shadow(radius: 9)
                .expanded(true, trailing: 12)
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.blue)
                .frame(width: 300, height: 100)
                .shadow(radius: 9)
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.purple)
                .frame(width: 300, height: 100)
                .shadow(radius: 9)
        }
        .padding()
    }
}

#Preview("leading") {
    vStack(alignment: .leading)
}

#Preview("centered") {
    vStack(alignment: .centered)
}

#Preview("trailing") {
    vStack(alignment: .trailing)
}
#endif
