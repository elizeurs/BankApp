//
//  TransferFundRequest.swift
//  BankApp
//
//  Created by Elizeu RS on 03/05/21.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import Foundation

struct TransferFundRequest: Codable {
  
  let accountFromId: String
  let accountToId: String
  let amount: Double
}
