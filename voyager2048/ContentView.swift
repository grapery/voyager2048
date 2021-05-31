//
//  ContentView.swift
//  voyager2048
//
//  Created by grapestree on 2021/3/12.
//

import SwiftUI
import CoreData

struct GraperyApp: View {
    @State private var selection: Int = 0
    
    var body: some View {
            NavigationView {
                TabView(selection: $selection) {
                    UserUIView()
                        .tabItem { Item(type: .You, selection: selection) }
                        .tag(ItemType.You.rawValue)
                    ExploreUIView()
                        .tabItem { Item(type: .Explore, selection: selection) }
                        .tag(ItemType.Explore.rawValue)
                    GroupUIView()
                        .tabItem { Item(type: .Org, selection: selection) }
                        .tag(ItemType.Org.rawValue)
                    FriendsUIView()
                        .tabItem { Item(type: .Friends, selection: selection) }
                        .tag(ItemType.Friends.rawValue)
                }
                .navigationBarHidden(itemType.isNavigationBarHidden(selection: selection))
                .navigationBarTitle(itemType.title, displayMode: .inline)
                .navigationBarItems(trailing: itemType.navigationBarTrailingItems(selection: selection))
                .accentColor(Color.blue)
                .foregroundColor(Color.green)
            }
        }
        
        enum ItemType: Int {
            case You
            case Explore
            case Org
            case Friends
            
            var image: Image {
                switch self {
                case .You:     return Image(".you")
                case .Explore:  return Image(".explore")
                case .Org: return Image(".group")
                case .Friends:       return Image(".friends")
                }
            }
            
            var selectedImage: Image {
                switch self {
                case .You:     return Image(".you_selected")
                case .Explore:  return Image("explore_selected")
                case .Org: return Image(".group_selected")
                case .Friends:       return Image(".friends_selected")
                }
            }
            
            var title: String {
                switch self {
                case .You:              return "You"
                case .Explore:          return "Explore"
                case .Org:              return "Org"
                case .Friends:          return "Friends"
                }
            }
            
            func isNavigationBarHidden(selection: Int) -> Bool {
                return false
            }
            
            func navigationBarTrailingItems(selection: Int) -> AnyView {
                switch ItemType(rawValue: selection)! {
                case .You:
                    return AnyView(Image(systemName: "plus.circle"))
                case .Explore:
                    return AnyView(Image(systemName: "person.badge.plus"))
                case .Org:
                    return AnyView(Image(systemName: "team.circle"))
                case .Friends:
                    return AnyView(Image(systemName: "person.friend"))
                }
            }
        }
        
        struct Item: View {
            let type: ItemType
            let selection: Int
            
            var body: some View {
                VStack {
                    if type.rawValue == selection {
                        type.selectedImage
                    } else {
                        type.image
                    }
                    
                    Text(type.title)
                }
            }
        }
        
        private var itemType: ItemType { ItemType(rawValue: selection)! }
    }
