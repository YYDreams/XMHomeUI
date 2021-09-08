//
//  XMHomeBannerCell.swift
//  XMHomeUI
//
//  Created by flowerflower on 2021/9/2.
//

import Foundation
import SDCycleScrollView

extension XMHomeBannerCell {
    
    /// 常量
    struct Const {}
    
    /// 内部属性
    struct Propertys {
        let titles = [String]()
    }
    
    /// 外部参数
    struct Params {}
    
}

open class XMHomeBannerCell: UITableViewCell {
    
    // MARK: ------------------------- Propertys
    lazy var bannnerView: SDCycleScrollView = {
        let view = SDCycleScrollView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 12
        return view
    }()
    
    
    
    
    
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
        contentView.addSubview(bannnerView)
        bannnerView.snp.makeConstraints{
            $0.edges.equalTo(UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12))
        }
    }
    public  func refreshUI(bander: [Any]?){
        
        bannnerView.imageURLStringsGroup = bander
        
    }
    

    
    
    // MARK: ------------------------- Events
    
    
}

