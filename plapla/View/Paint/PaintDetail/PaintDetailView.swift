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
    
    let paintDatas: Paint
 
    var body: some View {
        VStack{
            HStack {
                Rectangle()
                    .fill(Color(PaintUIColorDic[paintDatas.colorName!]!))
                    .frame(width: 50, height: 50)
                
                VStack {
                    Text(paintDatas.colorName!)
                }
                
                Spacer()
                
                VStack {
                    Text(paintDatas.brand!)
                    Text(paintDatas.type!)
                    Text(paintDatas.solvent!)
                    Text(paintDatas.finish!)
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
        .navigationTitle(paintDatas.colorName!)
    }
}

struct PaintDetailView_Previews: PreviewProvider {
    @State static var paint: Paint = Paint(id: "",
                                           color: .green,
                                           brand: .gundamColor,
                                           type: .bottle,
                                           solvent: .lacquer,
                                           finish: .clearColor)
    
    static var previews: some View {
        PaintDetailView(paintDatas: paint)
    }
}
