//
//  OverlapHStack.swift
//  Pods
//
//  Created by Nayanda Haberty on 22/12/24.
//

import SwiftUI

// MARK: OverlapHStack

/// View that will arrange it's subview in overlapping horizontal stack
public struct OverlapHStack<Content>: View where Content: View {
    
    // MARK: Properties
    
    let alignment: OverlapHStackAlignment
    let arrangement: HorizontalOverlapArrangement
    let defaultOverlapOffset: CGFloat
    
    private let content: () -> Content
    
    // MARK: Body
    
    public var body: some View {
        switch arrangement {
        case .stackedFromTrailing:
            OverlapReverseHStackLayout(alignment: alignment, defaultOverlapOffset: defaultOverlapOffset) {
                content()
            }
        case .stackedFromLeading:
            OverlapHStackLayout(alignment: alignment, defaultOverlapOffset: defaultOverlapOffset) {
                content()
            }
        }
    }
    
    // MARK: Init
    
    /// Initialize OverlapHStack, view that will arrange it's subview in overlapping stack
    /// - Parameters:
    ///   - alignment: alignment of the stack, default is centered
    ///   - arrangement: arrangement of the view, default is stackedFromTrailing
    ///   - defaultOffset: default offset from each overlapping view, default is 24
    ///   - content: the view content
    public init(
        alignment: OverlapHStackAlignment = .centered,
        arrangement: HorizontalOverlapArrangement = .stackedFromTrailing,
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

private func hStack(alignment: OverlapHStackAlignment, arrangement: HorizontalOverlapArrangement) -> some View {
    ScrollView(.horizontal) {
        OverlapHStack(alignment: alignment, arrangement: arrangement) {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.red)
                .frame(width: 100, height: 300)
                .shadow(radius: 9)
                .overlapAlignmentOffset(12)
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.orange)
                .frame(width: 100, height: 300)
                .shadow(radius: 9)
                .overlapAlignmentOffset(-12)
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.yellow)
                .frame(width: 100, height: 300)
                .shadow(radius: 9)
                .overlapOffset(12)
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.green)
                .frame(width: 100, height: 300)
                .shadow(radius: 9)
                .expandOverlap(true, leading: 12, trailing: 12)
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.cyan)
                .frame(width: 100, height: 300)
                .shadow(radius: 9)
                .expandOverlap(true, trailing: 12)
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

#Preview("top leadingToTrailing") {
    hStack(alignment: .top, arrangement: .stackedFromLeading)
}

#Preview("centered leadingToTrailing") {
    hStack(alignment: .centered, arrangement: .stackedFromLeading)
}

#Preview("bottom leadingToTrailing") {
    hStack(alignment: .bottom, arrangement: .stackedFromLeading)
}

#Preview("top trailingToLeading") {
    hStack(alignment: .top, arrangement: .stackedFromTrailing)
}

#Preview("centered trailingToLeading") {
    hStack(alignment: .centered, arrangement: .stackedFromTrailing)
}

#Preview("bottom trailingToLeading") {
    hStack(alignment: .bottom, arrangement: .stackedFromTrailing)
}
#endif
