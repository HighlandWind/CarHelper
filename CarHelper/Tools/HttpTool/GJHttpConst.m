//
//  GJHttpConst.m
//  GaoYuanFeng
//
//  Created by hsrd on 2018/3/29.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJHttpConst.h"

@implementation GJHttpConst

// Partner
NSString *const Partner_Apply_User = @"api/applyHhr";
NSString *const Partner_Apply_Pay = @"api/payForApply";
NSString *const Partner_Benifit_Money = @"api/getHhrzsy";
NSString *const Shop_Benifit_Money = @"api/getShopzsy";
NSString *const Partner_Withdraw_Cash = @"api/txyr";
NSString *const Partner_WithdrawCash_DetailList = @"api/txyrRecord";
NSString *const Partner_Apply_ShopReg = @"api/applyShopReg";
NSString *const Partner_Apply_Shop = @"api/applyShop";
NSString *const Partner_MyIdentifier_List = @"api/getPartnership";
NSString *const Partner_My_QRCode = @"api/getRecommendationCode";
NSString *const Partner_Shop_Index = @"api/getHhr_index";

// Order
NSString *const Order_Payment_QueryStatus = @"api/payForStatus";
NSString *const Order_Shop_Recharge_List = @"api/getShopCzlist";

// Mine
NSString *const Mine_Upload_Portrait = @"api/editUserImg";
NSString *const Mine_Get_Userinfo = @"api/getUserInfo";
NSString *const Mine_Edit_Userinfo = @"api/editUserInfo";
NSString *const Mine_User_PayRecord = @"api/user_paymd";
NSString *const Mine_APP_Info = @"api/system_info";
NSString *const Mine_Invite_Friends = @"api/user_yqlist";
NSString *const Mine_PayAccountBinding = @"api/binddsfzh";

// Login
NSString *const Login_Get_SMSCode = @"api/getSMSCode";
NSString *const Login_By_TelePhone = @"api/sjgetLogin";

// Home
NSString *const Home_Region_List = @"api/getsjRegionList";
NSString *const Home_Shop_Index = @"api/getShopIndex";
NSString *const Home_Gift_Exam = @"api/getHlhyList";
NSString *const Home_Give_Score = @"api/getShopJfzs";
NSString *const Home_Shop_ScoreList = @"api/getShopJflist";

@end
