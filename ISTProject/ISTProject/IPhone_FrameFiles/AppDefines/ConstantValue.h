//
//  ConstantValue.h
//  JieXinIphone
//
//  Created by liqiang on 14-2-19.
//  Copyright (c) 2014年 sunboxsoft. All rights reserved.
//


// 79  端口是80
#define  kDomain    @"http://42.96.173.8:8080/Interface/"
#define  kImageUrlPrefix    @"http://42.96.173.8:8080/"



#define  kNavHeight  44
#define  kTabbarHeight 50
#define kOperationBtnsViewHeight  44


typedef NS_ENUM(NSInteger, ModelCatagoryType) {
    NewUpLoadType = 1,
    MostDownLoad,
    MostPopular,
};

typedef NS_ENUM(NSInteger, HttpRequestType) {
    LoginRequestType,
    RegisterRequestType,
    CollectionRequestType,
    LikeModelRequestType,
    ModelListRequestType,
    ModelDetailInfoRequestType,
    
};


