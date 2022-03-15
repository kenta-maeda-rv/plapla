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
    
    var body: some View {
        VStack {
            Text("PaintDetail")
        }
    }
}

struct PaintDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PaintDetailView()
    }
}
