//
//  UserView.swift
//  Friendface
//
//  Created by Николай Никитин on 27.10.2022.
//

import SwiftUI

struct UserView: View {

  let user: User


    var body: some View {
      List {
        Section {
          Text(user.about)
            .padding(.vertical)
        } header: {
          Text("Contact details")
        }
        Section {
          ForEach(user.friends) { friend in
            Text(friend.name)
          }
        } header: {
          Text("Friends")
        }
      }
      .listStyle(.grouped)
      .navigationTitle(user.name)
      .navigationBarTitleDisplayMode(.inline)
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
      UserView(user: User.example)
    }
}
