//
//  XMRecommandViewController+Delegate.swift
//  XMHomeUI
//
//  Created by flowerflower on 2021/9/2.
//

import Foundation
import XMUtil
extension XMRecommandViewController{
    
     func numberOfSections(in tableView: UITableView) -> Int {
         return self.propertys.sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let type = HomeCellType(rawValue: section) else {return 0}

        if type == .banner || type == .category || type == .todayHot {
            return 1
        }
       return self.propertys.sections[type]?.count ?? 0
           
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let type = HomeCellType(rawValue: indexPath.section) else { return UITableViewCell() }

//        print("--sectionssectionssections----\(self.propertys.sections[type])")
        
//        print("--sectionssectionssections11----\(self.propertys.sections[.guessYouLike])")
        switch type {
        case .banner:
            let cell: XMHomeBannerCell = tableView.cell(ofType: XMHomeBannerCell.self)
            cell.refreshUI(bander: self.propertys.sections[type])
            return cell
        case .category:
            
            let cell: XMCategoryCell = tableView.cell(ofType: XMCategoryCell.self)
            cell.refreshUI(titleArr: self.propertys.sections[type]?[0] as? [String], imageArr: self.propertys.sections[type]?[1] as? [String])
            return cell
        case .todayHot:
            let cell: XMHomeTodayHotCell = tableView.cell(ofType: XMHomeTodayHotCell.self)
            cell.refreshUI(topBuzz: self.propertys.sections[type])
            return cell
        case .guessYouLike:
            let cell: XMHomeGuessYouLikeCell = tableView.cell(ofType: XMHomeGuessYouLikeCell.self)
            if let bodyItemModel  =  self.propertys.sections[type]?[indexPath.row]  {
                cell.refreshUI(model: bodyItemModel as? XMBodyItemModel)
                
            }
            
            return cell

            
        }
        return UITableViewCell.init()
    }
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: XMHomeHeaderView.Const.identifier) as? XMHomeHeaderView
        guard let  cellType = HomeCellType(rawValue: section) else {
            return UIView()
        }
        if cellType == .guessYouLike {
            headerView?.refresh(title: "猜你喜欢", changeTitle: "换一批")
            headerView?.changeBtnBlock = { [weak self] in

                self?.requestData()
            }
            return headerView
        }
      
        return  UIView()

    }
    
     func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
     func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let cellType = HomeCellType(rawValue: section) else { return  0.01 }

        switch cellType {
        case .guessYouLike:
         return   50
        default:
            break
        }
        return 0.01
        
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let cellType = HomeCellType(rawValue: indexPath.section) else { return  0.01 }
        switch cellType {
        case .banner:
         return   200
        case .todayHot:
        return   60
        case .category:
        return 100

        default:
            return  110
            break
        }
        return 0.01
        
     }
    
    
    
    
}
