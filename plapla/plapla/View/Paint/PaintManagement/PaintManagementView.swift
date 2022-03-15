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
                Text(data.colorName)
            }
        }
    }
}

struct PaintManagementView_Previews: PreviewProvider {
    static var previews: some View {
        PaintManagementView()
    }
}
