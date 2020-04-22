//
//  LRYConstEnum.h
//  yymodelJSON
//
//  Created by 李世达 on 2020/4/22.
//  Copyright © 2020 6renyou. All rights reserved.
//

#ifndef LRYConstEnum_h
#define LRYConstEnum_h
/// tababr item tag
typedef NS_ENUM(NSUInteger, MHTabBarItemTagType) {
    MHTabBarItemTagTypeMainFrame = 0,    /// 消息回话
    MHTabBarItemTagTypeContacts,         /// 通讯录
    MHTabBarItemTagTypeDiscover,         /// 发现
    MHTabBarItemTagTypeProfile,          /// 我的
};


/// 切换根控制器类型
typedef NS_ENUM(NSUInteger, MHSwitchRootViewControllerFromType) {
    MHSwitchRootViewControllerFromTypeNewFeature = 0,  /// 新特性
    MHSwitchRootViewControllerFromTypeLogin,           /// 登录
    MHSwitchRootViewControllerFromTypeLogout,          /// 登出
};

/// 用户登录的渠道
typedef NS_ENUM(NSUInteger, MHUserLoginChannelType) {
    MHUserLoginChannelTypeQQ = 0,           /// qq登录
    MHUserLoginChannelTypeEmail,            /// 邮箱登录
    MHUserLoginChannelTypeWeChatId,         /// 微信号登录
    MHUserLoginChannelTypePhone,            /// 手机号登录
};

/// 用户性别
typedef NS_ENUM(NSUInteger, MHUserGenderType) {
    MHUserGenderTypeMale =0,            /// 男
    MHUserGenderTypeFemale,             /// nv
};

/// 插件详情说明
typedef NS_ENUM(NSUInteger, MHPlugDetailType) {
    MHPlugDetailTypeLook = 0,     /// 看一看
    MHPlugDetailTypeSearch,       /// 搜一搜
};


/// 微信朋友圈类型 （0 配图  1 video 2 share）
typedef NS_ENUM(NSUInteger, MHMomentExtendType) {
    MHMomentExtendTypePicture = 0, /// 配图
    MHMomentExtendTypeVideo,       /// 视频
    MHMomentExtendTypeShare,       /// 分享
};


/// 微信朋友圈分享内容的类型
typedef NS_ENUM(NSUInteger, MHMomentShareInfoType) {
    MHMomentShareInfoTypeWebPage = 0, /// 网页
    MHMomentShareInfoTypeMusic,       /// 音乐
};

#endif /* LRYConstEnum_h */
