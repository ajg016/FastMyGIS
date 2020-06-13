//
//  WMSMapServiceLayer.m
//  FastIOSMap
//
//  Created by Apple on 14-11-11.
//  Copyright (c) 2014年 Fast. All rights reserved.
//

#import "WMSMapServiceLayer.h"

@interface WMSMapServiceLayer()
@property (nonatomic, strong, readwrite) AGSEnvelope *fullEnvelope;
@property (nonatomic, strong, readwrite) AGSSpatialReference *spatialReference;
@end

@implementation WMSMapServiceLayer
@synthesize fullEnvelope = _fullEnvelope;
@synthesize spatialReference = _spatialReference;

- (id) initLayerWithUrl:(NSString *)url envelope:(AGSEnvelope*)fullEnvelope
{
    self = [super init];
    if (self) {
        _spatialReference = fullEnvelope.spatialReference;
        _fullEnvelope = fullEnvelope;
        self.url = url;
        self.version = @"1.1.0";
        self.format = @"image/png";
        self.styles = @"";
        self.srs = @"EPSG:4326";
        self.scalar = [NSNumber numberWithDouble:1.0];
        [self layerDidLoad];
    }
    return self;
}

- (void) requestImageWithWidth:(NSInteger)width height:(NSInteger)height envelope:(AGSEnvelope *)env timeExtent:(AGSTimeExtent *)timeExtent
{
    NSString* imgUrl =self.url;
    NSUInteger index = [self.url rangeOfString:@"?"].location;
    NSString* perfix = index == NSNotFound ? @"?" :@"&";
    imgUrl = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@%@%@%s%@%s%f%@%f%@%f%@%f",self.url,perfix,@"SERVICE=WMS&VERSION=",self.version,@"&REQUEST=GetMap&LAYERS=",self.wmsLayer,@"&SRS=",self.srs,@"&FORMAT=",self.format,@"&WIDTH=",[NSNumber numberWithFloat:floorf(self.mapView.bounds.size.width)],"&HEIGHT=",[NSNumber numberWithFloat:floorf(self.mapView.bounds.size.height)],"&BBOX=",self.mapView.visibleAreaEnvelope.xmin,@",",self.mapView.visibleAreaEnvelope.ymin,@",",self.mapView.visibleAreaEnvelope.xmax,@",",self.mapView.visibleAreaEnvelope.ymax];
    UIImage* img = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imgUrl]]];
//    if ([env intersectsWithEnvelope:self.fullEnvelope]) {
//        if ([self.format isEqual:@"image/jpeg"]) {
            [self setImageData:UIImageJPEGRepresentation(img,0.5) forEnvelope:self.mapView.visibleAreaEnvelope];
//        }
//        else
//        {
//            [self setImageData:UIImagePNGRepresentation(img) forEnvelope:self.mapView.visibleAreaEnvelope];
//        }
//    }
//    else
//    {
//        [self setImageData:nil forEnvelope:self.mapView.visibleAreaEnvelope];
//    }
}






@end