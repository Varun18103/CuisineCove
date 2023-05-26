//
//  ProductCell.swift
//  CuisineCove
//
//  Created by Varun Sharma on 24/05/23.
//

import UIKit

class ProductCell: UITableViewCell {
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var btnVegNonVeg: UIButton!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblQuantity: UILabel!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var btnMinus: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
