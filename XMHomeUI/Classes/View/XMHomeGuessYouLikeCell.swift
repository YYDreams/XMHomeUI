//
//  XMHomeGuessYouLikeCell.swift
//  XMHomeUI
//
//  Created by flowerflower on 2021/9/5.
//

import Foundation
import BaseUI
import SDCycleScrollView
import SnapKit
import XMUtil
extension XMHomeGuessYouLikeCell {
    
    /// 常量
    struct Const {}
    
    /// 内部属性
    struct Propertys {
        let titles = [String]()
    }
    
    /// 外部参数
    struct Params {}
    
}

open class XMHomeGuessYouLikeCell: UITableViewCell {
    
    // MARK: ------------------------- Propertys
    lazy var headImageView: UIImageView = {
        let img = UIImageView()
        return img
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor.black
        return label
    }()
    lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = k9Color
        return label
    }()
    
    lazy var playCountBtn: UIButton = {
        let btn = UIButton()
        btn.setTitleColor(k9Color, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        return btn
    }()
    lazy var closeBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "apolo_feedbackAlert_close"), for: .normal)
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
   
        contentView.addSubview(headImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subTitleLabel)
        contentView.addSubview(playCountBtn)
        contentView.addSubview(closeBtn)
        
        
    }
    func setupConstranints(){
//        headImageView.backgroundColor = UIColor.red
//        titleLabel.text = "xxx"
//        subTitleLabel.text = "2312"
//        titleLabel.backgroundColor = UIColor.red
//        playCountBtn.backgroundColor = UIColor.blue
//        subTitleLabel.backgroundColor = UIColor.green
//        closeBtn.backgroundColor = UIColor.red

        
        headImageView.snp.makeConstraints{
            $0.width.height.equalTo(80)
            $0.left.equalTo(12)
            $0.centerY.equalToSuperview()
        }

        titleLabel.snp.makeConstraints{
            $0.top.equalTo(headImageView.snp_top)
            $0.right.lessThanOrEqualTo(closeBtn.snp_left).offset(-10)
            $0.left.equalTo(headImageView.snp_right).offset(12)
        }
        subTitleLabel.snp.makeConstraints{
            $0.centerY.equalTo(headImageView)
            $0.left.right.equalTo(titleLabel)
        }
        playCountBtn.snp.makeConstraints{
            $0.bottom.equalTo(headImageView.snp_bottom)
            $0.left.equalTo(titleLabel)
        }
        closeBtn.snp.makeConstraints{
            $0.top.equalTo(headImageView.snp_top)
            $0.right.equalToSuperview().offset(-12)
            $0.width.equalTo(30)
        }


    }
    
    public  func refreshUI(model:XMBodyItemModel?){
        print("XMBodyItemModel；；；；：\(model?.title)")
        self.headImageView.sd_setImage(with: URL(string: model?.coverPath ?? ""), placeholderImage: UIImage(named: ""))
        self.titleLabel.text = model?.title
        self.subTitleLabel.text = model?.intro
        self.playCountBtn.setTitle("\(model?.playsCounts ?? 0)", for: .normal)
        
        
    }
    
    // MARK: ------------------------- Events
    
    
}
