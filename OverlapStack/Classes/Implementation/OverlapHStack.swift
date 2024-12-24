//
//  OverlapHStack.swift
//  Pods
//
//  Created by Nayanda Haberty on 22/12/24.
//

import SwiftUI

public struct OverlapHStack<Content>: View where Content: View {
    
    let alignment: OverlapStackAlignment
    let direction: OverlapDirection
    let defaultOverlapOffset: CGFloat
    
    private let content: () -> Content
    
    public var body: some View {
        OverlapHStackLayout(alignment: alignment, direction: direction, defaultOverlapOffset: defaultOverlapOffset) {
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

private func hStack(alignment: OverlapStackAlignment) -> some View {
    ScrollView(.horizontal) {
        OverlapHStack(alignment: alignment) {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.red)
                .frame(width: 100, height: 300)
                .shadow(radius: 9)
                .alignmentOffset(12)
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.orange)
                .frame(width: 100, height: 300)
                .shadow(radius: 9)
                .alignmentOffset(-12)
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.yellow)
                .frame(width: 100, height: 300)
                .shadow(radius: 9)
                .overlapOffset(12)
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.green)
                .frame(width: 100, height: 300)
                .shadow(radius: 9)
                .expanded(true, leading: 12, trailing: 12)
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.cyan)
                .frame(width: 100, height: 300)
                .shadow(radius: 9)
                .expanded(true, trailing: 12)
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.blue)
                .frame(width: 100, height: 300)
                .shadow(radius: 9)
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.purple)
                .frame(width: 100, height: 300)
                .shadow(radius: 9)
        }
        .padding()
    }
}

#Preview("leading") {
    hStack(alignment: .leading)
}

#Preview("centered") {
    hStack(alignment: .centered)
}

#Preview("trailing") {
    hStack(alignment: .trailing)
}
#endif
