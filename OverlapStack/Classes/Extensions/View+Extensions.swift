//
//  View+Extensions.swift
//  Pods
//
//  Created by Nayanda Haberty on 03/01/25.
//

import SwiftUI

extension View {
    /// Define offset  between previous view and this view when overlapping in OverlapHStack or OverlapVStack
    /// - Parameter offset: The offset will be used between the views
    /// - Returns: some View
    @inlinable public func overlapOffset(_ offset: CGFloat) -> some View {
        layoutValue(key: OverlapOffset.self, value: offset)
    }
    
    /// Define offset for alignment for this view when arranged using OverlapHStack or OverlapVStack
    /// - Parameter offset: The offset will be used to refine the aligment
    /// - Returns: some View
    @inlinable public func overlapAlignmentOffset(_ offset: CGFloat) -> some View {
        layoutValue(key: AlignmentOffset.self, value: offset)
    }
    
    /// Determine wether the view should be expanded in OverlapHStack or OverlapVStack with custom leading and trailing spacing between previous and next view
    /// - Parameters:
    ///   - isExpanded: if True, then the view will be expanded to make all it's content visible.
    ///   - leading: leading space between this view and previous when expanded, if nil, then it will use overlap offset value
    ///   - trailing: trailing space between this view and next when expanded
    /// - Returns: View with layout value set
    @inlinable public func expandOverlap(_ isExpanded: Bool, leading: CGFloat? = nil, trailing: CGFloat) -> some View {
        let value: ExpandedOffset? = isExpanded ? ExpandedOffset(leading: leading, trailing: trailing) : nil
        return layoutValue(key: ExpandedOffset.self, value: value)
    }
    
    /// Determine wether the view should be expanded in OverlapHStack or OverlapVStack with custom leading and trailing spacing between previous and next view
    /// - Parameters:
    ///   - isExpanded: if True, then the view will be expanded to make all it's content visible.
    ///   - spacing: leading and trailing space between this view to the previous view and next view when expanded.
    /// - Returns: View with layout value set
    @inlinable public func expandOverlap(_ isExpanded: Bool, spacing: CGFloat) -> some View {
        expandOverlap(isExpanded, leading: spacing, trailing: spacing)
    }
}
