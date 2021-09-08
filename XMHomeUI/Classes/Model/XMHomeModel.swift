//
//  XMHomeModel.swift
//  XMHomeUI
//
//  Created by flowerflower on 2021/9/2.
//

import Foundation
import BaseUI
public class XMHomeModel: BaseModel {
    
    public var msg: String?
    
    public var ret: Int?
    
    public var stream_option: XMStreamOptionModel?
    
    public var code: String?
    
    public var offset: Int?
    
    public var tabs: [XMTabsModel]?
    
    public var bucketId: Int?
    
    public var body: [XMBodyModel]?
    
    public var isNewUser: Bool?
    
    public var clearModuleHis: Bool?
    
    public var profileId: Int?
    
    public var header: [XMHeaderModel]?
    
    public required init() {}

    
}

public class XMStreamOptionModel: BaseModel {
    
    public var guessTip: String?
    
    public var guessTipIting: String?
    
    public var guessUbtTraceId: String?
    
    public var showGuessCycle: Bool?
    
    public var title: String?
    
    public var ubtTraceId: String?
    
    
}

public class XMTabsModel: BaseModel {
    
    
    public var channelId: Int?
    
    public var firstShowOrNot: Bool?
    
    public var relativeCategory: String?
    
    public var relativeCategoryId: Int?
    
    public var streamType: String?
    
    public var tabTitle: String?

}

public class XMBodyModel: BaseModel {
    
    public var item: XMBodyItemModel?
    
    public var itemType: String?
    
    public var layoutId: Int?
    
    public var sourceModuleType: String?
    
    
}
public class XMHeaderModel: BaseModel {
    
    public var item: XMHeaderItemModel?
    
    public var itemType: String?
    
    public var layoutId: Int?
    
    
    
}


public class XMBodyItemModel: BaseModel {
    
    public var albumId: Int?
    
    public var category: String?
    
    public var categoryId: Int?
    
    
    public var contractStatus: Int?
    
    
    public var coverLarge: String?
    public var coverMiddle: String?
    public var coverPath: String?
    public var coverSmall: String?
    
    public var dislikeReasonNew: XMBodyItemDislikeReasonNewModel?

    public var isPaid: Bool?
    
    public var isSampleAlbumTimeLimited: Bool?
    
    public var isVipFree: Bool?
    
    
    public var lastUptrackAt: Int?
    
    
    public var nickname: String?
    
    
    public var playsCounts: Int?
    
    public var preferredType: Int?
    
    public var subscribeStatus: Bool?
    
    
    public var title: String?
    
    public var intro: String?
    
    public var tracks: Int?
    
    public var type: String?

    
    
}

public class XMBodyItemDislikeReasonNewModel: BaseModel {
    
    
    public var `default`: [XMBodyItemDislikeReasonNewItemModel]?

    public var traits: [XMBodyItemDislikeReasonNewItemModel]?
    
    
    
    
}
public class XMBodyItemDislikeReasonNewItemModel: BaseModel {
    
    public var codeType:String?

    public var name:String?
    
}



public class XMHeaderItemModel: BaseModel {
    
    public var lId: Int?
    
    public var list: [XMHeaderItemListModel]?
    
    public var moduleId: Int?
    
    public var moduleType: String?
    
    public var tagSelected: Bool?
    
    public var title: String?
    
    
    
    
}

public class XMHeaderItemListModel: BaseModel {
    
    public var data: [XMHeaderItemListDataModel]?
    
    public var responseId: Int?
    
    public var ret: Int?
    
    
    ///square
    public var bubbleText: String?
    
    public var coverPath: String?
    
    public var title: String?
    

    

    
}

public class XMHeaderItemListDataModel: BaseModel {
    
    public var adBucketIds: String?
    
    public var adId: Int?
    
    public var adType: Int?
    
    public var  buttonShowed: Bool?
    
    
    public var clickAction: Int?
    
    public var clickTokenEnable: Bool?
    
    public var clickTokens: [String]?
    
    public var  clickType: Int?
    
    public var cover: String?
    
    public var displayType: Int?
    
    public var  dpRealLink: String?
    
    public var isAd: Bool?
    
    public var isInternal: Int?
    
    public var  isLandScape: Bool?
    
    public var  isShareFlag: Bool?
    
    public var  isTrueExposure: Bool?
            
    public var link: String?
    
    
    public var linkType: Int?
    
    
    public var openlinkType: Int?
    
    public var  realLink: String?
    
    public var  recSrc: String?
    
    public var  recTrack: String?
            
    public var showTokenEnable: Bool?
            
    public var thirdClickStatUrls: [String]?
    
    public var thirdShowStatUrls: [String]?
    
    public var targetId: Int?
  
}

