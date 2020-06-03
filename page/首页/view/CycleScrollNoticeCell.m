//
//  CycleScrollNoticeCell.m
//  exhibition
//
//  Created by 古军 on 2020/5/28.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "CycleScrollNoticeCell.h"
#import "NoticeNewsCell.h"

@interface CycleScrollNoticeCell ()<GYRollingNoticeViewDataSource, GYRollingNoticeViewDelegate>

{
    NSMutableArray *_arr;
}

@end

@implementation CycleScrollNoticeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

        [self initLayoutUI];
    }
    return self;
}

- (void)initLayoutUI{
    _arr = [NSMutableArray array];

    self.noticeView = [[GYRollingNoticeView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 82)];
    [self addSubview:self.noticeView];

    _noticeView.delegate = self;
    _noticeView.dataSource = self;
    [self.noticeView registerClass:[NoticeNewsCell class] forCellReuseIdentifier:@"NoticeNewsCell"];
    [_noticeView reloadDataAndStartRoll];

}

#pragma mark- <GYRollingNoticeViewDataSource, GYRollingNoticeViewDelegate>
- (NSInteger)numberOfRowsForRollingNoticeView:(GYRollingNoticeView *)rollingView
{
    return _arr.count;
}
- (__kindof GYNoticeViewCell *)rollingNoticeView:(GYRollingNoticeView *)rollingView cellAtIndex:(NSUInteger)index
{
    NoticeNewsCell *cell = [rollingView dequeueReusableCellWithIdentifier:@"NoticeNewsCell"];
    
    NSString *text = _arr[index];
    cell.customLab.text = text;
//    NSDictionary *attributedDict = @{
//                                     NSFontAttributeName:[UIFont boldSystemFontOfSize:18],
//                                     NSForegroundColorAttributeName:[UIColor redColor],
//                                     };
//    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc]initWithString:text];
//    [attributeStr addAttributes:attributedDict range:[text rangeOfString:@"•"]];
//    cell.customLab.attributedText = attributeStr;
//    cell.contentView.backgroundColor = [UIColor redColor];
    return cell;
}

- (void)didClickRollingNoticeView:(GYRollingNoticeView *)rollingView forIndex:(NSUInteger)index
{
    NSLog(@"点击的index: %d", rollingView.currentIndex);
}

- (void)dealloc
{
    NSLog(@"通知定时销毁%s", __func__);
}

-(void)reloadNoticeCellData
{
//    NSArray * array = [Tool getRecentlyNotice];
    NSArray * array = @[@"使用Flutter的一套的视觉、结构、平台、和交互式的widgets，快速创建漂亮的APP",@"也是拼了！拉斯维加斯赌场老板送机票拉游客"];
    BOOL isSameArray = [self array:_arr isEqualTo:array];
    if (!isSameArray) {
        [_arr removeAllObjects];
        _arr = [array mutableCopy];
        
        [self.noticeView reloadDataAndStartRoll];
    }
}

- (NSArray *)getNoticeThressArray:(NSArray *)array{
    NSMutableArray *newArray = [NSMutableArray array];
    if (array.count>3) {
        [newArray addObject:array[0]];
        [newArray addObject:array[1]];
        [newArray addObject:array[2]];
    }else if (0<array.count && array.count<3){
        [newArray addObjectsFromArray:array];
    }
    return newArray;
}

- (BOOL)array:(NSArray *)array1 isEqualTo:(NSArray *)nowarray {
    NSArray *array2 = [self getNoticeThressArray:nowarray];
    if (array1.count != array2.count) {
        return NO;
    }
    return YES;
}

@end
