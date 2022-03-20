//
//  PaintManagementView.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 15/03/2022.
//  Copyright 2022 raven. All rights reserved.
//

import SwiftUI

struct PaintManagementView: View {
    @StateObject var viewModel: PaintManagementViewModel = PaintManagementViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.paintDatas) { data in
                PaintView(colorName: data.colorName,
                          color: data.color,
                          brand: data.brand,
                          type: data.type,
                          solvent: data.solvent,
                          finish: data.finish)
            }
        }
    }
}

struct PaintManagementView_Previews: PreviewProvider {
    static var previews: some View {
        PaintManagementView()
    }
}

struct PaintView: View {
    
    let colorName: String
    let color: UIColor
    let brand: String
    let type: String
    let solvent: String
    let finish: String
    
    init(colorName: String,
         color: UIColor,
         brand: String,
         type: String,
         solvent: String,
         finish: String)
    {
        self.colorName = colorName
        self.color = color
        self.brand = brand
        self.type = type
        self.solvent = solvent
        self.finish = finish
    }
    
    
    var body: some View {
        HStack {
            Rectangle()
                .fill(Color(color))
                .frame(width: 50, height: 50)
            
            VStack {
                Text(colorName)
            }
            
            Spacer()
            
            VStack {
                Text(brand)
                Text(type)
                Text(solvent)
                Text(finish)
            }
            
        }
    }
}
