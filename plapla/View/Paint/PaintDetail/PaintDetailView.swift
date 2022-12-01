//
//  PaintDetailView.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 15/03/2022.
//  Copyright 2022 raven. All rights reserved.
//

import SwiftUI

struct PaintDetailView: View {
    @StateObject var viewModel: PaintDetailViewModel = .init()
    @Environment(\.presentationMode) var presentation
    @State var SliderValue: Double

    let paintDatas: Paint

    var body: some View {
        VStack(spacing: 64) {
            VStack(spacing: 32) {
                HStack {
                    Rectangle()
                        .fill(Color(PaintUIColorDic[paintDatas.colorName!]!))
                        .frame(height: 80)
                        .cornerRadius(20)
                    Spacer()
                }
                HStack {
                    Spacer()

                    VStack(spacing: 16) {
                        paintDetailCell(title: "ブランド", detail: paintDatas.brand!)
                        paintDetailCell(title: "タイプ", detail: paintDatas.type!)
                        paintDetailCell(title: "溶剤", detail: paintDatas.solvent!)
                        paintDetailCell(title: "仕上がり", detail: paintDatas.finish!)
                    }
                }
                HStack {
                    Text("残量")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Spacer()
                    Text("\(SliderValue, specifier: "%.0f")%")
                        .font(.title)
                        .bold()
                    Spacer()
                }
                .padding(.horizontal, 8)

                Slider(value: $SliderValue, in: 0 ... 100)
            }

            Button(action: {
                RepogitoryManager.shared.updatePaintQuantityData(id: paintDatas.id,
                                                                 quantity: self.SliderValue)
                self.presentation.wrappedValue.dismiss()
            }) {
                Text("保存")
                    .foregroundColor(.white)
            }
            .padding(150)
            .frame(height: 60)
            .background(Color.accentColor)
            .cornerRadius(15)

            Spacer()
        }
        .padding(.horizontal, 16)
        .navigationTitle(paintDatas.colorName!)
    }

    func paintDetailCell(title: String, detail: String) -> some View {
        HStack {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.gray)
            Spacer()
            Text(detail)
                .font(.title3)
                .bold()
        }
    }
}

struct PaintDetailView_Previews: PreviewProvider {
    @State static var paint: Paint = .init(id: "",
                                           color: .green,
                                           brand: .gundamColor,
                                           type: .bottle,
                                           solvent: .lacquer,
                                           finish: .clearColor,
                                           quantity: 0.5)

    static var previews: some View {
        PaintDetailView(SliderValue: paint.quantity, paintDatas: paint)
    }
}
