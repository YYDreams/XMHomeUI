//
//  XMHomeViewController+Delegate.swift
//  XMHomeUI
//
//  Created by flowerflower on 2021/8/31.
//

import Foundation
import JXCategoryView

extension XMHomeViewController: JXCategoryViewDelegate,JXCategoryListContainerViewDelegate{
    
    public func number(ofListsInlistContainerView listContainerView: JXCategoryListContainerView!) -> Int {
        return self.categoryView.titles.count;
    }
    
    
    public func listContainerView(_ listContainerView: JXCategoryListContainerView!, initListFor index: Int) -> JXCategoryListContentViewDelegate! {
        if index == 0 {
            let vc = XMHomeListViewController()
            return vc
        }else{
            let listVC = XMRecommandViewController()
            return listVC
        }
    }
    

    
    
    
}
