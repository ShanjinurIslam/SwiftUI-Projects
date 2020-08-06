//
//  KeyboardResponder.swift
//  Weather
//
//  Created by Shanjinur Islam on 7/26/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

import SwiftUI

final class KeyboardResponder:ObservableObject{
    @Published private(set) var currentHeight: CGFloat = 0
    private var notificationCenter: NotificationCenter
    
    init(center: NotificationCenter = .default) {
        notificationCenter = center
        notificationCenter.addObserver(self, selector: #selector(keyBoardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        notificationCenter.addObserver(self, selector: #selector(keyBoardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    deinit {
        notificationCenter.removeObserver(self)
    }
    
    @objc func keyBoardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            currentHeight = 0.5*keyboardSize.height
        }
    }
    
    @objc func keyBoardWillHide(notification: Notification) {
        currentHeight = 0
    }

}
