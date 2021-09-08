//
//  XMHomeListViewController.swift
//  XMHomeUI
//
//  Created by flowerflower on 2021/8/31.
//

import Foundation
import BaseUI
import JXCategoryView
import NMNetwork

public class XMCheooseShopModel: BaseModel {
    
    public var msg: String?
    
    public var code: Int?
    
    public var data: XMCheooseShopDataModel?
    
    
    public required init() {}

    
}
public class XMCheooseShopDataModel: BaseModel {
    
    
    public var total: Int?
    
    public var lists: [XMCheooseShopListsModel]?
    
    
    public required init() {}

    
}


public class XMCheooseShopListsModel: BaseModel {
    
    public var shop_logo: String?
    public var shop_name: String?
    
    public required init() {}

    
}



// MARK: ------------------------- Const/Enum/Struct

extension XMHomeListViewController {
    
    /// 常量
    struct Const {}
    
    /// 内部属性
    struct Propertys {
        var model: XMCheooseShopModel?
        
//        var sections:[HomeCellType:[Any]] = [:]
    }
    
    
    /// 外部参数
    struct Params {}
    
    
}



class XMHomeListViewController: BaseTableViewController ,JXCategoryListContentViewDelegate{
    
    // MARK: ------------------------- Propertys
    
    /// 内部属性
    var propertys: Propertys = Propertys()
    /// 外部参数
    var params: Params = Params()
    
    // MARK: ------------------------- CycLife
    
    // MARK: ------------------------- Events
    
    // MARK: ------------------------- Methods
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.reuqestData()
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.backgroundColor = UIColor.randomColor

        tableView.rowHeight = 100
        tableView.registerCell(ofType: XMHomeGuessYouLikeCell.self)

        
    }
    
    func reuqestData(){
        
        NetwrokBaseApi.shared.request("https://xiaoeapp-server.xiaoeknow.com/app/sub/xe.subscript.get/3.0",method: .get).responseCacheAndString { value in
            
            switch value.result{
            
            case .success(let jsonString):
                self.propertys.model = XMCheooseShopModel.deserialize(from: jsonString)
                
                self.tableView.reloadData()
//                    XMHomeModel.deserialize(from: jsonString)
                break
                
            default:
            break
            }
        }
        
        
        
    }
    
    func listView() -> UIView! {
        
        return self.view
    }
    
    func listDidAppear() {
        
    }
    func listDidDisappear() {
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.propertys.model?.data?.lists?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: XMHomeGuessYouLikeCell = tableView.cell(ofType: XMHomeGuessYouLikeCell.self)
        let model =  self.propertys.model?.data?.lists?[safe: indexPath.row]
        cell.headImageView.sd_setImage(with: URL(string: model?.shop_logo ?? ""), completed: nil)
        cell.titleLabel.text = model?.shop_name
        return cell

    }
    
    
    

}

