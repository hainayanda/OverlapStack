//
//  CGRect+Extensions.swift
//  Pods
//
//  Created by Nayanda Haberty on 24/12/24.
//

import SwiftUI

extension CGRect {
    /// Rotate the rectangle along x and y axis and calculate the projected size in x,y coordinate
    @inlinable var axisRotationalSize: CGSize {
        CGSize(
            width: max(abs(minX), maxX) * 2,
            height: max(abs(minY), maxY) * 2
        )
    }
}
