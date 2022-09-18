//
//  PaintAddView.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 15/03/2022.
//  Copyright 2022 raven. All rights reserved.
//

import SwiftUI

struct PaintAddView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel: PaintAddViewModel = PaintAddViewModel()
    @State var paintColor: PaintColor = .green
    @State var paintBrand: PaintBrand = .gundamColor
    @State var paintType: PaintType = .bottle
    @State var solvent: Solvent = .lacquer
    @State var finish: Finish = .clearColor
    
    @Binding var paintDatas: [Paint]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 80) {
                VStack(spacing: 32) {
                    HStack {
                        Text("塗料カラー名")
                        
                        Spacer()
                        
                        Picker(selection: $paintColor, label: Text("色名")) {
                            ForEach(PaintColor.allCases, id: \.self) { color in
                                Text(color.rawValue).tag(color)
                            }
                        }
                    }
                    HStack {
                        Text("ブランド")
                        
                        Spacer()
                        
                        Picker(selection: $paintBrand, label: Text("ブランド")) {
                            ForEach(PaintBrand.allCases, id: \.self) { brand in
                                Text(brand.rawValue).tag(brand)
                            }
                        }
                    }
                    HStack {
                        Text("タイプ")
                        
                        Spacer()
                        
                        Picker(selection: $paintType, label: Text("タイプ")) {
                            ForEach(PaintType.allCases, id: \.self) { type in
                                Text(type.rawValue).tag(type)
                            }
                        }
                    }
                    HStack {
                        Text("溶剤")
                        
                        Spacer()
                        
                        Picker(selection: $solvent, label: Text("溶剤")) {
                            ForEach(Solvent.allCases, id: \.self) { solvent in
                                Text(solvent.rawValue).tag(solvent)
                            }
                        }
                    }
                    HStack {
                        Text("仕上がり")
                        
                        Spacer()
                        
                        Picker(selection: $finish, label: Text("仕上がり")) {
                            ForEach(Finish.allCases, id: \.self) { finish in
                                Text(finish.rawValue).tag(finish)
                            }
                        }
                    }
                }
                Button(action: {
                    RepogitoryManager.shared.savePaintData(color: PaintColor(rawValue: paintColor.rawValue) ?? .green,
                                                           brand: PaintBrand(rawValue: paintBrand.rawValue) ?? .gundamColor,
                                                           type: PaintType(rawValue: paintType.rawValue) ?? .bottle,
                                                           solvent: Solvent(rawValue: solvent.rawValue) ?? .lacquer,
                                                           finish: Finish(rawValue: finish.rawValue) ?? .clearColor)
                    self.paintDatas = RepogitoryManager.shared.getPaintData()
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("保存")
                        .foregroundColor(.white)
                }
                .padding(150)
                .frame(height: 60)
                .background(Color.accentColor)
                .cornerRadius(15)
            }
            .padding(.horizontal, 16)
            .navigationBarTitle(Text("塗料追加"),
                                displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("閉じる")
                            .foregroundColor(.primary)
                    }
                }
            }
        }
    }
}

struct PaintAddView_Previews: PreviewProvider {
    @State static var paint: [Paint] = [Paint(id: "",
                                              color: .green,
                                              brand: .gundamColor,
                                              type: .bottle,
                                              solvent: .lacquer,
                                              finish: .clearColor)]
    
    static var previews: some View {
        PaintAddView(paintDatas: $paint)
    }
}
