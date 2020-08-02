//
//  ActivityIndicator.swift
//  Weather
//
//  Created by Shanjinur Islam on 8/2/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    @Binding var shouldAnimate:Bool
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView()
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        if(self.shouldAnimate){
            uiView.startAnimating()
        }
        else{
            uiView.stopAnimating()
        }
    }
}
