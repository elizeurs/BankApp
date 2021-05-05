//
//  TransferFundsViewModel.swift
//  BankApp
//
//  Created by Elizeu RS on 04/05/21.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import Foundation

class TransferFundsViewModel: ObservableObject {
  
  var fromAccount: AccountViewModel?
  var toAccount: AccountViewModel?
  
  @Published var accounts: [AccountViewModel] = [AccountViewModel]()
  
  var fromAccountType: String {
    fromAccount != nil ? fromAccount!.accounntType : ""
  }
  
  var toAccountType: String {
    toAccount != nil ? toAccount!.accounntType : ""
  }
  
  
  func populateAccounts() {
    
    AccountService.shared.getAllAccounts { result in
      switch result {
      case .success(let accounts):
        if let accounts = accounts {
          DispatchQueue.main.async {
            self.accounts = accounts.map(AccountViewModel.init)
          }
        }
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }
}
