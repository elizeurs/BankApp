//
//  CreateAccountRequest.swift
//  BankApp
//
//  Created by Elizeu RS on 02/05/21.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import Foundation

struct CreateAccountRequest: Codable {
  
  let name: String
  let accountType: String
  let balance: Double
}
