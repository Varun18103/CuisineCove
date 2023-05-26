//
//  HomeVC.swift
//  CuisineCove
//
//  Created by Varun Sharma on 24/05/23.
//

import UIKit
import SDWebImage
class HomeVC: UIViewController {
    //MARK: Outlets
    @IBOutlet weak var tblData: UITableView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblTotalPrice: UILabel!
    @IBOutlet weak var lblTotalItem: UILabel!
    @IBOutlet weak var viewCart: UIView!
    @IBOutlet weak var viewCartHeight: NSLayoutConstraint!
    
    
    //MARK: Varibles
    var productData: ProductModel?
    
    //MARK: Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getAllProducts()
        self.manageViewCart(isLoaded: true)
    }
    
    //MARK: manage bottom cart view visibility
    func manageViewCart(isLoaded: Bool){
        if isLoaded{
            self.viewCart.isHidden = true
            self.viewCartHeight.constant = 0
        }else{
            var totalPrice: Int = 0
            let selectedProduct : [List] = self.productData?.list.filter({$0.quantity > 0}) ?? []
            if selectedProduct.count > 0{
                self.viewCart.isHidden = false
                self.viewCartHeight.constant = 90
                for item in selectedProduct{
                    totalPrice += Int(Double(item.quantity) * (Double(item.productCost) ?? 0))
                }
                self.lblTotalItem.text = "\(selectedProduct.count) item"
                self.lblTotalPrice.text = "$\(totalPrice)"
            }else{
                self.viewCart.isHidden = true
                self.viewCartHeight.constant = 0
            }
        }
    }
    //MARK: Get all product api
    func getAllProducts(){
        ServerManager.shared.showHud()
        ServerManager.shared.httpGet(request: API.productApi) { (json) in
            ServerManager.shared.hidHud()
            if json["Message"].stringValue == "Ok" {
                self.productData = ProductModel.init(parser: json)
                self.lblName.text = self.productData?.clientName ?? ""
                self.tblData.reloadData()
                
            }
        } failureHandler: { (error) in
            ServerManager.shared.hidHud()
            
        } progressHandler: { (progress) in
            
        }
        
    }
    
    //MARK: Add quantity button action
    @objc func btnAddAction(sender: UIButton){
        let cell = self.tblData.cellForRow(at: IndexPath(row: sender.tag, section: 0)) as? ProductCell
        let dict = self.productData?.list[sender.tag]
        var quantity = dict?.quantity ?? 0
        quantity += 1
        self.productData?.list[sender.tag].quantity = quantity
        cell?.lblQuantity.text = "\(quantity)"
        self.manageViewCart(isLoaded: false)
    }
    
    //MARK: Minus quantity button action
    @objc func btnMinusAction(sender: UIButton){
        let cell = self.tblData.cellForRow(at: IndexPath(row: sender.tag, section: 0)) as? ProductCell
        let dict = self.productData?.list[sender.tag]
        var quantity = dict?.quantity ?? 0
        if quantity > 0{
            quantity -= 1
        }
        self.productData?.list[sender.tag].quantity = quantity
        cell?.lblQuantity.text = "\(quantity)"
        self.manageViewCart(isLoaded: false)
    }
}



extension HomeVC: UITableViewDelegate,UITableViewDataSource{
    //MARK:Table view Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productData?.list.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath)as! ProductCell
        cell.selectionStyle = .none
        cell.tag = indexPath.row
        let dict = self.productData?.list[indexPath.row]
        self.configureCell(cell: cell, dict: dict)
        return cell;
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    //MARK: Configure cell
    func configureCell(cell: ProductCell, dict: List?){
        cell.lblName.text = dict?.productName ?? ""
        cell.lblDesc.text = dict?.desc ?? ""
        cell.lblQuantity.text = "\(dict?.quantity ?? 0)"
        cell.lblPrice.text = "$\(dict?.productCost ?? "")"
        cell.btnVegNonVeg.isSelected = ((dict?.isVeg ?? 0) == 1) ? true : false
        cell.imgProduct.sd_setImage(with: NSURL.init(string: dict?.image ?? "") as URL?, placeholderImage: UIImage(named: "logo"))
        cell.btnAdd.tag = cell.tag
        cell.btnAdd.addTarget(self, action: #selector(self.btnAddAction(sender: )), for: .touchUpInside)
        
        cell.btnMinus.tag = cell.tag
        cell.btnMinus.addTarget(self, action: #selector(self.btnMinusAction(sender: )), for: .touchUpInside)
    }
}
