//
//  PaintDetailView.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 15/03/2022.
//  Copyright 2022 raven. All rights reserved.
//

import SwiftUI

struct PaintDetailView: View {
    @StateObject var viewModel: PaintDetailViewModel = PaintDetailViewModel()
    @Environment(\.presentationMode) var presentation
    
    @State var SliderValue: Double = 0
    
    let colorName: String
    let color: UIColor
    let brand: String
    let type: String
    let solvent: String
    let finish: String
    
    var body: some View {
        VStack{
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
            Text("残量:\(SliderValue)%")
            Slider(value: $SliderValue, in: 0...10)
            
            Button(action: {
                self.presentation.wrappedValue.dismiss()
            }) {
                Text("保存")
            }
        }
        .navigationTitle(colorName)
    }
}

struct PaintDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PaintDetailView(colorName: PaintColor.gray.colorString,
                        color: PaintColor.gray.color,
                        brand: PaintBrand.gaiaColor.rawValue,
                        type: PaintType.solvent.rawValue,
                        solvent: Solvent.alcohol.rawValue,
                        finish: Finish.clearColor.rawValue)
    }
}
