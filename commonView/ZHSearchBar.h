//
//  ZHSearchBar.h
//  exhibition
//
//  Created by 古军 on 2020/5/29.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZHSearchBar : UITextField<UITextFieldDelegate>
+(instancetype)searchBar:(NSString *)placeholder;
@end

NS_ASSUME_NONNULL_END
