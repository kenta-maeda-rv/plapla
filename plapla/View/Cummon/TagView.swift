//
//  TagView.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/09/18.
//

import SwiftUI

struct TagView: View {
    let process: String

    var body: some View {
        VStack {
            Text(process)
                .font(.subheadline)
                .foregroundColor(.white)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 5)
        .background(
            Color.accentColor
        )
        .cornerRadius(10)
        .hLeading()
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView(process: "仮組み")
    }
}
