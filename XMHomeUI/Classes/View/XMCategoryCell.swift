//
//  XMCategoryCell.swift
//  XMHomeUI
//
//  Created by flowerflower on 2021/9/2.
//

import Foundation
import BaseUI
extension XMCategoryCell {
    
    /// 常量
    struct Const {}
    
    /// 内部属性
    struct Propertys {
        let titles = [String]()
    }
    
    /// 外部参数
    struct Params {}
    
}

open class XMCategoryCell: UITableViewCell {
    
    // MARK: ------------------------- Propertys
    let categoryView:BaseCollectionView = BaseCollectionView()
    
    
    
    /// 内部属性
    var propertys: Propertys = Propertys()
    /// 外部参数
    var params: Params = Params()
    
    
    // MARK: ------------------------- CycLife
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubViews()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    // MARK: ------------------------- setupSubViews
    func setupSubViews(){
   
        self.contentView.addSubview(categoryView)
        categoryView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        
        
    }
    
    
    public  func refreshUI(titleArr:[String]?,imageArr:[String]?){
        
//        guard let tempTitleList = titleArr as? [String] else { return}
//        guard let tempImageList = titleArr as? [String] else { return}
        
        categoryView.refreshUI(titleArr: titleArr,
                               imageArr: imageArr)
    }
    
    
    public  func refreshUI(square:[XMHeaderItemListModel]?){
        
        let dataList  = square
        var titleArr = [String]()
        var imageArr = [String]()
        dataList?.map({ model in
            if let title = model.title, let coverPath  = model.coverPath {
                titleArr.append(title)
                imageArr.append(coverPath)
            }
        })
//        print("titleArr\(titleArr.count)====\(titleArr)")
//        print("imageArr\(imageArr.count)====\(imageArr)")
    categoryView.refreshUI(titleArr: titleArr,
                           imageArr: imageArr)
        
    }
    
    
    
    // MARK: ------------------------- Events
    
    
}

