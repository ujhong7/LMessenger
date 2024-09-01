//
//  SettingView.swift
//  LMessenger
//
//  Created by yujaehong on 8/30/24.
//

import SwiftUI

struct SettingView: View {
    
    @AppStorage(AppStorageType.Appearacne) var appearance: Int = UserDefaults.standard.integer(forKey: AppStorageType.Appearacne)
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var appearanceController: AppearanceController
    @StateObject var viewModel: SettingViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.sectionItems) { section in
                    Section {
                        ForEach(section.settings) { setting in
                            Button {
                                if let a = setting.item as? AppearanceType {
                                    appearanceController.changeAppearance(a)
                                    appearance = a.rawValue
                                }
                            } label: {
                                Text(setting.item.label)
                                    .foregroundColor(.bkText)
                            }
                        }
                    } header: {
                        Text(section.label)
                    }
                }
            }
            .navigationTitle("설정")
            .toolbar {
                Button {
                    dismiss()
                } label: {
                    Image("close_search")
                }
            }
        }
        .preferredColorScheme(appearanceController.appearance.colorScheme)
    }
    
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(viewModel: .init())
    }
}
