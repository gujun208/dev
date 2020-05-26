//
//  HFPhotoPickerManager.m
//  HotFitness
//
//  Created by 周吾昆 on 15/10/31.
//  Copyright © 2015年 HeGuangTongChen. All rights reserved.
//

#import "KKPhotoPickerManager.h"
#import "DNImagePickerController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "DNAsset.h"
@interface KKPhotoPickerManager()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,DNImagePickerControllerDelegate,UIDocumentPickerDelegate>

@property (nonatomic, weak) UIViewController *fromController;
@property (nonatomic, copy) CompelitionBlock completionBlcok;
@property (nonatomic, copy) CompelitionFileBlock completionfileBlcok;
@property(nonatomic, strong) NSMutableArray *imageArray; //拍照或者相册获取图片
@property(nonatomic, strong) NSArray *imageAsset;

@end
@implementation KKPhotoPickerManager
//单例
+ (instancetype)shareInstace {
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once (&once, ^{
        sharedInstance = [[KKPhotoPickerManager alloc] init];
        [[NSNotificationCenter defaultCenter]addObserver:sharedInstance selector:@selector(callBackImageData:) name:@"finishedInvertImage" object:nil];
    });
    return sharedInstance;
}
//数据回调
- (void)callBackImageData:(NSNotification *)noti{
    NSDictionary *dict = noti.userInfo;
    NSInteger num = [[dict valueForKey:@"number"] integerValue];
    if (num == self.imageAsset.count - 1) {
        self.completionBlcok(self.imageArray,1);
    }
}
//actionSheet提示
- (void)showActionSheetInView:(UIView *)inView
               fromController:(UIViewController *)fromController
                   completionBlock:(CompelitionBlock)completionBlock{
    self.completionBlcok = [completionBlock copy];
    self.fromController = fromController;

    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"选择照片" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *photo = [UIAlertAction actionWithTitle:@"拍照上传" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {// 拍照
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self.fromController presentViewController:picker animated:YES completion:nil];
    }];
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:NSLocalizedString(@"cancel", nil) style:UIAlertActionStyleDestructive handler:nil];
//    [alertVc addAction:album];//拜访只能拍照，不能从相册选
    [alertVc addAction:photo];
    [alertVc addAction:cancle];
    [fromController presentViewController:alertVc animated:YES completion:nil];
    return;
}
- (void)showActionAllSheetInNum:(NSInteger )num View:(UIView *)inView
               fromController:(UIViewController *)fromController
                   completionBlock:(CompelitionBlock)completionBlock{
    self.completionBlcok = [completionBlock copy];
    self.fromController = fromController;

    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"选择照片" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *album = [UIAlertAction actionWithTitle:NSLocalizedString(@"new_add_client_photo", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {// 从相册选择
        if ([self isPhotoLibraryAvailable]) {
            DNImagePickerController *imagePicker = [[DNImagePickerController alloc] init];
            imagePicker.imagePickerDelegate = self;
            imagePicker.kDNImageFlowMaxSeletedNumber=
            num>0?num:6;
            [self.fromController presentViewController:imagePicker animated:YES completion:nil];
        }
    }];
    UIAlertAction *photo = [UIAlertAction actionWithTitle:@"拍照上传" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {// 拍照
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self.fromController presentViewController:picker animated:YES completion:nil];
    }];
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:NSLocalizedString(@"cancel", nil) style:UIAlertActionStyleDestructive handler:nil];
    [alertVc addAction:album];
    [alertVc addAction:photo];
    [alertVc addAction:cancle];
    [fromController presentViewController:alertVc animated:YES completion:nil];
    return;
}
- (void)showActionAllSheetInView:(UIView *)inView
               fromController:(UIViewController *)fromController
                   completionBlock:(CompelitionBlock)completionBlock{
    self.completionBlcok = [completionBlock copy];
    self.fromController = fromController;

    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"选择照片" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *album = [UIAlertAction actionWithTitle:NSLocalizedString(@"new_add_client_photo", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {// 从相册选择
        if ([self isPhotoLibraryAvailable]) {
            DNImagePickerController *imagePicker = [[DNImagePickerController alloc] init];
            imagePicker.imagePickerDelegate = self;
            imagePicker.kDNImageFlowMaxSeletedNumber=1;
            [self.fromController presentViewController:imagePicker animated:YES completion:nil];
        }
    }];
    UIAlertAction *photo = [UIAlertAction actionWithTitle:@"拍照上传" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {// 拍照
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self.fromController presentViewController:picker animated:YES completion:nil];
    }];
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:NSLocalizedString(@"cancel", nil) style:UIAlertActionStyleDestructive handler:nil];
    [alertVc addAction:album];
    [alertVc addAction:photo];
    [alertVc addAction:cancle];
    [fromController presentViewController:alertVc animated:YES completion:nil];
    return;
}

