//
//  StaticValue.h
//  SM_Show
//
//  Created by 雷克 on 11-4-26.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
static NSString *kTitle = @"title";
static NSString *kNormalImage = @"kNormalImage";
static NSString *kSelectImage = @"kSelectImage";
static NSString *kType = @"kType";
static NSString *kNetWorkWrongStr = @"网络或服务器故障。";

#define HasLogin            @"HasLogin"
#define kLoginStatus		@"LoginStatus"
#define ModuleDataRequest   @"ModuleDataRequest"
#define kLoginSuccess       @"kLoginSuccess"
#define kEnterChatDetail    @"kEnterChatDetail"
#define kDeleteChatList    @"kDeleteChatList"
#define kMySendMeassage     @"kMySendMeassage"
//修改心情成功
#define kUpdateMoodFinish  @"kUpdateMoodFinish"
//修改群信息成功
#define kAlertGroupInfoFinished  @"kAlertGroupInfoFinished"
//上传文件到服务器
#define kUploadFileToServer     @"kUploadFileToServer"
//上传文件的进度
#define kUploadProcess          @"kUploadProcess"
//上传文件成功
#define kFileUploadFinish    @"kFileUploadFinish"
//点击文件上传或下载或打开
#define kBubbleContinueBtnTap @"kBubbleContinueBtnTap"
//点击语音文件
#define kVoiceSegmentBtnTap  @"kVoiceSegmentBtnTap"
//发送广播消息
#define kSendBroadcastIms @"kSendBroadcastIms"

//返回选中的文件
#define kSelectReturnFile @"kSelectReturnFile"
// 下载声音片段
#define kDownLoadVoiceSegment @"kDownLoadVoiceSegment"
//刷新聊天页面的cell
#define kRefreshDetailCell @"kRefreshDetailCell"

#define kSendAMessageAddToNowChatList @"kSendAMessageAddToNowChatList"
#define kInsertAMessageIntoNowChat      @"kInsertAMessageIntoNowChat"
#define kLoginConnectFinish     @"kLoginConnectFinish"
#define kDeleteAConversation    @"kDeleteAConversation"
#define kDeleteAllConversation  @"kDeleteAllConversation"
#define kPutFirstPlace  @"kPutFirstPlace"
#define kDeleteAllMessages  @"kDeleteAllMessages"
/**
 *  设置某个群“常用群设置”
 */
#define kSetGroupCellectionStatu @"kSetGroupCellectionStatu"
//向指定的群组添加人员（从群组详细页面进入到选人页面）
#define kAddGroupMember @"kAddGroupMember"
//向指定的群组中添加人员（从群组列表页进入到选人页面）
#define kAddGroupMemberWithUsers @"AddGroupMemberWithUsers"
#define kDissovleGroup @"kDissovleGroup"

//记录是否显示欢迎界面
#define kIsHasShowWelcome    @"ShowWelcome0.6.4"


#define  kSoundPath   @"kSoundPath"

#define kUserStatus     @"UserCurrentStatus"
//其实状态要是不从0开始的话可以不设置这一项；
#define kIsNotInitStatus  @"IsNotInitStatus"

//记录验证token后返回的token号
#define kTokenNumb  @"kTokenNumb"
//记录验证token后返回的电话号码
#define kMobileNumb  @"kMobileNumb"
//记录验证token后返回的Eccode号码
#define kEccodeNumb  @"kEccodeNumb"
//记录是否通过第三方登陆
#define kIsViaCaiYunLogin @"kIsViaCaiYunLogin"
//请求群组信息
#define kRequestGroupInfo @"kRequestGroupInfo"




#define kPassword_Key        @"PasswordKey"
#define User_NickName       @"UserNickName"
#define kUser_Name       @"UserLoginName"
#define kCookies    @"kCookies"
#define User_CarPower   @"jurisdiction"

