//
//  XMHomeHeaderView.swift
//  XMHomeUI
//
//  Created by flowerflower on 2021/9/5.
//

import Foundation
import XMUtil
import SnapKit

/// 常量
struct Const {
    static let identifier = "XCCombinedCourseCacheCourseSectionFooterView"
    static let height: CGFloat = 0
}

// MARK: ------------------------- Const/Enum/Struct

extension XMHomeHeaderView {
    
    /// 常量
    struct Const {
        static let identifier = "XMHomeHeaderView"
        static let height: CGFloat = 0
    }
    
}

class XMHomeHeaderView: UITableViewHeaderFooterView {
    
    
    var  changeBtnBlock:(()->Void)?
    
    // MARK: ------------------------- Propertys
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = k6Color
        return label
    }()
    
    lazy var changeBtn: UIButton = {
        let btn = UIButton()
        btn.setTitleColor(k9Color, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        btn.addTarget(self, action: #selector(changeOnCilck), for: .touchUpInside)
        return btn
    }()
    
    
    // MARK: ------------------------- CycLife
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.setupSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubViews(){
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(changeBtn)
        titleLabel.snp.makeConstraints{
            $0.left.equalTo(12)
            $0.centerY.equalToSuperview()
            
        }
        changeBtn.snp.makeConstraints{
            $0.right.equalTo(-12)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(40)
        }
        
        
        
    }
    
    // MARK: ------------------------- Events
    @objc func changeOnCilck(){
        
        self.changeBtnBlock?()
    }
    
    
   func refresh(title:String,changeTitle: String? = nil){
        self.titleLabel.text = title
        self.changeBtn.isHidden = changeTitle?.count ?? 0 > 0 ? false : true
        if !kStringIsEmpty(string: changeTitle ?? "") {
            self.changeBtn.setTitle("换一批", for: .normal)
        }
    }
    
    
    // MARK: ------------------------- Methods
    
}
