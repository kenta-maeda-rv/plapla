//
//  OffsetPageTabView.swift
//  VASvaluation
//
//  Created by まえけん on 2021/10/17.
//  Copyright © 2021 maeken. All rights reserved.
//

import SwiftUI

struct OffsetPageTabView<Content: View>: UIViewRepresentable {
    var content: Content
    @Binding var offset: CGFloat

    func makeCoordinator() -> Coordinator {
        OffsetPageTabView.Coordinator(parent: self)
    }

    init(offset: Binding<CGFloat>, @ViewBuilder content: @escaping () -> Content) {
        self.content = content()
        _offset = offset
    }

    func makeUIView(context: Context) -> UIScrollView {
        let scrollview = UIScrollView()

        let hostView = UIHostingController(rootView: content)
        hostView.view.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            hostView.view.topAnchor.constraint(equalTo: scrollview.topAnchor),
            hostView.view.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor),
            hostView.view.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor),
            hostView.view.bottomAnchor.constraint(equalTo: scrollview.bottomAnchor),

            hostView.view.heightAnchor.constraint(equalTo: scrollview.heightAnchor),
        ]

        scrollview.addSubview(hostView.view)
        scrollview.addConstraints(constraints)

        scrollview.isPagingEnabled = true
        scrollview.showsVerticalScrollIndicator = false
        scrollview.showsHorizontalScrollIndicator = false

        scrollview.delegate = context.coordinator

        return scrollview
    }

    func updateUIView(_ uiView: UIScrollView, context _: Context) {
        let currentOffset = uiView.contentOffset.x

        if currentOffset != offset {
            uiView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
        }
    }

    class Coordinator: NSObject, UIScrollViewDelegate {
        var parent: OffsetPageTabView

        init(parent: OffsetPageTabView) {
            self.parent = parent
        }

        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let offset = scrollView.contentOffset.x

            parent.offset = offset
        }
    }
}