//记录用户信息
#define kUser_id         @"kUser_id"
//记录是否登录的用户改变了
#define kIsChangeUser    @"kIsChangeUser"
#define kSessionId          @"kSessionId"
#define kAuthUser_id    [NSString stringWithFormat:@"user-%@",[[NSUserDefaults standardUserDefaults] objectForKey:kUser_id]]
#define kAuthKey        @"X-User-ID"
#define kServerAddress @"http://111.11.28.39:8080"

#define kDepartId           @"kDepartId"
#define kUserSex            @"kUserSex"
#define kUserSignature      @"kUserSignature"
#define kStatBarShowMsg     @"kStatBarShowMsg"
#define kReceiveGroupMsg    @"kReceiveGroupMsg"
#define kUserRunStatus      @"kUserRunStatus"

#define kEnableAutoReplay    @"kEnableAutoReplay"
#define kAutoReplayTmpId     @"kAutoReplayTmpId"
#define kAutoReplayText      @"kAutoReplayText"
#define kChatImageStorePath   @"kChatImageStorePath"
#define PlistPath  [NSString stringWithFormat:@"%@/Documents/Plist",NSHomeDirectory()]

#define kUserRunStatusOnline        @"kUserRunStatusOnline"
#define kUserRunStatusObusyline     @"kUserRunStatusObusyline"
#define kUserRunStatusHidden        @"kUserRunStatusHidden"
#define kUserRunStatusLeave         @"kUserRunStatusLeave"

#define kIsRemember		@"IsRememberPassword"
#define kIsAutoLogin    @"kIsAutoLogin"
#define kIsExecuteAutoLogin @"kIsExecuteAutoLogin"

//是否更新『聊天背景设置』的选项
#define kIsUpdateSelectBackGround               @"updateSelectBackGround"

// 第一次下载成功头像包
#define kDownloadFinishIconZip @"kDownloadFinishIconZip"


//下载文件的路径
#define kCacheFile    @"kCacheFile"
//存储临时转换音乐wav格式
#define kCache_Music  @"kCacheMusic"
//下载文件时临时存储的路径
#define kTmpCacheFile @"kTmpCacheFile"
//存储图片路径
#define kTemp_image @"temp_image"
//存储视频路径
#define kTemp_vedio @"kTemp_vedio"
//存储音乐
#define kTemp_music @"kTemp_music"

// 各种奇葩的tag值标记值(哥哥这个用来为了实现：让scrollView或tableView的滚动条默认显示出来，而用到的标记值)
#define noDisableVerticalScrollTag 836913
#define noDisableHorizontalScrollTag 836914



//用户注销系统的通知
#define NOTIFICATION_LOGOUT      @"NOTIFICATION_LOGOUT_SOFTWARE"

#define __DEBUG_TEST__ 1

//域名
#define Main_Domain                  @"Main_Domain"
//端口
#define Main_Port                   @"Main_Port"
//企业号
#define Main_DomainId                @"Main_DomainId"





//json字符串
#define JsonStrKey         @"JsonStrKey"

#define kMain_DomainChanged          @"kMain_DomainChanged" //域名是否更改
#define CALLOUT_MENU_IN_READERVIEW   @"CalloutMenuBar"
#define CALLOUT_CUSTOM_TABBAR        @"CalloutCustomTabbar"
#define HIDE_CUSTOM_TABBAR           @"HideCustomTabbar"
#define Resign_NoteTextView_Editing  @"ResignNoteTextViewEditing"
#define SHOW_BADGEVALUE              @"SHOW_BADGEVALUE"
#define Headers_Define               @"Headers"

#define kCommonCellHeight 60.0f
#define kCommonFont  16.0f

//主题颜色
#define kMAIN_THEME_COLOR [UIColor colorWithRed:0/255.0 green:149/255.0 blue:222/255.0 alpha:1.0]
//背景颜色
#define kMAIN_BACKGROUND_COLOR [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0]

#define  kNavBar_Color  RGBCOLOR(53,182,249)

#define kSelectColor RGB(185, 0, 65)
#define kBgViewColor RGB(239, 239, 239)
#define kTitleColor RGB(67, 66, 63)







