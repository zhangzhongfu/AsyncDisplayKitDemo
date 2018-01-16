//
//  SocialViewModel.m
//  AsyncDisplayKitDemo
//

#import "SocialViewModel.h"
#import "SocialAppItem.h"

@implementation SocialViewModel

- (instancetype)init {
    if (self = [super init]) {
        [self readSocialJsonWithSuccessBlock:nil failure:nil];
    }
    return self;
}

- (void)readSocialJsonWithSuccessBlock:(void(^)(void))success failure:(void (^)(void))failure {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSString *path = [[NSBundle mainBundle] pathForResource:@"social" ofType:@"json"];
        NSData *datas = [NSData dataWithContentsOfFile:path];
        NSArray *object = (NSArray *)[NSJSONSerialization JSONObjectWithData:datas options:0 error:nil];

        for (NSDictionary *dict in object) {
            SocialAppItem *item = [[SocialAppItem alloc] initWithDict:dict];
            [self.dataArray addObject:item];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            if (object.count) {
                if (success) {
                    success();
                }
            }
            else {
                if (failure) {
                    failure();
                }
            }
        });
    });
}

- (NSMutableArray<SocialAppItem *> *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

@end
