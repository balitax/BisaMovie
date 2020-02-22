//
//  Scrollable.swift
//  BisaMovie
//
//  Created by Agus Cahyono on 22/02/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import Foundation

public protocol Scrollable {
    func scrollToTop(animated: Bool)
    func scrollToBottom(animated: Bool)
}
