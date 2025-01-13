//
//  OverlapVStack.swift
//  Pods
//
//  Created by Nayanda Haberty on 22/12/24.
//

import SwiftUI

// MARK: OverlapVStack

/// View that will arrange it's subview in overlapping vertical stack
public struct OverlapVStack<Content>: View where Content: View {
    
    // MARK: Properties
    
    let alignment: OverlapVStackAlignment
    let arrangement: VerticalOverlapArrangement
    let defaultOverlapOffset: CGFloat
    
    private let content: () -> Content
    
    // MARK: Body
    
    public var body: some View {
        switch arrangement {
        case .stackedFromBottom:
            OverlapReverseVStackLayout(alignment: alignment, defaultOverlapOffset: defaultOverlapOffset) {
                content()
            }
        case .stackedFromTop:
            OverlapVStackLayout(alignment: alignment, defaultOverlapOffset: defaultOverlapOffset) {
                content()
            }
        }
    }
    
    // MARK: Init
    
    /// Initialize OverlapVStack, view that will arrange it's subview in overlapping stack
    /// - Parameters:
    ///   - alignment: alignment of the stack, default is centered
    ///   - arrangement: arrangement of the view, default is stackedFromTop
    ///   - defaultOffset: default offset from each overlapping view, default is 24
    ///   - content: the view content
    public init(
        alignment: OverlapVStackAlignment = .centered,
        arrangement: VerticalOverlapArrangement = .stackedFromTop,
        defaultOffset: CGFloat = 24,
        @ViewBuilder content: @escaping () -> Content) {
            self.alignment = alignment
            self.arrangement = arrangement
            self.content = content
            self.defaultOverlapOffset = defaultOffset
        }
}

// MARK: Preview
#if DEBUG

private func vStack(alignment: OverlapVStackAlignment, arrangement: VerticalOverlapArrangement) -> some View {
    ScrollView(.vertical) {
        OverlapVStack(alignment: alignment, arrangement: arrangement) {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.red)
                .frame(width: 300, height: 100)
                .shadow(radius: 9)
                .overlapAlignmentOffset(12)
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.orange)
                .frame(width: 300, height: 100)
                .shadow(radius: 9)
                .overlapAlignmentOffset(-12)
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.yellow)
                .frame(width: 300, height: 100)
                .shadow(radius: 9)
                .overlapOffset(12)
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.green)
                .frame(width: 300, height: 100)
                .shadow(radius: 9)
                .expandOverlap(true, leading: 12, trailing: 12)
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.cyan)
                .frame(width: 300, height: 100)
                .shadow(radius: 9)
                .expandOverlap(true, trailing: 12)
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

#Preview("leading bottomToTop") {
    vStack(alignment: .leading, arrangement: .stackedFromBottom)
}

#Preview("centered bottomToTop") {
    vStack(alignment: .centered, arrangement: .stackedFromBottom)
}

#Preview("trailing bottomToTop") {
    vStack(alignment: .trailing, arrangement: .stackedFromBottom)
}

#Preview("leading topToBottom") {
    vStack(alignment: .leading, arrangement: .stackedFromTop)
}

#Preview("centered topToBottom") {
    vStack(alignment: .centered, arrangement: .stackedFromTop)
}

#Preview("trailing topToBottom") {
    vStack(alignment: .trailing, arrangement: .stackedFromTop)
}
#endif
