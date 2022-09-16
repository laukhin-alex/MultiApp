//
//  SettingsViewModal.swift
//  MultiApp
//
//  Created by Александр on 15.09.2022.
//

import Foundation
import SwiftySound

class SettingsViewModal: ObservableObject {
   @Published var isOn = Sound.enabled

    func mute() -> Bool {
        if isOn == true {
            isOn = false
            print(isOn)
        } else {
            isOn = true
            print(isOn)
        }
        return isOn
    }
}
