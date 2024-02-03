//
//  HomeStatsView.swift
//  SwiftfulCrypto
//
//  Created by aaaaa on 25/12/2023.
//

import SwiftUI

struct HomeStatsView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @Binding var showPortffolio: Bool
    
    var body: some View {
        HStack {
            ForEach(vm.statistics) { stat in
                StatisticView(stat: stat)
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
        }
        .frame(width:  UIScreen.main.bounds.width,
               alignment: showPortffolio ? .trailing : .leading)
        
    }
}

struct HomeStatsView_Previews: PreviewProvider {
    static var previews: some View {
        HomeStatsView(showPortffolio: .constant(false))
            .environmentObject(dev.homeVM)
    }
}
