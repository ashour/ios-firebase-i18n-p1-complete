//
//  Locale+.swift
//  discounter-demo
//
//  Created by Mohammad Ashour on 2019-04-08.
//  Copyright © 2019 Mohammad Ashour. All rights reserved.
//

import Foundation

extension Locale
{
    var isRightToLeft: Bool
    {
        get
        {
            if let languageCode = self.languageCode
            {
                return Locale.characterDirection(forLanguage: languageCode) ==
                    .rightToLeft
            }
            
            return false
        }
    }
}
