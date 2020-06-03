//
//  ZHSelectDataPopView.m
//  exhibition
//
//  Created by 古军 on 2020/6/2.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "ZHSelectDataPopView.h"
#import "ZHSelelctScreenView.h"
#import "SearchcontentCell.h"

#define VisitdataViewHight  300
#define ViewHeight  SCREEN_HEIGHT - 64
#define ViewHeightX SCREEN_HEIGHT - 88

@interface ZHSelectDataPopView()<UITableViewDelegate,UITableViewDataSource>
{
    NSInteger Top;
}
@property (nonatomic, strong) ZHSelelctScreenView   *screentableview;
@property (nonatomic, strong) NSMutableArray * dataArray;
@end


@implementation ZHSelectDataPopView

- (id)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        
        if (iPhoneX) {
            Top= ViewHeightX;
        }else if (iPhoneXr || iPhoneXs_Max){
            Top= ViewHeightX;
        }else{
            Top= ViewHeight;
        }
        
        [self setupContent];
    }
    
    return self;
}
- (void)setupContent {
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, Top);
    
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(disMissView)]];
    
    if (self.screentableview == nil) {
        self.screentableview = [ZHSelelctScreenView searchdataView];
//        self.screentableview.visittableviewDelegate = self;
        self.screentableview.tableView.delegate=self;
        self.screentableview.tableView.dataSource=self;
        self.screentableview.backgroundColor = [UIColor whiteColor];

        [self addSubview:self.screentableview];
    }

}


- (void)showInView:(UIView *)view{
    if (!view) {
        return;
    }
    [view addSubview:self];
    [view addSubview:self.screentableview];
    
    NSMutableArray * dealResultArray = [NSMutableArray array];
    //列表数据处理
    
    [self.screentableview.tableView reloadData];
    
    [self.screentableview setFrame:CGRectMake(0, 0, SCREEN_WIDTH, VisitdataViewHight)];
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.alpha = 1.0;
        
        [self.screentableview setFrame:CGRectMake(0, 0, SCREEN_WIDTH, VisitdataViewHight)];
        
    } completion:nil];
}

- (void)disMissView {

    [self.screentableview setFrame:CGRectMake(0, 0, SCREEN_WIDTH, VisitdataViewHight)];
    [UIView animateWithDuration:0.3f
                     animations:^{
                         
                         self.alpha = 0.0;
                         
                         [self.screentableview setFrame:CGRectMake(0, 0, SCREEN_WIDTH, VisitdataViewHight)];
                     }
                     completion:^(BOOL finished){
                         
                         [self removeFromSuperview];
                         [self.screentableview removeFromSuperview];
                         
                     }];
}


#pragma mark 数据弹框代理方法
//- (void)VisitensureButton:(UIButton *)sender{
//    sender.enabled = NO;
//
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        sender.enabled = YES;
//    });
//    if ([self.VisitDataPopDelegate respondsToSelector:@selector(visitdataEnsureButton)]) {
//        [self.VisitDataPopDelegate visitdataEnsureButton];
//    }
//
//    [self disMissView];
//}






- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray =[NSMutableArray array];
    }
    return _dataArray;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;//self.dataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SearchcontentCell *cell = [SearchcontentCell SearchcontentTableViewCellWithTableView:tableView];
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.content.text = @"测试数据测试数据测试数据测试数据测试数据";
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44*myX6;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    [self disMissView];
}

@end
