//
//  XMRecommandViewController.swift
//  XMHomeUI
//
//  Created by flowerflower on 2021/9/2.
//

import Foundation
import BaseUI
import JXCategoryView
import XMUtil

enum HomeCellType: Int {
    case banner  = 0
    case category
    case todayHot
    case guessYouLike
    
}

// MARK: ------------------------- Const/Enum/Struct

extension XMRecommandViewController {
    
    /// 常量
    struct Const {}
    
    /// 内部属性
    struct Propertys {
        var model: XMHomeModel?
        var sections:[HomeCellType:[Any]] = [:]
    }
    
    /// 外部参数
    struct Params {}
    
}

class XMRecommandViewController: BaseTableViewController ,JXCategoryListContentViewDelegate{
    
    // MARK: ------------------------- Propertys
    
    /// 内部属性
    var propertys: Propertys = Propertys()
    /// 外部参数
    var params: Params = Params()
    
    // MARK: ------------------------- CycLife
    
    // MARK: ------------------------- Events
    
    // MARK: ------------------------- Methods
    
  
    override func viewDidLoad() {
        super.viewDidLoad()


        setupInit()
        

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        requestData()
    }
    func setupInit(){
        
        let serarchView = XMHomeSearchBarView()
        self.view.addSubview(serarchView)
        serarchView.snp.makeConstraints{
            $0.left.right.top.equalToSuperview()
            $0.height.equalTo(50)
        }

        tableView.snp.makeConstraints{
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(-kTabBarHeight)
            $0.top.equalTo(serarchView.snp_bottom)
        }

        tableView.registerCell(ofType: XMHomeBannerCell.self)
        tableView.registerCell(ofType: XMCategoryCell.self)
        tableView.registerCell(ofType: XMHomeTodayHotCell.self)
        tableView.registerCell(ofType: XMHomeGuessYouLikeCell.self)

        tableView.register(XMHomeHeaderView.classForCoder(),
                           forHeaderFooterViewReuseIdentifier: XMHomeHeaderView.Const.identifier)
        
    }
  
    func listView() -> UIView! {
        return self.view
    }
    
    func listDidAppear() {
        
    }
    func listDidDisappear() {
        
    }
    

    deinit {
        print("XMRecommandViewController ==== deinit")
    }
}

