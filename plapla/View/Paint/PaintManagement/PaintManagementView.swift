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
        HStack(alignment:.center) {
            Rectangle()
                .fill(Color(color))
                .frame(width: 50, height: 50)
                .cornerRadius(15)
                .padding(16)
            
            GeometryReader { geometry in
                HStack {
                    Text(colorName)
                        .foregroundColor(.primary)
                        .font(.body)
                        .frame(width:  geometry.size.width / 3,
                               height:  geometry.size.height,
                               alignment: .leading)
                    
                    ProgressView(value: 0.5)
                        .frame(height:  geometry.size.height,
                               alignment: .center)
                        .padding(.horizontal,10)
                }
            }
        }
        .background(.white)
        .cornerRadius(15)
        .shadow(color: .gray.opacity(0.5), radius: 15)
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
    }
}
