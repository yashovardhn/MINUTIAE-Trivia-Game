//
//  UserModel.swift
//  TriviaGame
//
//  Created by Yashovardhn on 22/07/22.
//

import Foundation
 
class UserModel: Identifiable {
    public var id: Int64 = 0
    public var name: String = ""
    public var email: String = ""
    public var age: Int64 = 0
    public var gender: String = ""
}
