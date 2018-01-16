//  Created by 童星 on 16/8/8.
//  Copyright © 2016年 童星. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SocialAppItem: NSObject


@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *name;
/**
 *  头像
 */
@property (nonatomic, copy) NSString *photo;
/**
 *  内容
 */
@property (nonatomic, copy) NSString *post;
/**
 *  发布时间
 */
@property (nonatomic, copy) NSString *time;
/**
 *  发布的图片
 */
@property (nonatomic, copy) NSString *media;
/**
 *  发布的平台
 */
@property (nonatomic, assign) NSInteger via;

@property (nonatomic, assign) NSInteger likes;
@property (nonatomic, assign) NSInteger comments;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end
