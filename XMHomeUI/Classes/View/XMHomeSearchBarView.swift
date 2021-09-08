//
//  XMHomeSearchBarView.swift
//  XMHomeUI
//
//  Created by flowerflower on 2021/9/2.
//

import Foundation
import XMUtil
import SnapKit

// MARK: ------------------------- Const/Enum/Struct


extension XMHomeSearchBarView {
    
    /// 常量
    struct Const {}
    
    /// 内部属性
    struct Propertys {
        let titles = [String]()
    }
    
    /// 外部参数
    struct Params {}
    
}

open class XMHomeSearchBarView: UIView {
    
    // MARK: ------------------------- Propertys
    lazy var searchBgView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    lazy var textFild: UITextField = {
        let textFild = UITextField()
        textFild.placeholder = "我是"
        return textFild
    }()
    
    lazy var soundBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.randomColor
        return btn
    }()
    lazy var searchBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.randomColor
        return btn
    }()
    lazy var historyBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "home_vip_play_btn"), for: .normal)
        btn.backgroundColor = UIColor.randomColor
        return btn
    }()
    
    
    
    /// 内部属性
    var propertys: Propertys = Propertys()
    /// 外部参数
    var params: Params = Params()
    
    
    // MARK: ------------------------- CycLife
    public override init(frame: CGRect) {

        super.init(frame: frame)
        setupSubViews()
        setupConstraints()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

     
    // MARK: ------------------------- setupSubViews
    func setupSubViews(){
        
        addSubview(searchBgView)
        searchBgView.addSubview(textFild)
        searchBgView.addSubview(soundBtn)
        searchBgView.addSubview(searchBtn)
        addSubview(historyBtn)
        
    }
    
    
    
     func setupConstraints() {
        
        searchBgView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        historyBtn.snp.makeConstraints{
            $0.right.equalToSuperview().offset(-12)
            $0.width.height.equalTo(30)
            $0.centerY.equalToSuperview()
        }
//        textFild.backgroundColor = UIColor.red
//        textFild.snp.makeConstraints{
//            $0.left.equalTo(12)
//            $0.right.equalTo(historyBtn.snp_left).offset(-20)
//            $0.centerY.equalToSuperview()
//            
//        }
        
        
        
        
    }
       
    
    // MARK: ------------------------- Events

    
}



