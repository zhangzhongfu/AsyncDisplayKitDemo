//
//  SocialAppBottomOperationNode.m
//  ASDisplayKitLayoutSpecDemo
//
//  Created by zzf on 12/01/2018.
//  Copyright © 2018 童星. All rights reserved.
//

#import "SocialAppBottomOperationNode.h"
#import "LikesNode.h"
#import "CommentsNode.h"
#import "SocialAppItem.h"

@interface SocialAppBottomOperationNode ()
{
    LikesNode           *_likesNode;
    CommentsNode        *_commentNode;
    ASImageNode         *_optionNode;
}
@end


@implementation SocialAppBottomOperationNode

- (instancetype)initWithTableViewItem:(SocialAppItem *)tableViewItem {
    self = [super init];
    if (self) {
        self.tableViewItem = tableViewItem;
    }
    [self cellLoadSubNodes];
    return self;
}

- (void)cellLoadSubNodes {
    _likesNode = [[LikesNode alloc] initWithLikesCount:self.tableViewItem.likes];
    [self addSubnode:_likesNode];

    _commentNode = [[CommentsNode alloc] initWithCommentsCount:self.tableViewItem.comments];
    [self addSubnode:_commentNode];

    _optionNode = [[ASImageNode alloc] init];
    _optionNode.image = [UIImage imageNamed:@"icon_more"];
    [self addSubnode:_optionNode];
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    ASStackLayoutSpec *mainStack;
    mainStack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal
                                                        spacing:6.0
                                                 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsCenter
                                                       children:@[_likesNode, _commentNode, _optionNode]];
    return mainStack;
}



@end