- (void)showAllSheetInView:(UIView *)inView
               fromController:(UIViewController *)fromController
                   completionBlock:(CompelitionBlock)completionBlock{
    self.completionBlcok = [completionBlock copy];
    self.fromController = fromController;

    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"选择照片" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *album = [UIAlertAction actionWithTitle:NSLocalizedString(@"new_add_client_photo", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {// 从相册选择
        if ([self isPhotoLibraryAvailable]) {
            DNImagePickerController *imagePicker = [[DNImagePickerController alloc] init];
            imagePicker.imagePickerDelegate = self;
            imagePicker.kDNImageFlowMaxSeletedNumber=1;
            [self.fromController presentViewController:imagePicker animated:YES completion:nil];
        }
    }];
    UIAlertAction *photo = [UIAlertAction actionWithTitle:@"拍照上传" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {// 拍照
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self.fromController presentViewController:picker animated:YES completion:nil];
    }];
    UIAlertAction *file = [UIAlertAction actionWithTitle:@"选择文件" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSArray *documentTypes = @[@"public.content", @"public.text", @"public.source-code ", @"public.image", @"public.audiovisual-content", @"com.adobe.pdf", @"com.apple.keynote.key", @"com.microsoft.word.doc", @"com.microsoft.excel.xls", @"com.microsoft.powerpoint.ppt"];
        UIDocumentPickerViewController *documentPicker = [[UIDocumentPickerViewController alloc] initWithDocumentTypes:documentTypes inMode:UIDocumentPickerModeOpen];
        documentPicker.delegate = self;
        documentPicker.modalPresentationStyle = UIModalPresentationFullScreen;
        [self.fromController presentViewController:documentPicker animated:YES completion:nil];

    }];
    
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:NSLocalizedString(@"cancel", nil) style:UIAlertActionStyleDestructive handler:nil];
    [alertVc addAction:album];
    [alertVc addAction:photo];
//    [alertVc addAction:file];//若要拍照/相册/选取文件同时都可以选择，则打开此项注释，且做好文件回调操作
    [alertVc addAction:cancle];
    [fromController presentViewController:alertVc animated:YES completion:nil];
    return;
}

- (void)showFileSheetInView:(UIView *)inView
fromController:(UIViewController *)fromController
            completionBlock:(CompelitionFileBlock)completionBlock{
    
    self.completionfileBlcok = [completionBlock copy];
    self.fromController = fromController;

    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"文件目录" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *file = [UIAlertAction actionWithTitle:@"选择文件" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSArray *documentTypes = @[@"public.content", @"public.text", @"public.source-code ", @"public.image", @"public.audiovisual-content", @"com.adobe.pdf", @"com.apple.keynote.key", @"com.microsoft.word.doc", @"com.microsoft.excel.xls", @"com.microsoft.powerpoint.ppt"];
        UIDocumentPickerViewController *documentPicker = [[UIDocumentPickerViewController alloc] initWithDocumentTypes:documentTypes inMode:UIDocumentPickerModeOpen];
        
        documentPicker.delegate = self;
        documentPicker.modalPresentationStyle = UIModalPresentationFullScreen;
        [self.fromController presentViewController:documentPicker animated:YES completion:nil];
        
    }];
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:NSLocalizedString(@"cancel", nil) style:UIAlertActionStyleDestructive handler:nil];

    [alertVc addAction:file];
    [alertVc addAction:cancle];
    [fromController presentViewController:alertVc animated:YES completion:nil];
    return;
}

- (void)showCamerafromController:(UIViewController *)fromController completionBlock:(CompelitionBlock)completionBlock//Flutter调相机
{
    self.completionBlcok = [completionBlock copy];
    self.fromController = fromController;

    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self.fromController presentViewController:picker animated:YES completion:nil];
    return;
}
- (void)showPhotofromController:(UIViewController *)fromController completionBlock:(CompelitionBlock)completionBlock//Flutter调相册
{
    self.completionBlcok = [completionBlock copy];
    self.fromController = fromController;

    if ([self isPhotoLibraryAvailable]) {
        DNImagePickerController *imagePicker = [[DNImagePickerController alloc] init];
        imagePicker.imagePickerDelegate = self;
        imagePicker.kDNImageFlowMaxSeletedNumber=6;
        [self.fromController presentViewController:imagePicker animated:YES completion:nil];
    }
    return;
}


#pragma mark - UIImagePickerControllerDelegate
// 拍照
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    __block UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    
    if (image && self.completionBlcok) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.imageArray removeAllObjects];
                [self.imageArray addObject:image];
                //照片回传
                self.completionBlcok(self.imageArray,2);
            });
        });
    }
    return;
}

// 取消
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:^(){
    }];
}

#pragma mark  ===== 选择照片 =====
#pragma mark - DNImagePickerControllerDelegate
//从相册读取照片,保存到本地数组
- (void)dnImagePickerController:(DNImagePickerController *)imagePickerController sendImages:(NSArray *)imageAssets isFullImage:(BOOL)fullImage
{
    [self loadImageWithImageAssets:imageAssets];
    self.imageAsset = imageAssets;
}

