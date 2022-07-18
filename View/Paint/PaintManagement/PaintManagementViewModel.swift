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
              brand: PaintBrand.gaiaColor.rawValue,
              type: PaintType.solvent.rawValue,
              solvent: Solvent.alcohol.rawValue,
              finish: Finish.clearColor.rawValue),
        
        Paint(colorName: PaintColor.green.colorString,
              color: PaintColor.green.color,
              brand: PaintBrand.MMP.rawValue,
              type: PaintType.bottle.rawValue,
              solvent: Solvent.lacquer.rawValue,
              finish: Finish.luminousColor.rawValue)
    
    ]
}
