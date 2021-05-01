//
//  AccountListView.swift
//  BankApp
//
//  Created by Elizeu RS on 01/05/21.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct AccountListView: View {
  
  let accounts: [AccountViewModel]
  
  var body: some View {
    List(accounts, id:  \.accountId) { account in
      AccountCell(account: account)
    }
  }
}

struct AccountListView_Previews: PreviewProvider {
  static var previews: some View {
    
    let account  = Account(id: UUID(), name: "John Doe", accountType: .checking, balance: 200)
    let accountVM = AccountViewModel(account: account)
    
    return AccountListView(accounts: [accountVM])
  }
}

struct AccountCell: View {
  
  let account: AccountViewModel
  
  var body: some View {
    HStack {
      VStack(alignment: .leading, spacing: 10) {
        Text(account.name)
          .font(.headline)
        
        Text(account.accounntType)
          .opacity(0.5)
      }
      Spacer()
      Text("\(account.balance.formatAsCurrency())")
        .foregroundColor(Color.green)
    }
  }
}
