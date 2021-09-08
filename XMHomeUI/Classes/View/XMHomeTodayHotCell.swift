//
//  XMHomeTodayHotCell.swift
//  XMHomeUI
//
//  Created by flowerflower on 2021/9/3.
//

import Foundation
import BaseUI
import SDCycleScrollView
import SnapKit
import XMUtil
extension XMHomeTodayHotCell {
    
    /// 常量
    struct Const {}
    
    /// 内部属性
    struct Propertys {
        let titles = [String]()
    }
    
    /// 外部参数
    struct Params {}
    
}

open class XMHomeTodayHotCell: UITableViewCell {
    
    // MARK: ------------------------- Propertys
    lazy var hotBgView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    lazy var hotImageView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    lazy var hotImage1View: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    lazy var hotTitleView: SDCycleScrollView = {
        let view = SDCycleScrollView()
        view.onlyDisplayText = true
        view.titleLabelTextFont = UIFont.systemFont(ofSize: 13)
        view.titleLabelBackgroundColor = UIColor.white
        view.titleLabelTextColor = UIColor.black
        view.scrollDirection = .vertical
        return view
    }()
    lazy var tingBtn: UIButton = {
        let btn = UIButton()
        return btn
    }()
    
    /// 内部属性
    var propertys: Propertys = Propertys()
    /// 外部参数
    var params: Params = Params()
    
    
    // MARK: ------------------------- CycLife
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubViews()
        setupConstranints()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    // MARK: ------------------------- setupSubViews
    func setupSubViews(){
   
        contentView.addSubview(hotBgView)
        hotBgView.addSubview(hotImageView)
        hotBgView.addSubview(hotImage1View)
        hotBgView.addSubview(hotTitleView)
        hotBgView.addSubview(tingBtn)
        
        
    }
    func setupConstranints(){
        hotBgView.backgroundColor = UIColor.white
        hotBgView.snp.makeConstraints{
            $0.edges.equalTo(UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12))
        }
        hotImageView.backgroundColor = UIColor.red
        hotImageView.snp.makeConstraints{
            $0.width.height.equalTo(30)
            $0.centerY.equalToSuperview()
            $0.left.equalTo(8)
        }
        hotImage1View.backgroundColor = UIColor.green
        hotImage1View.snp.makeConstraints{
            $0.width.height.equalTo(15)
            $0.centerY.equalToSuperview()
            $0.left.equalTo(hotImageView.snp_right).offset(3)
        }
        tingBtn.backgroundColor =  UIColor.gray
        tingBtn.snp.makeConstraints{
            $0.width.equalTo(60)
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().offset(-12)
        }


      
        hotTitleView.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.left.equalTo(hotImage1View.snp_right).offset(3)
            $0.height.equalTo(30)
            $0.right.equalTo(tingBtn.snp_left).offset(-3)

        }

    }
    public  func refreshUI(topBuzz: [Any]?){
        
        hotTitleView.titlesGroup = topBuzz

    }

    
    // MARK: ------------------------- Events
    
    
}

