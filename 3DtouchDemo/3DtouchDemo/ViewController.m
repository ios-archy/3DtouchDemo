//
//  ViewController.m
//  3DtouchDemo
//
//  Created by yuqi on 16/4/8.
//  Copyright © 2016年 yuqi. All rights reserved.
//

#import "ViewController.h"
#import "TwoViewController.h"
#import "FirstViewController.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UIViewControllerPreviewingDelegate>

@property (nonatomic,strong)UITableView *MyContent;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.MyContent];
}
-(UITableView *)MyContent
{
    if (!_MyContent) {
        _MyContent =[[UITableView alloc]initWithFrame:self.view.frame];
        _MyContent.showsHorizontalScrollIndicator = NO;
        _MyContent.showsVerticalScrollIndicator = NO;
        _MyContent.delegate = self;
        _MyContent.dataSource =self;
    }
    return _MyContent;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"cellIdentifier";
    
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text =[NSString stringWithFormat:@"这是第%li行，第%li列",(long)indexPath.section,(long)indexPath.row];
    //首先判断是否支持Touch
    if(self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable )
//        UIForceTouchCapabilityUnknown = 0,
//        UIForceTouchCapabilityUnavailable = 1,
//        UIForceTouchCapabilityAvailable = 2
    {
        //为一个view注册 3D Touch  preview (peek) and commit (pop)
        [self registerForPreviewingWithDelegate:self sourceView:cell];
    }
    return  cell;
}

#pragma mark  UIViewControllerPreviewingDelegate
//preview (peek)
- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location NS_AVAILABLE_IOS(9_0)
{
    NSIndexPath *index =[self.MyContent indexPathForCell:(UITableViewCell *) previewingContext.sourceView];
    UIViewController *base;
    if(index.row / 2)
    {
       base =[[FirstViewController alloc]init];
    }
    else
    {
        base =[[TwoViewController alloc]init];
    }
    base.preferredContentSize = CGSizeMake(0, self.view.frame.size.height - 100);
    return base;
}
//commit (pop)
- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit NS_AVAILABLE_IOS(9_0)
{
    //将下个界面的详情用视图pop出来
    [self showDetailViewController:viewControllerToCommit sender:self];
}
@end
