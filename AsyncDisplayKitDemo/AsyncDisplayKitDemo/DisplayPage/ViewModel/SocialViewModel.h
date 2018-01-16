//
//  SocialViewModel.h
//  AsyncDisplayKitDemo
//

#import <Foundation/Foundation.h>
#import "SocialAppItem.h"

@interface SocialViewModel : NSObject

@property (nonatomic, strong) NSMutableArray<SocialAppItem *> *dataArray;

- (void)readSocialJsonWithSuccessBlock:(void(^)(void))success failure:(void(^)(void))failure;

@end
