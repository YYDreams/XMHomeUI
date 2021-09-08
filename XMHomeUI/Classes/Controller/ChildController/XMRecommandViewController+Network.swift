//
//  XMRecommandViewController.swift
//  XMHomeUI
//
//  Created by flowerflower on 2021/9/2.
//

import Foundation
import NMNetwork
import HandyJSON
// MARK: ------------------------- Const/Enum/Struct
let kfocus = "focus"
let kSquare = "square"
let kTopBuzz2 = "topBuzz2"
let kGuessYouLike = "guessYouLike"


extension XMRecommandViewController {
    
    //搜索框里面的轮播文字
    //https://search.ximalaya.com/guideWordV2/2.6?isFirstOpen=false&page=1&pageSize=30&recmmdSize=1
    //https://searchwsa.ximalaya.com/guideWordV2/2.6?isFirstOpen=false&page=1&pageSize=30&recmmdSize=1
    
    //        let params = ["isFirstOpen": false,"page": 1,"pageSize":30,"recmmdSize": 1] as [String : Any]
    //        NetwrokBaseApi.shared.request("https://search.ximalaya.com/guideWordV2/2.6", method: .get, params: params).responseJson { result in
    //            print("result:\(result)")
    //        }
    
    
    
    func requestData(){
        self.showLoadingView()
        self.propertys.sections = [:]
        
        var  bannerArr = [String]()
        var  todayHotArr = [String]()
        var  categoryListArr = [[String]]()
        var  guessYouLikeArr = [XMBodyItemModel]()
        //https://mobile.ximalaya.com/discovery-feed/v3/mix/ts-1630848670825?firstInstall=0&appid=0&topBuzzVersion=3&click=false&deviceId=37B45C87-58E6-4F1D-A9BD-C3C7B9FA0F4F&onlyBody=false&operator=3&code=43_440000_4403&osUpdateTime=1607275041.713700&giftTag=0&hotPlayModuleShowTimes=2&channel=ios-b1&ageRange=&interestedCategories=&systemIDFA=61CEAF02-54AA-4995-8C6B-6F0FE3EEC379&version=8.3.21&idfaLimit=0&guessPageId=17&offset=3&uid=136001372&xt=1630848670825&countyCode=440306&scale=3&network=WIFI&traitValue=&traitKey=&device=iPhone&categoryId=-2
        
        let time =   Int64(Date().timeIntervalSince1970)
        var params = [String: Any]()
        params["firstInstall"] = 0
        params["appid"] = 0
        params["topBuzzVersion"] = 3
        params["click"] = false
        params["deviceId"] = UIDevice.current.identifierForVendor?.uuidString
        params["onlyBody"] = false
        params["operator"] = 3
        params["code"] = "43_440000_4403"
        params["osUpdateTime"] = time
        params["giftTag"] = 0
        params["hotPlayModuleShowTimes"] = 2
        params["channel"] = "ios-b1"
        params["ageRange"] = ""
        params["interestedCategories"] = ""
        params["systemIDFA"] = UIDevice.current.identifierForVendor?.uuidString
        params["version"] = "8.3.21"
        params["idfaLimit"] =  0
        params["guessPageId"] =  1
        params["offset"] =  3
        params["uid"] =  "136001372"
        params["xt"] =  time
        params["countyCode"] =  "440306"
        params["scale"] =  3
        params["network"] =  "WIFI"
        params["traitValue"] =  ""
        params["device"] =  "iPhone"
        params["categoryId"] =  -2
        
        
        
        let urlString = "https://mobile.ximalaya.com/discovery-feed/v3/mix/ts-1630848670825?firstInstall=0&appid=0&topBuzzVersion=3&click=false&deviceId=37B45C87-58E6-4F1D-A9BD-C3C7B9FA0F4F&onlyBody=false&operator=3&code=43_440000_4403&osUpdateTime=1607275041.713700&giftTag=0&hotPlayModuleShowTimes=2&channel=ios-b1&ageRange=&interestedCategories=&systemIDFA=61CEAF02-54AA-4995-8C6B-6F0FE3EEC379&version=8.3.21&idfaLimit=0&guessPageId=17&offset=3&uid=136001372&xt=1630848670825&countyCode=440306&scale=3&network=WIFI&traitValue=&traitKey=&device=iPhone&categoryId=-2"
        
        //        let urlString = "https://mobile.ximalaya.com/discovery-feed/v3/mix/ts-1630848670825"
        
        
        NetwrokBaseApi.shared.request(urlString,method: .get, params: params).responseCacheAndString { value in
            
            switch value.result{
            case .success(let jsonString):
                //                print("success::::::-----\(jsonString)")
                self.propertys.model = XMHomeModel.deserialize(from: jsonString)
                self.propertys.model?.header?.forEach({ headerModel in
                    
                    guard let moduleType = headerModel.item?.moduleType else {
                        return
                    }
                    if moduleType == kfocus{
                        
                        bannerArr = self.handlerListData(moduleType: kfocus, list: headerModel.item?.list?[0].data)
                        
                    }else if moduleType == kSquare{
                        
                        categoryListArr  =    self.handlerSquareListData(square: headerModel.item?.list)
                        
                    }else if moduleType == kTopBuzz2 {
                        
                        todayHotArr = self.handlerListData(moduleType: kTopBuzz2, list: headerModel.item?.list)
                        
                    }
                    
                })
                
                self.propertys.model?.body?.forEach({ bodyModel in
                    if bodyModel.sourceModuleType == kGuessYouLike{
                        guard let item = bodyModel.item else {
                            return
                        }
                        guessYouLikeArr.append(item)
                    }
                })
                self.propertys.sections[.banner] = self.propertys.sections[.banner] ?? [] + bannerArr
                self.propertys.sections[.category] = self.propertys.sections[.category] ?? [] + categoryListArr
                self.propertys.sections[.todayHot] = self.propertys.sections[.todayHot] ?? [] + todayHotArr
                self.propertys.sections[.guessYouLike] = self.propertys.sections[.guessYouLike] ?? [] + guessYouLikeArr
                if self.propertys.model?.ret == 0 {
                    
                }else{
                    self.showHudText(text: self.propertys.model?.msg ?? "")
                }
                
                self.tableView.reloadData()
            case .failure(let error):
                print("error-------\(error)")
            }
            
        }
        
    }
    
