//
//  SocialAppItemCellNode.h
//  TimeFaceDemoProject
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "SocialAppItem.h"

@interface SocialAppItemCellNode : ASCellNode

// 模型对象
@property (strong, nonatomic) SocialAppItem *tableViewItem;

- (instancetype)initWithTableViewItem:(SocialAppItem *)tableViewItem;

@end
