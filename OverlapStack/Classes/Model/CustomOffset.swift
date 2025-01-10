//
//  CustomOffset.swift
//  Pods
//
//  Created by Nayanda Haberty on 22/12/24.
//

import SwiftUI

// MARK: OverlapOffset

@usableFromInline struct OverlapOffset: LayoutValueKey {
    @usableFromInline static let defaultValue: CGFloat? = nil
}

// MARK: AlignmentOffset

@usableFromInline struct AlignmentOffset: LayoutValueKey {
    @usableFromInline static let defaultValue: CGFloat = .zero
}

// MARK: ExpandedOffset

@usableFromInline struct ExpandedOffset: LayoutValueKey, Equatable {
    @usableFromInline static let defaultValue: ExpandedOffset? = nil
    
    let leading: CGFloat?
    let trailing: CGFloat
    
    @usableFromInline init(leading: CGFloat?, trailing: CGFloat) {
        self.leading = leading
        self.trailing = trailing
    }
}
