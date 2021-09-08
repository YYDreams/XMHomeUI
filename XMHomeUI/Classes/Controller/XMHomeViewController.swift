//
//  XMHomeViewController.swift
//  XMHomeUI
//
//  Created by flowerflower on 2021/8/27.
//

import Foundation
import BaseUI
import JXCategoryView
import SnapKit
import XMUtil

// MARK: ------------------------- Const/Enum/Struct

extension XMHomeViewController {
    
    /// 常量
    struct Const {}
    
    /// 内部属性
    struct Propertys {
        let titles = [String]()
    }
    
    /// 外部参数
    struct Params {}
    
}

open class XMHomeViewController: BaseUIViewController {
    
    // MARK: ------------------------- Propertys
    
    lazy var categoryView: JXCategoryTitleView = {
        let view = JXCategoryTitleView()
        view.delegate = self
        view.backgroundColor = UIColor.clear
        view.titleFont = UIFont.systemFont(ofSize: 14)
        view.titleSelectedFont  = UIFont.boldSystemFont(ofSize: 16)
        view.titleColor = UIColor.black
        view.titleSelectedColor = UIColor.red
        view.isTitleLabelZoomEnabled = true
        view.titleLabelZoomScale = 1.3
        view.isContentScrollViewClickTransitionAnimationEnabled = false
        view.titleLabelAnchorPointStyle = .bottom
        view.isAverageCellSpacingEnabled = false
        view.titles = ["推荐","Vip","直播"]
        let lineView = JXCategoryIndicatorLineView()
        lineView.indicatorColor = UIColor.red
        lineView.indicatorCornerRadius = 0
        lineView.lineStyle = .lengthen
        lineView.indicatorWidth  = kRatio * 40.0;
        lineView.indicatorHeight  = kRatio * 8.0;
        
        view.indicators = [lineView]
        
        return view
    }()
    
    /// 内部属性
    var propertys: Propertys = Propertys()
    /// 外部参数
    var params: Params = Params()
    
    
    // MARK: ------------------------- CycLife

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
 
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSubViews()
    }
     
    // MARK: ------------------------- setupSubViews
       
    func setupSubViews(){

        let listContainerView = JXCategoryListContainerView(type: .scrollView, delegate: self)
        self.categoryView.listContainer = listContainerView
        self.view.addSubview(listContainerView!)
        let topView = UIView()
        topView.backgroundColor = UIColor.white
        self.view.addSubview(topView)
        topView.addSubview(self.categoryView)
    

        topView.snp_makeConstraints{
            $0.left.right.equalToSuperview()
            $0.top.equalTo(kStatusBarHeight)
            $0.height.equalTo(50)
        }
        listContainerView?.snp_makeConstraints{
            $0.top.equalTo(topView.snp_bottom)
            $0.left.right.bottom.equalToSuperview()
        }
        
        self.categoryView.snp_makeConstraints{
            $0.left.right.equalToSuperview()
            $0.height.equalTo(35)
            $0.centerY.equalTo(topView)
        }
 
    }

    // MARK: ------------------------- Events

    
}



