//
//  ZHExhibitionProductDteailViewController.m
//  exhibition
//
//  Created by 古军 on 2020/5/30.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "ZHExhibitionProductDteailViewController.h"

@interface ZHExhibitionProductDteailViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) ZHSearchBar       * searchBar;

@end

@implementation ZHExhibitionProductDteailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.searchBar =[ZHSearchBar searchBar:@"搜索展品"];
    self.searchBar.returnKeyType = UIReturnKeySearch;
    self.searchBar.delegate = self;
    self.navigationItem.titleView = self.searchBar;
    
    
    UIButton *searchButton = [UIButton buttonWithType:UIButtonTypeSystem];
    searchButton.frame = CGRectMake(0, 0, 20, 30);
    [searchButton setImage:ImageName(@"icon_nar_search_normal") forState:UIControlStateNormal];
    [searchButton addTarget:self action:@selector(SearchBarBtnAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:searchButton];
    self.navigationItem.rightBarButtonItem = rightItem;

    self.view.autoresizesSubviews = NO;

}

- (void)SearchBarBtnAction{
    
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    
    return YES;
}

@end
