//
//  PaintManagementView.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 15/03/2022.
//  Copyright 2022 raven. All rights reserved.
//

import SwiftUI
import RealmSwift

struct PaintManagementView: View {
    @StateObject var viewModel: PaintManagementViewModel = PaintManagementViewModel()
    
    @State var showPaintDetailView = false
    @State var paintDatas: [Paint] = []
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(paintDatas) { data in
                    NavigationLink(destination: PaintDetailView(SliderValue: data.quantity,
                                                                paintDatas: data)) {
                        PaintView(colorName: data.colorName!,
                                  ProgressValue: data.quantity)
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
                PaintAddView(paintDatas: $paintDatas)
            }
            .onAppear {
                self.paintDatas = RepogitoryManager.shared.getPaintData()
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
    let ProgressValue: Double
    
    var body: some View {
        HStack(alignment:.center) {
            Rectangle()
                .fill(Color(PaintUIColorDic[colorName]!))
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
                    
                    ProgressView(value: ProgressValue / 100)
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
