//
//  PageMenuAndContentController.m
//  QiPageController
//
//  Created by qinwanli on 2019/6/14.
//  Copyright © 2019 qishare. All rights reserved.
//

#import "PageMenuAndContentController.h"
#import "QiPageMenuView.h"
#import "QiPageContentView.h"
#import "UIView+frame.h"
@interface PageMenuAndContentController ()

@end

@implementation PageMenuAndContentController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self setupMenuViewMethod1];
    
    
    
    // Do any additional setup after loading the view.
}

- (void)setupMenuViewMethod1 {
    
    //定制样式
    NSDictionary *dataSource = @{
                                 QiPageMenuViewNormalTitleColor : [UIColor blackColor],
                                 QiPageMenuViewSelectedTitleColor : [UIColor redColor],
                                 QiPageMenuViewTitleFont : [UIFont systemFontOfSize:14],
                                 QiPageMenuViewSelectedTitleFont : [UIFont systemFontOfSize:18],
                                 QiPageMenuViewItemIsVerticalCentred : @(YES),
                                 QiPageMenuViewItemTitlePadding : @(10.0),
                                 QiPageMenuViewItemTopPadding : @(10.0),
                                 QiPageMenuViewItemPadding : @(10.0),
                                 QiPageMenuViewLeftMargin : @(20.0),
                                 QiPageMenuViewRightMargin : @(20.0),
                                 QiPageMenuViewItemWidth : @(0.0),
                                 QiPageMenuViewItemsAutoResizing : @(YES),
                                 QiPageMenuViewItemHeight : @(40.0),
                                 QiPageMenuViewHasUnderLine :@(YES),
                                 QiPageMenuViewLineColor : [UIColor greenColor],
                                 QiPageMenuViewLineWidth : @(30.0),
                                 QiPageMenuViewLineHeight : @(4.0),
                                 QiPageMenuViewLineTopPadding : @(10.0)
                                 };
    UIViewController *ctrl = [UIViewController new];
    ctrl.view.backgroundColor = [UIColor blueColor];
    ctrl.edgesForExtendedLayout = UIRectEdgeNone;
    UIViewController *ctrl1 = [UIViewController new];
    ctrl1.view.backgroundColor = [UIColor purpleColor];
    
    UIViewController *ctrl2 = [UIViewController new];
    ctrl2.view.backgroundColor = [UIColor brownColor];
    
    UIViewController *ctrl3 = [UIViewController new];
    ctrl3.view.backgroundColor = [UIColor redColor];
    
    UIViewController *ctrl4 = [UIViewController new];
    ctrl4.view.backgroundColor = [UIColor greenColor];
    UIViewController *ctrl5 = [UIViewController new];
    ctrl3.view.backgroundColor = [UIColor redColor];
    
    UIViewController *ctrl6 = [UIViewController new];
    ctrl4.view.backgroundColor = [UIColor greenColor];
    
    QiPageMenuView *menuView = [[QiPageMenuView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 50) titles:@[@"系统消息",@"节日消息",@"广播通知",@"最新",@"最热",@"你好",@"你好呀"] dataSource:dataSource];
    menuView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:menuView];
    
    QiPageContentView *contenView = [[QiPageContentView alloc]initWithFrame:CGRectMake(0, menuView.bottom+10, self.view.width, self.view.height - menuView.bottom - 10 - 88-10) childViewController:@[ctrl,ctrl1,ctrl2,ctrl3,ctrl4,ctrl5,ctrl6]];
    [self.view addSubview:contenView];
    
    menuView.pageItemClicked = ^(NSInteger clickedIndex, NSInteger beforeIndex, QiPageMenuView *menu) {
        NSLog(@"点击了：之前：%ld 现在：%ld",beforeIndex,clickedIndex);
        [contenView setPageContentShouldScrollToIndex:clickedIndex beforIndex:beforeIndex];
    };
    
    contenView.pageContentViewDidScroll = ^(NSInteger currentIndex, NSInteger beforeIndex, QiPageContentView * _Nonnull pageView) {
        menuView.pageScrolledIndex = currentIndex;
        NSLog(@"滚动了：之前：%ld 现在：%ld",beforeIndex,currentIndex);
    };
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)dealloc
{
    NSLog(@"%@🐯🐯🐯🐯🐯🐯🐯🐯🐯🐯🐯",NSStringFromClass(self.class));
}
@end
