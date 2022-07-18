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
    
    @State var showPaintDetailView = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.paintDatas) { data in
                    NavigationLink(destination: PaintDetailView(colorName: data.colorName,
                                                                color: data.color,
                                                                brand: data.brand,
                                                                type: data.type,
                                                                solvent: data.solvent,
                                                                finish: data.finish)) {
                        PaintView(colorName: data.colorName,
                                  color: data.color,
                                  brand: data.brand,
                                  type: data.type,
                                  solvent: data.solvent,
                                  finish: data.finish)
                    }
                }
            }
            .navigationTitle("塗料管理")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        showPaintDetailView = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showPaintDetailView) {
                PaintAddView()
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
