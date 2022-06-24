//
//  TabViewModel.swift
//  FindOut
//
//  Created by Putra on 16/06/22.
//

import SwiftUI

class TabViewModel: ObservableObject {
    @Published var currentTab = "Home"
    @Published var currentTabProfile = "My Favorite"
}

