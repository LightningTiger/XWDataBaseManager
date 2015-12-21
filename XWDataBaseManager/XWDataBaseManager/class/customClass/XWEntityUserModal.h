//
//  XWEntityUser.h
//  XWStringCategoryTest
//
//  Created by wzl on 15/11/5.
//  Copyright © 2015年 wzl. All rights reserved.
//

#import "XWEntityBaseModal.h"

typedef enum : NSUInteger {
    XWGenderDefault,
    XWGenderMan,
    XWGenderWoman
} XWGender;

@interface XWEntityUserModal : XWEntityBaseModal

@property (nonatomic, strong) NSString* userID;
@property (nonatomic, strong) NSString* userName;
@property (nonatomic, strong) NSString* trueName;
@property (nonatomic, strong) NSString* password;
@property (nonatomic, strong) NSString* phoneNumber;
@property (nonatomic, strong) NSString* email;
@property (nonatomic, strong) NSString* QQ;
@property (nonatomic, assign) XWGender gender;
@property (nonatomic, strong) NSString* largePortraitUrl;
@property (nonatomic, strong) NSString* smallPortraitUrl;
@property (nonatomic, strong) NSString* diploma;
@property (nonatomic, assign) NSInteger age;

@end
