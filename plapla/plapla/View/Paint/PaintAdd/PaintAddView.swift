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
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("塗料カラー名")
                    
                    Spacer()
                    
                    Picker(selection: .constant(1), label: Text("色名")) {
                        ForEach(PaintColor.allCases, id: \.self) { color in
                            Text(color.colorString).tag(color)
                        }
                    }
                }
                HStack {
                    Text("ブランド")
                    
                    Spacer()
                    
                    Picker(selection: .constant(1), label: Text("ブランド")) {
                        ForEach(PaintBrand.allCases, id: \.self) { brand in
                            Text(brand.rawValue).tag(brand)
                        }
                    }
                }
                HStack {
                    Text("タイプ")
                    
                    Spacer()
                    
                    Picker(selection: .constant(1), label: Text("タイプ")) {
                        ForEach(PaintType.allCases, id: \.self) { type in
                            Text(type.rawValue).tag(type)
                        }
                    }
                }
                HStack {
                    Text("溶剤")
                    
                    Spacer()
                    
                    Picker(selection: .constant(1), label: Text("溶剤")) {
                        ForEach(Solvent.allCases, id: \.self) { solvent in
                            Text(solvent.rawValue).tag(solvent)
                        }
                    }
                }
                HStack {
                    Text("仕上がり")
                    
                    Spacer()
                    
                    Picker(selection: .constant(1), label: Text("仕上がり")) {
                        ForEach(Finish.allCases, id: \.self) { finish in
                            Text(finish.rawValue).tag(finish)
                        }
                    }
                }
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("保存")
                }
            }
            .navigationBarTitle(Text("塗料追加"),
                                displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("閉じる")
                    }
                }
            }
        }
    }
}

struct PaintAddView_Previews: PreviewProvider {
    static var previews: some View {
        PaintAddView()
    }
}
