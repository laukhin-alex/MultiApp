//
//  SettingsView.swift
//  MultiApp
//
//  Created by Александр on 15.09.2022.
//

import SwiftUI
import SwiftySound

struct SettingsView: View {
@ObservedObject var settings = SettingsViewModal()
    @State var isToggled = true
    var body: some View {
        VStack {
            Text("Settings")
            Toggle("Звук вкл/выкл", isOn: $isToggled).padding(.horizontal).onChange(of: isToggled) { value in
                settings.mute()
            }

            Spacer()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
