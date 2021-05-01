//
//  AccountSumaryViewModel.swift
//  BankApp
//
//  Created by Elizeu RS on 30/04/21.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import Foundation

class AccountSummaryViewModel: ObservableObject {
  
  private var _accounts = [Account]()
  
  var accounts: [AccountViewModel] = [AccountViewModel]()
  
  var total: Double {
    _accounts.map { $0.balance }.reduce(0, +)
  }
  
  func getAllAccounts() {
    
    AccountService.shared.getAllAccounts { result in
      switch result {
      case .success(let accounts):
        //        print("success")
        if let accounts = accounts {
          self._accounts = accounts
          self.accounts = accounts.map(AccountViewModel.init)
        }
      case .failure(let error):
//        print("failure")
        print(error.localizedDescription)
      }
    }
  }
}

class AccountViewModel {
  
  var account: Account
  
  init(account: Account) {
    self.account = account
  }
  
  var name: String {
    account.name
  }
  
  var accountId: String {
    account.id.uuidString
  }
  
  var accounntType: String {
    account.accountType.title
  }
  
  var balance: Double {
    account.balance
  }
}
