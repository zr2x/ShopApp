//
//  ProfileViewModel.swift
//  ShopApp
//
//  Created by Искандер Ситдиков on 19.09.2023.
//

import Foundation

protocol ProfileViewModel {
    func loadUserData(completion: @escaping () -> Void )
}

class ProfileVideModelImp: ProfileViewModel {
    
    var profile: [Profile] = []
    
    func loadUserData(completion: @escaping () -> Void) {
    }
    
    func fetchUserData(_ profile: Profile) -> Profile {
        let profileData = Profile(name: "Artem", accountId: 1302, orderCount: 12)
        return profileData
    }
}
