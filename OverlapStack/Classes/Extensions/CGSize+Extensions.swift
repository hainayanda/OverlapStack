//
//  CGSize+Extensions.swift
//  Pods
//
//  Created by Nayanda Haberty on 24/12/24.
//

import SwiftUI

// MARK: CGSize + Extensions

extension CGSize {
    /// Check if this size is valid for rendering
    @inlinable var isRenderable: Bool {
        width.isNormal && height.isNormal && width > .zero && height > .zero
    }
}
