//
//  FriendsUIView.swift
//  voyager2048
//
//  Created by grapestree on 2021/5/19.
//

import SwiftUI

struct FriendsUIView: View {
    var friendlist:[FrienInfo] = [
        FrienInfo(id: 1, Name: "init", Avator: "init", Status: 1),
        FrienInfo(id: 2, Name: "init2", Avator: "init2", Status: 1),
    ]
    init(){
        print("firend list view :num ",self.friendlist.count)
    }
    var body: some View {
        ZStack{
            VStack{
                List{
                    ForEach(friendlist) { e in
                        FriendsInfoView(name: e.Name,avator: e.Avator,status: e.Status)
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct FriendsUIView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsUIView()
    }
}


struct FrienInfo: Identifiable{
    var  id: Int64
    var  Name: String
    var  Avator: String
    var  Status: Int64
}

struct FriendsInfoView: View{
    var  Name: String
    var  Avator: String
    var  Status: Int64
    
    init(name: String,avator: String,status:Int64) {
        self.Name = name
        self.Avator = avator
        self.Status = status
    }
    
    var body: some View {
                HStack (
                    alignment: .top,
                    spacing: 4.0
                ){
                    Image("icon")
                        .padding(.horizontal)
                        .onTapGesture {
                            print("Tap \(Name)")
                        }
                    Spacer()
                    Text(Name)
                        .font(.title2)
                    Spacer()
                }
        
    }
}



