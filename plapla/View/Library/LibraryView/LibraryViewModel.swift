//
//  LibraryViewModel.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/01/16.
//

import SwiftUI

class LibraryViewModel: ObservableObject {
    
    @Published var columns: [GridItem] = [GridItem(),GridItem()]
}
