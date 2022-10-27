//
//  FilteredList.swift
//  Friendface
//
//  Created by Николай Никитин on 27.10.2022.
//

import SwiftUI

struct FilteredList: View {

  //MARK: - View Properties
  @FetchRequest var fetchRequest: FetchedResults<CachedUser>

  //MARK: - View Init
  init(filter: String) {
    if filter.isEmpty {
      _fetchRequest = FetchRequest<CachedUser>(sortDescriptors: [SortDescriptor(\.name)])
    } else {
      _fetchRequest = FetchRequest<CachedUser>(sortDescriptors: [SortDescriptor(\.name)], predicate: NSPredicate(format: "name CONTAINS[c] %@", filter))
    }
  }

  //MARK: - View Body
  var body: some View {
    List(fetchRequest, id: \.self) { user in
      NavigationLink {
        UserView(user: user)
      } label: {
        HStack {
          Circle()
            .fill(user.isActive ? .green : .red)
            .frame(width: 30)
          Text(user.wrappedName)
        }
      }
    }
  }
}
