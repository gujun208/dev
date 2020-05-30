//
//  TopBannerView.m
//  exhibition
//
//  Created by 古军 on 2020/5/30.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "TopBannerView.h"

@interface TopBannerView ()
{
    UIView *_firstView;
    UIView *_middleView;
    UIView *_lastView;
    
    float _viewWidth;
    float _viewHeight;
    
    UITapGestureRecognizer *_tap;
    BOOL startanimation;
    
}
@property (nonatomic, strong) NSArray <UIView *> * viewList;
@property (nonatomic) NSInteger showIndex;
@property (nonatomic, weak) NSTimer *timer;

@end

@implementation TopBannerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _viewWidth = self.bounds.size.width;
        _viewHeight = self.bounds.size.height;
        
        //设置scrollview
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, _viewWidth, _viewHeight)];
        _scrollView.delegate = self;
        _scrollView.contentSize = CGSizeMake(_viewWidth * 3, _viewHeight);
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.backgroundColor = [UIColor whiteColor];
        _scrollView.delegate = self;
        _autoScrollTimeInterval = 5.0;

        [self addSubview:_scrollView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

#pragma mark 单击手势
-(void)handleTap:(UITapGestureRecognizer*)sender
{
    if ([_bannerdelegate respondsToSelector:@selector(didClickPage:atIndex:)]) {
        [_bannerdelegate didClickPage:self atIndex:_currentPage+1];
    }
}

#pragma mark 设置imageAry
-(void)setViewAry:(NSArray <UIView *>*)iViewAry
{
    if (iViewAry) {
        _viewList = iViewAry;
        _currentPage = 0; //默认为第0页
    }
//    [self reloadData];
    [self reload];
}

#pragma mark 刷新view页面
-(void)reloadData
{
    if (!_firstView) {
        NSLog(@"1");
        startanimation = YES;
    }else{
//        [UIView animateWithDuration:0.5 animations:^{
            self->_firstView.frame = CGRectMake(self->_viewWidth, 0, self->_viewWidth, self->_viewHeight);
            self->_middleView.frame = CGRectMake(0, 0, self->_viewHeight, self->_viewHeight);
            self->_lastView.frame = CGRectMake(self->_viewWidth*2, 0, self->_viewWidth, self->_viewHeight);
            self->startanimation = NO;
//        } completion:^(BOOL finished) {
//
//        }];
    }
    
    [_firstView removeFromSuperview];
    [_middleView removeFromSuperview];
    [_lastView removeFromSuperview];
    //从数组中取到对应的图片view加到已定义的三个view中
    if (_currentPage==0) {
        _firstView = [_viewList lastObject];
        _middleView = [_viewList objectAtIndex:_currentPage];
        _lastView = [_viewList objectAtIndex:_currentPage+1];
    }
    else if (_currentPage == _viewList.count-1)
    {
        _firstView = [_viewList objectAtIndex:_currentPage-1];
        _middleView = [_viewList objectAtIndex:_currentPage];
        _lastView = [_viewList firstObject];
    }
    else
    {
        _firstView = [_viewList objectAtIndex:_currentPage-1];
        _middleView = [_viewList objectAtIndex:_currentPage];
        _lastView = [_viewList objectAtIndex:_currentPage+1];
    }
    
    //设置三个view的frame，加到scrollview上
    _firstView.frame = CGRectMake(0, 0, _viewWidth, _viewHeight);
    _lastView.frame = CGRectMake(_viewWidth*2, 0, _viewWidth, _viewHeight);
    if (startanimation == YES) {
        _middleView.frame = CGRectMake(_viewWidth, 0, _viewWidth, _viewHeight);
    }else{
        [UIView animateWithDuration:0.5 animations:^{
            
            self->_middleView.frame = CGRectMake(self->_viewWidth, 0, self->_viewWidth, self->_viewHeight);
            
            
        }];
    }
    [_scrollView addSubview:_firstView];
    [_scrollView addSubview:_middleView];
    [_scrollView addSubview:_lastView];
    
    //显示中间页
    _scrollView.contentOffset = CGPointMake(_viewWidth, 0);
}

#pragma mark scrollvie停止滑动
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //得到当前页数
    float x = _scrollView.contentOffset.x;
    
    //往前翻
    if (x<=0) {
        if (_currentPage-1<0) {
            _currentPage = _viewList.count-1;
        }else{
            _currentPage --;
        }
    }
    
    //往后翻
    if (x>=_viewWidth*2) {
        if (_currentPage==_viewList.count-1) {
            _currentPage = 0;
        }else{
            _currentPage ++;
        }
    }
    if (self.ScrollItemBlock) {
        self.ScrollItemBlock(_currentPage);
    }
    [self reload];
}
-(void)reload
{
    startanimation = YES;
    
    [_firstView removeFromSuperview];
    [_middleView removeFromSuperview];
    [_lastView removeFromSuperview];
    //从数组中取到对应的图片view加到已定义的三个view中
    if (_currentPage==0) {
        _firstView = [_viewList lastObject];
        _middleView = [_viewList objectAtIndex:_currentPage];
        _lastView = [_viewList objectAtIndex:_currentPage+1];
    }
    else if (_currentPage == _viewList.count-1)
    {
        _firstView = [_viewList objectAtIndex:_currentPage-1];
        _middleView = [_viewList objectAtIndex:_currentPage];
        _lastView = [_viewList firstObject];
    }
    else
    {
        _firstView = [_viewList objectAtIndex:_currentPage-1];
        _middleView = [_viewList objectAtIndex:_currentPage];
        _lastView = [_viewList objectAtIndex:_currentPage+1];
    }
    
    //设置三个view的frame，加到scrollview上
    _firstView.frame = CGRectMake(0, 0, _viewWidth, _viewHeight);
    _lastView.frame = CGRectMake(_viewWidth*2, 0, _viewWidth, _viewHeight);
    if (startanimation == YES) {
        _middleView.frame = CGRectMake(_viewWidth, 0, _viewWidth, _viewHeight);
    }else{
        [UIView animateWithDuration:0.5 animations:^{
            
            self->_middleView.frame = CGRectMake(self->_viewWidth, 0, self->_viewWidth, self->_viewHeight);
            
            
        }];
    }
    [_scrollView addSubview:_firstView];
    [_scrollView addSubview:_middleView];
    [_scrollView addSubview:_lastView];
    
    //显示中间页
    _scrollView.contentOffset = CGPointMake(_viewWidth, 0);
}

#pragma mark 展示下一页
-(void)autoShowNextImage
{
    if (_currentPage == _viewList.count-1) {
        _currentPage = 0;
    }else{
        _currentPage ++;
    }
    [self reloadData];
}
#pragma mark 自动轮播时间
- (void)setAutoScrollTimeInterval:(CGFloat)autoScrollTimeInterval{
    
    _autoScrollTimeInterval = autoScrollTimeInterval;
    
    [self setAutoScroll:self.autoScroll];
}
-(void)setAutoScroll:(BOOL)autoScroll{
    _autoScroll = autoScroll;
    
    [self invalidateTimer];
    
    if (_autoScroll) {
        [self setupTimer];
    }
}
- (void)setupTimer
{
    [self invalidateTimer]; // 创建定时器前先停止定时器，不然会出现僵尸定时器，导致轮播频率错误
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:self.autoScrollTimeInterval target:self selector:@selector(autoShowNextImage) userInfo:nil repeats:YES];
    _timer = timer;
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

- (void)invalidateTimer
{
    [_timer invalidate];
    _timer = nil;
}


@end
