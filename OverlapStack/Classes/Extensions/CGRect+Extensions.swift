//
//  CGRect+Extensions.swift
//  Pods
//
//  Created by Nayanda Haberty on 24/12/24.
//

import SwiftUI

extension CGRect {
    @inlinable var circlingAxisSize: CGSize {
        CGSize(
            width: max(abs(minX), maxX) * 2,
            height: max(abs(minY), maxY) * 2
        )
    }
}