#pragma mark  加载相册图片
- (void)loadImageWithImageAssets:(NSArray *)imageAssets{
    //清除上次获取的图片
    [self.imageArray removeAllObjects];
    //转换图片格式
    for ( int i = 0; i<imageAssets.count; i++) {
        DNAsset *dnasset = imageAssets[i];
        ALAssetsLibrary *lib = [ALAssetsLibrary new];
        __weak typeof(self) weakSelf = self;
        [lib assetForURL:dnasset.url resultBlock:^(ALAsset *asset){
            __strong typeof(weakSelf) strongSelf = weakSelf;
            if (asset) {
                [strongSelf setImageViewWithasset:asset index:i];
            } else {
                [lib enumerateGroupsWithTypes:ALAssetsGroupPhotoStream
                                   usingBlock:^(ALAssetsGroup *group, BOOL *stop)
                 {
                     [group enumerateAssetsWithOptions:NSEnumerationReverse
                                            usingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
                                                
                                                if([[result valueForProperty:ALAssetPropertyAssetURL] isEqual:dnasset.url])
                                                {
                                                    [strongSelf setImageViewWithasset:result index:i];
                                                    *stop = YES;
                                                }
                                            }];
                 }
                                 failureBlock:^(NSError *error)
                 {
                     [strongSelf setImageViewWithasset:nil index:i];
                 }];
            }
            
            NSDictionary *dict = @{@"number":[NSString stringWithFormat:@"%d",i]};
            [[NSNotificationCenter defaultCenter]postNotificationName:@"finishedInvertImage" object:nil userInfo:dict];
        } failureBlock:^(NSError *error){
            __strong typeof(weakSelf) strongSelf = weakSelf;
            [strongSelf setImageViewWithasset:nil index:i];
        }];
    }
}

//设置图片
- (void)setImageViewWithasset:(ALAsset *)asset index:(int)index{
    if (!asset) {
        return;
    }
    UIImage *image = [UIImage imageWithCGImage:asset.defaultRepresentation.fullScreenImage];
    [self.imageArray addObject:image];
}
//取消选择照片
- (void)dnImagePickerControllerDidCancel:(DNImagePickerController *)imagePicker
{
    [imagePicker dismissViewControllerAnimated:YES completion:^{
    }];
}

#pragma mark - UIDocumentPickerDelegate
- (void)documentPicker:(UIDocumentPickerViewController *)controller didPickDocumentAtURL:(NSURL *)url{
    
    BOOL fileUrlAuthozied = [url startAccessingSecurityScopedResource];
    if(fileUrlAuthozied){
        NSFileCoordinator *fileCoordinator = [[NSFileCoordinator alloc] init];
        NSError *error;
        __block NSData *fileData;
        [fileCoordinator coordinateReadingItemAtURL:url options:0 error:&error byAccessor:^(NSURL *newURL) {
            
            NSString *fileName = [newURL lastPathComponent];
            NSString *fileStr = [NSString stringWithContentsOfURL:newURL encoding:NSUTF8StringEncoding error:nil];
            if (self.completionfileBlcok) {
                self.completionfileBlcok(newURL,fileName);
            }
            [controller dismissViewControllerAnimated:YES completion:NULL];
            
        }];
        [url stopAccessingSecurityScopedResource];
        
    }else{
        //Error handling
        
    }
}


#pragma mark  ===== 判断手机是否有各种权限 =====

- (BOOL) isCameraAvailable{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}
- (BOOL) isPhotoLibraryAvailable{
    return [UIImagePickerController isSourceTypeAvailable:
            UIImagePickerControllerSourceTypePhotoLibrary];
}
- (BOOL)canTakePhoto {
    BOOL result = YES;
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied) {
        result = NO;
    }
    return result;
}
- (BOOL) cameraSupportsMedia:(NSString *)paramMediaType sourceType:(UIImagePickerControllerSourceType)paramSourceType{
    __block BOOL result = NO;
    if ([paramMediaType length] == 0) {
        return NO;
    }
    NSArray *availableMediaTypes = [UIImagePickerController availableMediaTypesForSourceType:paramSourceType];
    [availableMediaTypes enumerateObjectsUsingBlock: ^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *mediaType = (NSString *)obj;
        if ([mediaType isEqualToString:paramMediaType]){
            result = YES;
            *stop= YES;
        }
    }];
    return result;
}

#pragma mark  ===== 懒加载 =====
- (NSMutableArray *)imageArray {
    if (_imageArray == nil) {
        _imageArray = [NSMutableArray array];
    }
    return _imageArray;
}
- (NSArray *)imageAsset {
    if (_imageAsset == nil) {
        _imageAsset = [[NSArray alloc]init];
    }
    return _imageAsset;
}
@end
