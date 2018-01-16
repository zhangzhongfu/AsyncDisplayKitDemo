//  Created by 童星 on 16/8/8.
//  Copyright © 2016年 童星. All rights reserved.
//

#import "SocialAppItem.h"

@implementation SocialAppItem

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        self.name = dict[@"name"];
        self.username = dict[@"username"];
        self.photo = dict[@"photo"];
        self.post = dict[@"post"];
        self.time = dict[@"time"];
        self.media = dict[@"media"];
        self.via = [dict[@"via"] integerValue];
        self.likes = arc4random_uniform(74);
        self.comments = arc4random_uniform(40);
    }
    return self;
}

@end
