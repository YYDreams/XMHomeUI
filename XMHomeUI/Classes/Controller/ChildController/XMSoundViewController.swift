//
//  XMSoundViewController.swift
//  XMHomeUI
//
//  Created by flowerflower on 2021/9/9.
//

import Foundation
import BaseUI
import BaseUI
import JXCategoryView
import NMNetwork
// MARK: ------------------------- Const/Enum/Struct

extension XMSoundViewController {
    
    /// 常量
    struct Const {}
    
    /// 内部属性
    struct Porpertys {}
    
    /// 外部参数
    struct Params {}
    
}

class XMSoundViewController: BaseTableViewController,JXCategoryListContentViewDelegate {
    
    
    // MARK: ------------------------- Propertys
    
    /// 内部属性
    var propertys: Porpertys = Porpertys()
    /// 外部参数
    var params: Params = Params()
    
    // MARK: ------------------------- CycLife
    
    // MARK: ------------------------- Events
    
    // MARK: ------------------------- Methods
    
    // MARK: ------------------------- JXCategoryListContentViewDelegate

    
    func listView() -> UIView! {
        
        return self.view
    }
    
    func listDidAppear() {
        
    }
    func listDidDisappear() {
        
    }
    
}
