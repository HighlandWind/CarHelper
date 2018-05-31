//
//  GJUserInfoData.m
//  GaoYuanFeng
//
//  Created by hsrd on 2018/3/29.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJUserInfoData.h"

@implementation GJUserInfoData

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.userid forKey:@"userId"];
    [encoder encodeObject:self.api_token forKey:@"api_token"];
    [encoder encodeObject:self.type forKey:@"type"];
    [encoder encodeObject:self.tokenid forKey:@"tokenid"];
    [encoder encodeObject:self.wx_tokenid forKey:@"wx_tokenid"];
    [encoder encodeObject:self.group_id forKey:@"group_id"];
    [encoder encodeObject:self.username forKey:@"username"];
    [encoder encodeObject:self.nickname forKey:@"nickname"];
    [encoder encodeObject:self.phone forKey:@"phone"];
    [encoder encodeObject:self.isWX forKey:@"isWX"];
    [encoder encodeObject:self.isQQ forKey:@"isQQ"];
    [encoder encodeObject:self.credits forKey:@"credits"];
    [encoder encodeObject:self.sex forKey:@"sex"];
    [encoder encodeObject:self.sfz_card forKey:@"sfz_card"];
    [encoder encodeObject:self.avatar forKey:@"avatar"];
    [encoder encodeObject:self.money forKey:@"money"];
    [encoder encodeObject:self.freeze forKey:@"freeze"];
    [encoder encodeObject:self.spend forKey:@"spend"];
    
    [encoder encodeObject:self.isShop forKey:@"isShop"];
    [encoder encodeObject:self.isHhr forKey:@"isHhr"];
    [encoder encodeObject:self.region_id forKey:@"region_id"];
    [encoder encodeObject:self.supplier_id forKey:@"supplier_id"];
    [encoder encodeObject:self.registration_id forKey:@"registration_id"];
    [encoder encodeObject:self.default_id forKey:@"default_id"];
    [encoder encodeObject:self.zfbzh forKey:@"zfbzh"];
    [encoder encodeObject:self.wxzh forKey:@"wxzh"];
    
    [encoder encodeObject:self.avatarImage forKey:@"avatarImage"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        self.userid = [decoder decodeObjectForKey:@"userid"];
        self.api_token = [decoder decodeObjectForKey:@"api_token"];
        self.type = [decoder decodeObjectForKey:@"type"];
        self.tokenid = [decoder decodeObjectForKey:@"tokenid"];
        self.wx_tokenid = [decoder decodeObjectForKey:@"wx_tokenid"];
        self.group_id = [decoder decodeObjectForKey:@"group_id"];
        self.username = [decoder decodeObjectForKey:@"username"];
        self.nickname = [decoder decodeObjectForKey:@"nickname"];
        self.phone = [decoder decodeObjectForKey:@"phone"];
        self.isWX = [decoder decodeObjectForKey:@"isWX"];
        self.isQQ = [decoder decodeObjectForKey:@"isQQ"];
        self.credits = [decoder decodeObjectForKey:@"credits"];
        self.sex = [decoder decodeObjectForKey:@"sex"];
        self.sfz_card = [decoder decodeObjectForKey:@"sfz_card"];
        self.avatar = [decoder decodeObjectForKey:@"avatar"];
        self.money = [decoder decodeObjectForKey:@"money"];
        self.freeze = [decoder decodeObjectForKey:@"freeze"];
        self.spend = [decoder decodeObjectForKey:@"spend"];
        
        self.isShop = [decoder decodeObjectForKey:@"isShop"];
        self.isHhr = [decoder decodeObjectForKey:@"isHhr"];
        self.region_id = [decoder decodeObjectForKey:@"region_id"];
        self.supplier_id = [decoder decodeObjectForKey:@"supplier_id"];
        self.registration_id = [decoder decodeObjectForKey:@"registration_id"];
        self.default_id = [decoder decodeObjectForKey:@"default_id"];
        self.zfbzh = [decoder decodeObjectForKey:@"zfbzh"];
        self.wxzh = [decoder decodeObjectForKey:@"wxzh"];
        
        self.avatarImage = [decoder decodeObjectForKey:@"avatarImage"];
    }
    return self;
}

- (void)fillWithDictionary:(NSDictionary *)dictionary {
    self.userid = dictionary[@"userid"];
    self.api_token = dictionary[@"api_token"];
    self.type = dictionary[@"type"];
    self.tokenid = dictionary[@"tokenid"];
    self.wx_tokenid = dictionary[@"wx_tokenid"];
    self.group_id = dictionary[@"group_id"];
    self.username = dictionary[@"username"];
    self.nickname = dictionary[@"nickname"];
    self.phone = dictionary[@"phone"];
    self.isWX = dictionary[@"isWX"];
    self.isQQ = dictionary[@"isQQ"];
    self.credits = dictionary[@"credits"];
    self.sex = dictionary[@"sex"];
    self.sfz_card = dictionary[@"sfz_card"];
    self.avatar = [NSString stringWithFormat:@"%@", dictionary[@"avatar"]];
    self.money = dictionary[@"money"];
    self.freeze = dictionary[@"freeze"];
    self.spend = dictionary[@"spend"];
    
    self.isShop = dictionary[@"isShop"];
    self.isHhr = dictionary[@"isHhr"];
    self.region_id = dictionary[@"region_id"];
    self.supplier_id = dictionary[@"supplier_id"];
    self.registration_id = dictionary[@"registration_id"];
    self.default_id = dictionary[@"default_id"];
    self.zfbzh = dictionary[@"zfbzh"];
    self.wxzh = dictionary[@"wxzh"];
}

- (NSString *)userid {
    return  JudgeContainerCountIsNull(_userid) ? @"" : _userid;
}

- (NSString *)credits {
    return  JudgeContainerCountIsNull(_credits) ? @"0" : _credits;
}

- (NSString *)phone {
    @try {
        if (_phone.length > 0) {
            NSMutableString *str = [[NSMutableString alloc] initWithString:_phone];
            [str replaceCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
            return str;
        }else {
            return @"00000000000";
        }
    } @catch (NSException *exception) {
        return @"00000000000";
    }
}

@end
