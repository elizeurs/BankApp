//
//  AccountSumaryViewModel.swift
//  BankApp
//
//  Created by Elizeu RS on 30/04/21.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import Foundation

class AccountSummaryViewModel: ObservableObject {
  
  private var _accountModels = [Account]()
  
  @Published var accounts: [AccountViewModel] = [AccountViewModel]()
  
  var total: Double {
    _accountModels.map { $0.balance }.reduce(0, +)
  }
  
  func getAllAccounts() {
    
    AccountService.shared.getAllAccounts { result in
      switch result {
      case .success(let accounts):
        //        print("success")
        if let accounts = accounts {
          self._accountModels = accounts
          DispatchQueue.main.async {
            self.accounts = accounts.map(AccountViewModel.init)
          }
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
