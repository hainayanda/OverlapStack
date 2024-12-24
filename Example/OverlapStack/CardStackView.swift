//
//  CardStackView.swift
//  OverlapStack
//
//  Created by Nayanda Haberty on 22/12/24.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import SwiftUI
import OverlapStack

struct CardStackView: View {
    
    @State var selectedIndex: Int?
    let colors: [Color] = [.red, .orange, .yellow, .green, .cyan, .blue, .purple]
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.vertical) {
                OverlapVStack(alignment: .centered, direction: .lastOnTop, overlapOffset: 48) {
                    ForEach(0..<20) { index in
                        CardView(index: index, color: colors[index % colors.count], selected: selectedIndex == index)
                            .expanded(selectedIndex == index, spacing: 12)
                            .id(index)
                            .onTapGesture {
                                withAnimation(.snappy) {
                                    selectedIndex = selectedIndex == index ? nil : index
                                    proxy.scrollTo(index, anchor: .center)
                                }
                            }
                    }
                }
            }
        }
    }
}

struct CardView: View {
    
    let index: Int
    let color: Color
    let selected: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Card \(index)")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
            }
            .frame(maxWidth: 300)
            Spacer().frame(height: 18)
            if selected {
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                    .foregroundColor(.white)
                    .font(.body)
                    .fontWeight(.regular)
                    .frame(maxWidth: 310)
            }
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(color)
                .shadow(radius: 9)
        }
    }
    
}
