//
//  ContentView.swift
//  Friendface
//
//  Created by Николай Никитин on 27.10.2022.
//

import SwiftUI

struct ContentView: View {

  @Environment(\.managedObjectContext) var moc
  @State private var users = [User]()

    var body: some View {
      NavigationView {
        List(users) { user in
          NavigationLink {
            UserView(user: user)
          } label: {
            HStack {
              Circle()
                .fill(user.isActive ? .green : .red)
                .frame(width: 30)
              Text(user.name)
            }
          }
        }
        .navigationTitle("FriendFace")
        .task {
          await fetchUsers()
        }
      }
    }

  func updateCache(with downloadedUsers: [User]) {
    for user in downloadedUsers {
      let cachedUser = CachedUser(context: moc)
      cachedUser.id = user.id
      cachedUser.isActive = user.isActive
      cachedUser.name = user.name
      cachedUser.age = Int16(user.age)
      cachedUser.company = user.company
      cachedUser.email = user.email
      cachedUser.address = user.address
      cachedUser.about = user.about
      cachedUser.registered = user.registered
      cachedUser.tags = user.tags.joined(separator: ",")
      for friend in user.friends {
        let cachedFriend = CachedFriend(context: moc)
        cachedFriend.id = friend.id
        cachedFriend.name = friend.name
        cachedUser.addToFriends(cachedFriend)
      }
    }
    try? moc.save()
  }

  func fetchUsers() async {
    guard users.isEmpty else { return }
    do {
      let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
      let (data, _) = try await URLSession.shared.data(from: url)
      let decoder = JSONDecoder()
      decoder.dateDecodingStrategy = .iso8601
      users = try decoder.decode([User].self, from: data)
    } catch {
      print("Download failed")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
