//
//  AccountSummaryScreen.swift
//  BankApp
//
//  Created by Elizeu RS on 01/05/21.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct AccountSummaryScreen: View {
  
  @ObservedObject private var accountSummaryVM = AccountSummaryViewModel()
  
  @State private var isPresented: Bool = false
  
  var body: some View {
    
    VStack {
      GeometryReader { g in
        VStack {
          AccountListView(accounts: self.accountSummaryVM.accounts)
            .frame(height: g.size.height/2)
          Text("\(self.accountSummaryVM.total.formatAsCurrency())")
            Spacer()
        }
      }
    }
    .onAppear {
      self.accountSummaryVM.getAllAccounts()
    }
    .sheet(isPresented: $isPresented) {
      AddAccountScreen()
    }
    .navigationBarItems(trailing: Button("Add Account") {
      self.isPresented = true
    })
    .navigationBarTitle("Account Summary")
    .embedInNavigationView()
  }
}

struct AccountSummaryScreen_Previews: PreviewProvider {
  static var previews: some View {
    AccountSummaryScreen()
  }
}
