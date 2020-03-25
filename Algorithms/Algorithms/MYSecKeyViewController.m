//
//  MYSecKeyViewController.m
//  Algorithms
//
//  Created by 温明妍 on 2020/3/6.
//  Copyright © 2020 温明妍. All rights reserved.
//

#import "MYSecKeyViewController.h"
#import <Masonry/Masonry.h>

@interface MYSecKeyViewController ()

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UIButton *publicButton;
@property (nonatomic, strong) UIButton *republicButton;
@property (nonatomic, strong) UIButton *privateButton;
@property (nonatomic, strong) UIButton *reprivateButton;
@property (nonatomic, assign) SecKeyRef publicKeyRef;
@property (nonatomic, assign) SecKeyRef privateKeyRef;
@property (nonatomic, strong) NSData *publicData;
@property (nonatomic, strong) NSData *privateData;
@end

@implementation MYSecKeyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.button];
    [self.view addSubview:self.publicButton];
    [self.view addSubview:self.privateButton];
    [self.view addSubview:self.republicButton];
    [self.view addSubview:self.reprivateButton];
    self.view.backgroundColor = UIColor.whiteColor;
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
    [self.publicButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.button.mas_bottom);
    }];
    [self.privateButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.publicButton.mas_bottom);
    }];
    [self.republicButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.privateButton.mas_bottom);
    }];
    [self.reprivateButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.republicButton.mas_bottom);
    }];
}

- (void)onClickButton {
    NSDictionary *privateKeyParams = @{(__bridge id)kSecAttrIsPermanent : @(NO)};
    NSDictionary *publicKeyParams = @{(__bridge id)kSecAttrIsPermanent : @(NO)};
    NSDictionary *parameters;
    if (@available(iOS 10.0, *)) {
        parameters = @{(__bridge NSString *)kSecAttrKeyType : (__bridge NSString *)kSecAttrKeyTypeECSECPrimeRandom,
                       (__bridge NSString *)kSecAttrKeySizeInBits : @(256),
                       (__bridge NSString *)kSecPublicKeyAttrs : publicKeyParams,
                       (__bridge NSString *)kSecPrivateKeyAttrs : privateKeyParams};
        
        
    } else {
        parameters = @{(__bridge NSString *)kSecAttrKeyType : (__bridge NSString *)kSecAttrKeyTypeEC,
                       (__bridge NSString *)kSecAttrKeySizeInBits : @(256),
                       (__bridge NSString *)kSecPublicKeyAttrs : publicKeyParams,
                       (__bridge NSString *)kSecPrivateKeyAttrs : privateKeyParams};
    }
    SecKeyRef publicKey;
    SecKeyRef privateKey;
    
    CFDictionaryRef cfparameters = (__bridge CFDictionaryRef)parameters;
    OSStatus state = SecKeyGeneratePair(cfparameters, &publicKey, &privateKey);
    self.publicKeyRef = publicKey;
    self.privateKeyRef = privateKey;
    NSLog(@"state = %d",state);
    
}

- (void)onClickPublic {
    NSData *data = [self dataWithSecKey:self.publicKeyRef];
    self.publicData = data;
    NSLog(@"onClickPublic data = %@",data);
}

- (void)onClickPrivate {
    NSData *data = [self dataWithSecKey:self.privateKeyRef];
    self.privateData = data;
    NSLog(@"onClickPrivate data = %@",data);
}

- (void)onClickrePrivate {
    NSDictionary *parameters;
    CFErrorRef erroref;
    if (@available(iOS 10.0, *)) {
        parameters = @{
            (__bridge NSString *)kSecAttrKeyType : (__bridge NSString *)kSecAttrKeyTypeECSECPrimeRandom,
            (__bridge NSString *)kSecAttrKeyClass : (__bridge id)kSecAttrKeyClassPrivate,
        };
        
        
    } else {
        parameters = @{
            (__bridge NSString *)kSecAttrKeyType : (__bridge NSString *)kSecAttrKeyTypeEC,
            (__bridge NSString *)kSecAttrKeyClass : (__bridge id)kSecAttrKeyClassPrivate,
        };
    }
    CFDictionaryRef cfparameters = (__bridge CFDictionaryRef)parameters;
    SecKeyRef publicRef =
    SecKeyCreateWithData((CFDataRef)self.privateData, cfparameters, &erroref);
    NSLog(@"publicRef");

}

