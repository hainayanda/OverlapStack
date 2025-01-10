//
//  CGFloat+Extensions.swift
//  Pods
//
//  Created by Nayanda Haberty on 23/12/24.
//

import SwiftUI

// MARK: CGFloat + Extensions

extension CGFloat {
    /// Return zero if the value is not positive or normal
    @inlinable var positiveNormalizedValue: CGFloat {
        guard self.isNormal, self >= .zero else { return .zero }
        return self
    }
}

// MARK: Optional<CGFloat> + Extensions

extension Optional where Wrapped == CGFloat {
    /// Return zero if the value is not positive or normal
    @inlinable var positiveNormalizedValue: CGFloat {
        switch self {
        case .none: return .zero
        case .some(let value): return value.positiveNormalizedValue
        }
    }
}
