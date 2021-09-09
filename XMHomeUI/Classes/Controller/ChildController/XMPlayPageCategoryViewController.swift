//
//  XMPlayPageCategoryViewController.swift
//  XMHomeUI
//
//  Created by flowerflower on 2021/9/9.
//

import Foundation
import BaseUI
import JXCategoryView
import SnapKit
import XMUtil

// MARK: ------------------------- Const/Enum/Struct

extension XMPlayPageCategoryViewController {
    
    /// 常量
    struct Const {}
    
    /// 内部属性
    struct Porpertys {}
    
    /// 外部参数
    struct Params {}
    
}

class XMPlayPageCategoryViewController: UIViewController {
    
    // MARK: ------------------------- Propertys
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
        view.titles = ["声音","AI文稿","评论"]
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
    var propertys: Porpertys = Porpertys()
    /// 外部参数
    var params: Params = Params()
    
    // MARK: ------------------------- CycLife
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSubViews()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    func setupSubViews(){
       setupNavView()
        
    }
    
    func setupNavView(){
        
        self.view.backgroundColor = UIColor.white
        
        let listContainerView = JXCategoryListContainerView(type: .scrollView, delegate: self)
        self.categoryView.listContainer = listContainerView
        self.view.addSubview(listContainerView!)
        let topView = UIView()
        topView.backgroundColor = UIColor.green
        self.view.addSubview(topView)
        topView.addSubview(self.categoryView)
    

        topView.snp_makeConstraints{
            $0.left.right.equalToSuperview()
            $0.top.equalTo(kStatusBarHeight)
            $0.height.equalTo(50)
        }
        listContainerView?.backgroundColor = UIColor.orange
        listContainerView?.snp_makeConstraints{
            $0.top.equalTo(topView.snp_bottom)
            $0.left.right.bottom.equalToSuperview()
        }
        
        self.categoryView.snp_makeConstraints{
            $0.width.equalTo(kScreenWidth - 100)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(35)
            $0.centerY.equalTo(topView)
        }
        
        
    }
    
    // MARK: ------------------------- Events
    
    // MARK: ------------------------- Methods
    
}



extension XMPlayPageCategoryViewController: JXCategoryViewDelegate,JXCategoryListContainerViewDelegate{
    
    public func number(ofListsInlistContainerView listContainerView: JXCategoryListContainerView!) -> Int {
        return self.categoryView.titles.count;
    }
    
    
    public func listContainerView(_ listContainerView: JXCategoryListContainerView!, initListFor index: Int) -> JXCategoryListContentViewDelegate! {
        if index == 0 {
            let vc = XMSoundViewController()
            return vc
        }else{
            let listVC = XMRecommandViewController()
            return listVC
        }
    }
    

    
    
    
}
