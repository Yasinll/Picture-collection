//
//  ViewController.m
//  图片采集
//
//  Created by PatrickY on 2018/1/3.
//  Copyright © 2018年 PatrickY. All rights reserved.
//

#import "ViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>


@interface ViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (strong, nonatomic) UIImagePickerController *imagePickerController;
@property (weak, nonatomic) IBOutlet UIImageView *showImage;

@end

@implementation ViewController

- (UIImagePickerController *)imagePickerController {
    
    if (!_imagePickerController) {
        _imagePickerController = [[UIImagePickerController alloc] init];
        
        _imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        _imagePickerController.mediaTypes = [NSArray arrayWithObject:(__bridge NSString *) kUTTypeImage];
        _imagePickerController.delegate = self;
        
    }
    
    return _imagePickerController;
}


- (void)viewDidLoad {
    [super viewDidLoad];
 
}

- (IBAction)btnClick:(id)sender {
    
    //判断摄像头是否可用
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        _imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        
    }else {
        _imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        }
    
    [self presentViewController:self.imagePickerController animated:YES completion:nil];
    
}


#pragma mark -- UIImagePickerControllerDelegate
//图片采集完成处理
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    //获取媒体类型
    NSString *type = info[UIImagePickerControllerMediaType];
    if ([type isEqualToString:(__bridge NSString *) kUTTypeImage]) {
        UIImage *image = info[UIImagePickerControllerOriginalImage];
        
        _showImage.image = image;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

//取消
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
