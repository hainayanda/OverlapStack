//
//  CGFloat+Extensions.swift
//  Pods
//
//  Created by Nayanda Haberty on 23/12/24.
//

import SwiftUI

extension Optional where Wrapped == CGFloat {
    @inlinable var normalValue: CGFloat {
        guard let self else { return .zero }
        return self.isNormal ? self : .zero
    }
}
