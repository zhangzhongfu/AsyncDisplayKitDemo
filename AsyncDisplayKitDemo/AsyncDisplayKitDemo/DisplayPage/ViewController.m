//
//  ViewController.m
//  AsyncDisplayKitDemo
//

#import "ViewController.h"
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import <MJRefresh.h>
#import "SocialAppItem.h"
#import "SocialAppItemCellNode.h"
#import "SocialViewModel.h"

#if !ZFWeakifySelf
#define ZFWeakifySelf \
__weak __typeof(&*self)zf_weak_object = self

#define ZFStrongifySelf \
__strong __typeof(&*zf_weak_object)self = zf_weak_object

#endif

@interface ViewController ()<ASTableDelegate, ASTableDataSource>

@property (nonatomic, strong) ASTableNode *tableNode;
@property (nonatomic, strong) SocialViewModel *viewModel;

@end

@implementation ViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"AsyncDisplayKit";
    [self.view addSubnode:self.tableNode];

    [self.tableNode.view.mj_header beginRefreshing];
}

#pragma mark - private
- (void)updateData {
    ZFWeakifySelf;
    [self.viewModel readSocialJsonWithSuccessBlock:^{
        ZFStrongifySelf;
        [self.tableNode reloadData];
    } failure:^{

    }];
}

- (void)loadNewData {
    [self.tableNode.view.mj_header endRefreshing];
    [self.viewModel.dataArray removeAllObjects];
    [self updateData];
}

- (void)downloadMoreData {
    [self.tableNode.view.mj_footer endRefreshing];
    [self updateData];
}

#pragma mark - ASTableDelegate, ASTableDataSource
- (NSInteger)tableNode:(ASTableNode *)tableNode numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.dataArray.count;
}

- (ASCellNodeBlock)tableNode:(ASTableNode *)tableNode nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath {
    return ^{
        SocialAppItemCellNode *node = [[SocialAppItemCellNode alloc] initWithTableViewItem:self.viewModel.dataArray[indexPath.row]];
        node.tableViewItem = self.viewModel.dataArray[indexPath.row];
        return node;
    };
}

- (void)tableNode:(ASTableNode *)tableNode didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableNode deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Lazy load
- (ASTableNode *)tableNode {
    if (!_tableNode) {
        _tableNode = [[ASTableNode alloc] init];
        _tableNode.frame = self.view.bounds;
        _tableNode.dataSource = self;
        _tableNode.delegate = self;

        _tableNode.view.mj_header = [MJRefreshGifHeader headerWithRefreshingTarget:self
                                                                  refreshingAction:@selector(loadNewData)];
        _tableNode.view.mj_footer = [MJRefreshBackGifFooter footerWithRefreshingTarget:self
                                                                      refreshingAction:@selector(downloadMoreData)];
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.frame.size.width, 20.0f)];
        view.backgroundColor = [UIColor whiteColor];
        _tableNode.view.tableHeaderView = view;
    }
    return _tableNode;
}

- (SocialViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[SocialViewModel alloc] init];
    }
    return _viewModel;
}

- (void)dealloc {
    NSLog(@"\n************\n %@ dealloc \n************", self.class);
}

@end
