//
//  CustomOffset.swift
//  Pods
//
//  Created by Nayanda Haberty on 22/12/24.
//

import SwiftUI

@usableFromInline struct OverlapOffset: LayoutValueKey {
    @usableFromInline static let defaultValue: CGFloat? = nil
}

@usableFromInline struct AlignmentOffset: LayoutValueKey {
    @usableFromInline static let defaultValue: CGFloat = .zero
}

@usableFromInline struct ExpandedOffset: LayoutValueKey, Equatable {
    @usableFromInline static let defaultValue: ExpandedOffset? = nil
    
    let leading: CGFloat?
    let trailing: CGFloat
    
    @usableFromInline init(leading: CGFloat?, trailing: CGFloat) {
        self.leading = leading
        self.trailing = trailing
    }
}

extension View {
    @inlinable public func overlapOffset(_ offset: CGFloat) -> some View {
        layoutValue(key: OverlapOffset.self, value: offset)
    }
    
    @inlinable public func alignmentOffset(_ offset: CGFloat) -> some View {
        layoutValue(key: AlignmentOffset.self, value: offset)
    }
    
    @inlinable public func expanded(_ isExpanded: Bool, leading: CGFloat? = nil, trailing: CGFloat) -> some View {
        let value: ExpandedOffset? = isExpanded ? ExpandedOffset(leading: leading, trailing: trailing) : nil
        return layoutValue(key: ExpandedOffset.self, value: value)
    }
    
    @inlinable public func expanded(_ isExpanded: Bool, spacing: CGFloat) -> some View {
        let value: ExpandedOffset? = isExpanded ? ExpandedOffset(leading: spacing, trailing: spacing) : nil
        return layoutValue(key: ExpandedOffset.self, value: value)
    }
}
