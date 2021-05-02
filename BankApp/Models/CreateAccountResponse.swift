//
//  CreateAccountResponse.swift
//  BankApp
//
//  Created by Elizeu RS on 02/05/21.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import Foundation

struct CreateAccountResponse: Decodable {
  let success: Bool
  let error: String?
}
