//
//  SocialAppBottomOperationNode.h
//  ASDisplayKitLayoutSpecDemo
//
//  Created by zzf on 12/01/2018.
//  Copyright © 2018 童星. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "SocialAppItem.h"

@class SocialAppItem;

@interface SocialAppBottomOperationNode : ASDisplayNode
/**
 *  @brief the item of the cell node.
 */
@property (strong, nonatomic) SocialAppItem *tableViewItem;

- (instancetype)initWithTableViewItem:(SocialAppItem *)tableViewItem;
@end
