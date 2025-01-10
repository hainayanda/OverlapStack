//
//  LayoutSubview+Extensions.swift
//  Pods
//
//  Created by Nayanda Haberty on 03/01/25.
//

import SwiftUI

extension LayoutSubview {
    @inlinable var alignmentOffset: CGFloat { self[AlignmentOffset.self] }
    @inlinable var expandedOffset: ExpandedOffset? { self[ExpandedOffset.self] }
    @inlinable var overlapOffset: CGFloat? { self[OverlapOffset.self] }
}
