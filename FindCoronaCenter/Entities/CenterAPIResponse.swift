//
//  CenterAPIResponse.swift
//  FindCoronaCenter
//
//  Created by seosh on 4/25/22.
//

import Foundation

struct CenterAPIResponse: Decodable {
    let data: [Center]
}
