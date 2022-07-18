//
//  NotificationView.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 15/03/2022.
//  Copyright 2022 raven. All rights reserved.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        List {
            Section(content: {
                Text("アップデート")
            }, header: {
                Text("各種設定")
            })
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
