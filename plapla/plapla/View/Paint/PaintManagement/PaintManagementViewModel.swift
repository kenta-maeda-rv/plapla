//
//  PaintManagementViewModel.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 15/03/2022.
//  Copyright 2022 raven. All rights reserved.
//

import SwiftUI

class PaintManagementViewModel: ObservableObject {
    
    @Published var paintDatas:[Paint] = [
        Paint(color: .blue, brand: .gaiaColor, type: .solvent, solvent: .alcohol, finish: .clearColor)
    
    ]
}
