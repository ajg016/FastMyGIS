//
//  WMSMapServiceLayer.h
//  FastIOSMap
//
//  Created by Apple on 14-11-11.
//  Copyright (c) 2014年 Fast. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <ArcGIS/ArcGIS.h>

@interface WMSMapServiceLayer : AGSDynamicLayer
{
}
@property(strong,nonatomic) NSString* url;
@property(strong,nonatomic) NSString* version;
@property(strong,nonatomic) NSString* format;
@property(strong,nonatomic) NSString* wmsLayer;
@property(strong,nonatomic) NSString* styles;
@property(strong,nonatomic) NSString* srs;
@property(strong,nonatomic) NSNumber* scalar;

- (id) initLayerWithUrl:(NSString *)url envelope:(AGSEnvelope*)env;
@end