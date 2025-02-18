//
//  UIOpenTextField.swift
//  NumberTextField
//
//  Created by Michael Centers on 1/15/22.
//

import UIKit

class UIOpenTextField: UITextField {
    override var selectedTextRange: UITextRange? {
        get { return super.selectedTextRange }
        set {
            self.publishCursor(newPosition: newValue)
            super.selectedTextRange = newValue
        }
    }
    
    // MARK: - Cursor Position Change
    var onCursorPositionChange: ((Int) -> ())?
    
    private func publishCursor(newPosition range: UITextRange?) {
        guard let range = range?.start else { return }
        
        let cursorPosition = self.offset(from: self.beginningOfDocument, to: range)
        self.onCursorPositionChange?(cursorPosition)
    }
}
