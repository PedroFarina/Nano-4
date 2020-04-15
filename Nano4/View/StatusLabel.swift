//
//  StatusLabel.swift
//  Nano4
//
//  Created by Pedro Giuliano Farina on 15/04/20.
//  Copyright © 2020 Pedro Giuliano Farina. All rights reserved.
//

import UIKit

public class StatusLabel: UILabel {
    public var ignoreMessages: Bool = false {
        didSet {
            DispatchQueue.main.async {
                if self.ignoreMessages {
                    self.isHidden = true
                }
            }
        }
    }

    func showMessage(_ message: String) {
        showMessage(message, for: 1)
    }

    func showMessage(_ message: String, for duration: TimeInterval) {
        guard !ignoreMessages else {
            return
        }

        isHidden = false
        text = message
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            if self.text == message {
                self.isHidden = true
                self.text = ""
            }
        }
    }
}
