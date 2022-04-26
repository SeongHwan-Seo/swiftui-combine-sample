//
//  CenterList.swift
//  FindCoronaCenter
//
//  Created by seosh on 4/26/22.
//

import SwiftUI

struct CenterList: View {
    var centers = [Center]()
    
    var body: some View {
        List(centers, id: \.id) {
            center in
            NavigationLink(destination: CenterDetailView(center: center))
            {
                CenterRow(center: center)
            }
            .navigationTitle(center.sido.rawValue)
        }
    }
}

struct CenterList_Previews: PreviewProvider {
    static var previews: some View {
        let center = [
            Center(id: 0, sido: .경기도, facilityName: "실내빙상장 앞", address: "경기도 뭐뭐시 뭐뭐구", lat: "37.404476", lng: "126.9491888", centerType: .central, phoneNumber: "010-0000-0000"),
            Center(id: 0, sido: .경기도, facilityName: "실내빙상장 앞", address: "경기도 뭐뭐시 뭐뭐구", lat: "37.404476", lng: "126.9491888", centerType: .central, phoneNumber: "010-0000-0000"),
            Center(id: 0, sido: .경기도, facilityName: "실내빙상장 앞", address: "경기도 뭐뭐시 뭐뭐구", lat: "37.404476", lng: "126.9491888", centerType: .central, phoneNumber: "010-0000-0000")
        ]
        CenterList()
    }
}
