//
//  View.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/01/10.
//

import SwiftUI

extension View {
    
    func hLeading() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    func hTrailing() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .trailing)
    }
    func hCenter() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .center)
    }
    
}