    func handlerSquareListData(square:[XMHeaderItemListModel]?) -> [[String]] {
        var templist = [[String]]()
        var listArr = [String]()
        var imageArr = [String]()
        square?.map({ model in
            if let title = model.title, let coverPath  = model.coverPath {
                listArr.append(title)
                imageArr.append(coverPath)
            }
        })
        templist.append(listArr)
        templist.append(imageArr)
        
        return templist
        
    }
    public  func handlerListData(moduleType:String,list:[Any]?)-> [String]{
        
        switch moduleType {
        case kfocus:
            guard let tempList = list as? [XMHeaderItemListDataModel] else { return [""]}
         
            return tempList.map{(item) -> String in
                (item.cover ?? "")
            }
        case kTopBuzz2:
            guard let tempList = list as? [XMHeaderItemListModel] else { return [""]}
            return tempList.map{(item) -> String in
                (item.title ?? "")
            }
        default:
            break
            
        }
        return [""]
        
    }
    
    
    
    
    // 猜你喜欢
    //    https://mobile.ximalaya.com/discovery-feed/v3/mix/ts-1630644710287?firstInstall=0&appid=0&topBuzzVersion=3&click=true&deviceId=37B45C87-58E6-4F1D-A9BD-C3C7B9FA0F4F&onlyBody=false&operator=3&code=43_440000_4403&osUpdateTime=1607275041.713700&giftTag=0&hotPlayModuleShowTimes=1&channel=ios-b1&ageRange=&interestedCategories=&systemIDFA=61CEAF02-54AA-4995-8C6B-6F0FE3EEC379&version=8.3.21&idfaLimit=0&guessPageId=4&offset=2&uid=136001372&xt=1630644710288&countyCode=440306&scale=3&network=WIFI&traitValue=&traitKey=&device=iPhone&categoryId=-2
    
    //https://mobile.ximalaya.com/discovery-feed/v3/mix/ts-1630632771533?firstInstall=0&appid=0&topBuzzVersion=3&click=false&deviceId=37B45C87-58E6-4F1D-A9BD-C3C7B9FA0F4F&onlyBody=false&operator=3&code=43_440000_4403&osUpdateTime=1607275041.713700&giftTag=0&hotPlayModuleShowTimes=1&channel=ios-b1&ageRange=&interestedCategories=&systemIDFA=61CEAF02-54AA-4995-8C6B-6F0FE3EEC379&version=8.3.21&idfaLimit=0&guessPageId=4&offset=2&uid=136001372&xt=1630632771533&countyCode=440306&scale=3&network=WIFI&traitValue=&traitKey=&device=iPhone&categoryId=-2
    
    
    
    
}

