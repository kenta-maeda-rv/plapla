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
        Paint(colorName: PaintColor.gray.colorString,
              color: PaintColor.gray.color,
              brand: PaintBrand.gaiaColor,
              type: PaintType.solvent,
              solvent: Solvent.alcohol,
              finish: Finish.clearColor),
        
        Paint(colorName: PaintColor.green.colorString,
              color: PaintColor.green.color,
              brand: PaintBrand.MMP,
              type: PaintType.bottle,
              solvent: Solvent.lacquer,
              finish: Finish.luminousColor)
    
    ]
}
