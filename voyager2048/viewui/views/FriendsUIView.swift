//
//  FriendsUIView.swift
//  voyager2048
//
//  Created by grapestree on 2021/5/19.
//

import SwiftUI

struct FriendsUIView: View {
    @State var friendlist  = [FrienInfo]()
    init(){
        self.friendlist = [
            FrienInfo(id: ObjectIdentifier, Name: "init", Avator: "init", Status: 1)
        ]
    }
    var body: some View {
        ZStack{
            VStack{
                ForEach(friendlist) { e in
                    FriendsInfoView(name: e.Name,avator: e.Avator,status: e.Status)
                }
            }
        }
    }
}

struct FriendsUIView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsUIView()
    }
}


struct FrienInfo: Identifiable{
    var id: ObjectIdentifier
    
    var  Name:String
    var  Avator:String
    var  Status:Int64
}

struct FriendsInfoView: View{
    var  Name:String
    var  Avator:String
    var  Status:Int64
    
    init(name: String,avator: String,status:Int64) {
        self.Name = name
        self.Avator = avator
        self.Status = status
    }
    
    var body: some View {
                HStack {
                    Image(uiImage: #imageLiteral(resourceName: "apple"))
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


