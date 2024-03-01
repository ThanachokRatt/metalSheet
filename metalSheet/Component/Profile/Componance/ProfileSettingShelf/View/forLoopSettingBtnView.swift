//
//  forLoopSettingBtnView.swift
//  metalSheet
//
//  Created by Schweppe on 13/9/2566 BE.
//

import SwiftUI

struct forLoopSettingBtnView: View {
    @StateObject var viewModel: ProfileViewModel = ProfileViewModel()
    @EnvironmentObject var viewModels : OrderHistoryViewModel


    var body: some View {
        let isiPad = UIDevice.current.userInterfaceIdiom == .pad
        VStack {
            ForEach(viewModel.profileModel, id: \.id) { item in
                NavigationLink(
                    destination: destinationView(for: item.tab),
                    label: {
                        btnView(image: item.profileImage, name: item.profileName)
                    }
                )
            }
        } .font(Font.custom("Pridi-Light",size: isiPad ? 27 : 18))
           
      
        

    }
    
    private func destinationView(for tab: settingTab) -> some View {
        switch tab {
        case .userSetting:
            return AnyView(personalSettingShelfView())
        case .addressSetting:
            return AnyView(locationShelfView())
        case .orderHistory:
            viewModels.getOrder()
            return AnyView(OrderHistoryShelfView())
        case .chagePassword:
            return AnyView(changePasswordShelfView())
        }
    }
}

/*struct forLoopSettingBtnView_Previews: PreviewProvider {
    static var previews: some View {
        forLoopSettingBtnView()
    }
}*/