- (void)onClickrePublic {
    NSDictionary *parameters;
       CFErrorRef erroref;
       if (@available(iOS 10.0, *)) {
           parameters = @{
               (__bridge NSString *)kSecAttrKeyType : (__bridge NSString *)kSecAttrKeyTypeECSECPrimeRandom,
               //                       (__bridge NSString *)kSecAttrKeySizeInBits : @(256),
               //                       (__bridge NSString *)kSecPublicKeyAttrs : publicKeyParams,
               (__bridge NSString *)kSecAttrKeyClass : (__bridge id)kSecAttrKeyClassPublic,
               //                       (__bridge NSString *)kSecPrivateKeyAttrs : privateKeyParams
               
           };
           
           
       } else {
           parameters = @{
               (__bridge NSString *)kSecAttrKeyType : (__bridge NSString *)kSecAttrKeyTypeEC,
               //                       (__bridge NSString *)kSecAttrKeySizeInBits : @(256),
               //                       (__bridge NSString *)kSecPublicKeyAttrs : publicKeyParams,
               (__bridge NSString *)kSecAttrKeyClass : (__bridge id)kSecAttrKeyClassPublic,
               //                       (__bridge NSString *)kSecPrivateKeyAttrs : privateKeyParams
               
           };
       }
       CFDictionaryRef cfparameters = (__bridge CFDictionaryRef)parameters;
       SecKeyRef publicRef =
       SecKeyCreateWithData((CFDataRef)self.publicData, cfparameters, &erroref);
       NSLog(@"publicRef");

}

- (NSData *)dataWithSecKey:(SecKeyRef)secKey {
    SecKeyRef key = secKey;
    CFErrorRef error = NULL;
    NSData* keyData = (NSData*)CFBridgingRelease(  // ARC takes ownership
                           SecKeyCopyExternalRepresentation(key, &error)
                       );
    if (!keyData) {
        NSError *err = CFBridgingRelease(error);  // ARC takes ownership
        NSLog(@"err = %@",err);
    }
    return keyData;
}

- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button setTitle:@"create sec key" forState:UIControlStateNormal];
        [_button setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(onClickButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (UIButton *)publicButton {
    if (!_publicButton) {
        _publicButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_publicButton addTarget:self action:@selector(onClickPublic) forControlEvents:UIControlEventTouchUpInside];
        [_publicButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        [_publicButton setTitle:@"public " forState:UIControlStateNormal];
    }
    return _publicButton;
}

- (UIButton *)privateButton {
    if (!_privateButton) {
        _privateButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_privateButton addTarget:self action:@selector(onClickPrivate) forControlEvents:UIControlEventTouchUpInside];
        [_privateButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        [_privateButton setTitle:@"private " forState:UIControlStateNormal];
    }
    return _privateButton;
}

- (UIButton *)reprivateButton {
    if (!_reprivateButton) {
        _reprivateButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_reprivateButton addTarget:self action:@selector(onClickrePrivate) forControlEvents:UIControlEventTouchUpInside];
        [_reprivateButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        [_reprivateButton setTitle:@"reprivate " forState:UIControlStateNormal];
    }
    return _reprivateButton;
}

- (UIButton *)republicButton {
    if (!_republicButton) {
        _republicButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_republicButton addTarget:self action:@selector(onClickrePublic) forControlEvents:UIControlEventTouchUpInside];
        [_republicButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        [_republicButton setTitle:@"republic " forState:UIControlStateNormal];
    }
    return _republicButton;
}

@end
