//
//  ProductModel.swift
//  CuisineCove
//
//  Created by Varun Sharma on 24/05/23.
//

import Foundation
import SwiftyJSON
class ProductModel: NSObject {
   var clientName = String()
 var list = [List]()
    override init() {
        
    }
    
    //MARK: Parsing Methods
    //Parse all reveived message
    init(parser objJson: JSON ) {
        self.clientName = objJson["ClientName"].stringValue
       let arrList = objJson["list"].arrayValue
        for item in arrList{
            let itemModel = List(parser: item)
            list.append(itemModel)
        }
    }
    
}
class List: NSObject {
   var productName = String()
    var productCost = String()
    var desc = String()
   var image = String()
    var isVeg = Int()
    var opponentname = String()
    var createdAt = String()
    var quantity: Int = 0

    override init() {
        
    }
    //MARK: Parsing Methods
    //Parse all reveived message
    init(parser objJson: JSON ) {
        self.productName = objJson["ProductName"].stringValue
        self.productCost = objJson["ProductCost"].stringValue
        self.desc = objJson["ProductDescription"].stringValue
        self.image = objJson["ProductImageURL"].stringValue
        self.isVeg = objJson["ProductVegCategory"].intValue
    }
    
}
