//
//  PaintAddView.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 15/03/2022.
//  Copyright 2022 raven. All rights reserved.
//

import SwiftUI

struct PaintAddView: View {
    @StateObject var viewModel: PaintAddViewModel = PaintAddViewModel()
    
    var body: some View {
        VStack {
            Text("PaintAdd")
        }
    }
}

struct PaintAddView_Previews: PreviewProvider {
    static var previews: some View {
        PaintAddView()
    }
}
